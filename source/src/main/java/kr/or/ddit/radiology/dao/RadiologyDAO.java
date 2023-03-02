package kr.or.ddit.radiology.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.commons.vo.DiagHistoryVO;
import kr.or.ddit.commons.vo.FilmAtchDetailVO;
import kr.or.ddit.commons.vo.FilmAtchVO;
import kr.or.ddit.commons.vo.FilmCateVO;
import kr.or.ddit.commons.vo.PagingVO;
import kr.or.ddit.commons.vo.SymptomVO;
import kr.or.ddit.commons.vo.TrmChartVO;
import kr.or.ddit.commons.vo.WaitHistoryVO;

/**
 * <pre>
 * 촬영기록관리(CRUD)를 위한 Persistence Layer
 * </pre>
 * @author 이하예
 * @since 2023. 2. 3.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                       수정자                                수정내용
 * --------     --------    ----------------------
 * 2023. 2. 3.   이하예                               최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */ 
@Mapper
public interface RadiologyDAO {
	public int selectTotalRecord(PagingVO<FilmCateVO> pagingVO);
	
	/**
	 * 전체 영상 기록 조회
	 * @param map
	 * @returnsize 
	 */
	public List<FilmCateVO> selectPatientList(Map<String, String> map);
	
	/**
	 * 영상 기록 선택 출력
	 * @param filmCd
	 * @return 조건에 맞는 레코드 없는 경우, null 반환
	 */
	public FilmCateVO selectPatient(@Param("filmCd") String filmCd);
	
	/**
	 * xray촬영한 환자 리스트 검색
	 * @param map
	 * @return
	 */
	public List<FilmCateVO> selectXrayPatient(Map<String, String> map);
	
	/**
	 * mri촬영한 환자 리스트 검색
	 * @param map
	 * @return
	 */
	public List<FilmCateVO> selectMriPatient(Map<String, String> map);
	
	/**
	 * 촬영 결과 전송 리스트 조회
	 * @param paNo
	 * @return 조건에 맞는 레코드 없는 경우, null 반환
	 */
	public List<WaitHistoryVO> selectChartList(@Param("paNo") String paNo);
	
	
	/**
	 * xray촬영리스트 출력
	 * @param map
	 * @returnsize 
	 */
	public List<WaitHistoryVO> selectXrayList(Map<String, String> map);
	
	/**
	 * 촬영실 대기리스트 출력
	 * @param map
	 * @returnsize 
	 */
	public List<WaitHistoryVO> selectRadiAllList(Map<String, String> map);
	

	/**
	 *  대기히스토리 추가(대기중->촬영중)
	 * @param map : {rcpNo=202302062, waitstCd=WS001, divCd=DV007}
	 * @returnsize
	 */
	public int modifyWaitListInsert(Map<String, String> map);
	
	/**
	 *  대기히스토리 추가 후 촬영중여부 구분 입력
	 * @param map : {trmCd=TC0182, rcpNo=RCP0033, waitstCd=WS001, divCd=DV002, filmCd=MRI}
	 * @returnsize
	 */
	public int changeWaitListFilmOrderInsert(Map<String, String> map);
	
	/**
	 * 환자 현재 진료 차트
	 * @param rcpNo 접수번호
	 * @return 환자의 진료차트
	 */
	public TrmChartVO selectTrmChart(@Param("rcpNo") String rcpNo);

	
	/**
	 * 선택한 환자의 차트 입력폼
	 * @param rcpNo
	 * @return
	 */
	public TrmChartVO selectFilmChart(@Param("rcpNo") String rcpNo);
	
	/**
	 * 대기 상태 select
	 * @return
	 */
	public List<WaitHistoryVO> selectWaitStatus();
	public List<FilmCateVO> selectFilmCate();
	
	/**
	 * 증상, 상병리스트 출력
	 * @param map
	 * @return
	 */
	public List<SymptomVO> selectSymptomList(Map<String, String> map);
    public List<DiagHistoryVO> selectDiagList(Map<String, String> map);
	
//	/**
//	 * 촬영실 대기 환자 리스트
//	 * @param empNo 사번
//	 * @return 대기 환자 리스트
//	 */
//	public List<WaitHistoryVO> selectWaitHistory(int empNo);
	
    
	/**
	 * 파일업로드
	 * @param object
	 * @return
	 */
	public int insertAttach(FilmAtchVO filmAtchVO);
	

	/**
	 * 파일업로드 상세
	 * @param object
	 * @return
	 */
	public int insertAttaches(List<FilmAtchDetailVO> filmAtchDetailVO);
	
	/**
	 *  파일업로드 후 촬영날짜 입력
	 * @param map : {trmCd=TC0182, filmCd=MRI}
	 * @returnsize
	 */
	public int updateFilmDate(FilmAtchVO filmatchVO);
	
	public List<FilmAtchDetailVO> selectFilmAtchDetail(String rcpNo);
	
}
