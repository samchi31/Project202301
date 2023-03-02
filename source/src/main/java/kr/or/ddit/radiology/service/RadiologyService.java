package kr.or.ddit.radiology.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.commons.vo.DiagHistoryVO;
import kr.or.ddit.commons.vo.FilmAtchDetailVO;
import kr.or.ddit.commons.vo.FilmAtchVO;
import kr.or.ddit.commons.vo.FilmCateVO;
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
public interface RadiologyService {
	

	/**
	 * 환자 리스트 조회
	 * @return
	 */
	public List<FilmCateVO> retrievePatientList();

	
	/**
	 * 환자 검색
	 * @param map
	 * @return
	 */
	public List<FilmCateVO> retrievePatientSearchList(Map<String, String> map);
	
	/**
	 * xray환자 검색
	 * @param map
	 * @return
	 */
	public List<FilmCateVO> retrieveXrayPatientSearchList(Map<String, String> map);
	
	/**
	 * mri환자 검색
	 * @param map
	 * @return
	 */
	public List<FilmCateVO> retrieveMriPatientSearchList(Map<String, String> map);
	
	/**
	 * 영상 기록 상세 조회
	 * @param filmCd
	 * @return
	 */
	public FilmCateVO retrieveFilmRecord(String filmCd);

	/**
	 * xray대기실 상황
	 * @return
	 */
	public List<WaitHistoryVO> selectXrayList();


	/**
	 * 전체 촬영실 대기상태
	 * @return
	 */
	public List<WaitHistoryVO> selectRadiAllList();
	
	/**
	 * 선택한 환자의 진료 차트
	 * @param rcpNo
	 * @return
	 */
	public TrmChartVO retrieveTrmChart(String rcpNo);
	
	
	/**
	 * 선택한 환자의 차트 입력폼
	 * @param rcpNo
	 * @return
	 */
	public TrmChartVO retrieveFilmChart(String rcpNo);
	
	/**
	 * 촬영 결과 전송 리스트 조회
	 * @return
	 */
	public List<WaitHistoryVO> selectChartList(String paNo);

	/**
	 * 대기상태 select
	 * @return
	 */
	public List<WaitHistoryVO> retreiveWaitStatus();
	public List<FilmCateVO> retrieveFilmCate();
	
	/**
	 * 증상,상병 리스트
	 * @param map
	 * @return
	 */
	public List<SymptomVO> retrieveSymptomList(Map<String, String> map);
	public List<DiagHistoryVO> retrieveDiagList(Map<String, String> map);

	/**
	 * 촬영실에 해당하는 대기실 환자 리스트
	 * @param empNo 촬영사 사번
	 * @return 대기 환자 리스트 ()
	 */
//	public List<WaitHistoryVO> retrieveWaitHistory(int empNo);

	/**
	 * 진료 후 환자의 대기 상태 변경
	 * @param waitHistoryVO
	 * @return
	 */
//	public int createWaitHistory(WaitHistoryVO waitHistoryVO);
	
	//대기히스토리 추가(대기중->촬영중)
	//map : {rcpNo=202302062, waitstCd=WS001, divCd=DV007}
	public int modifyWaitListInsert(Map<String, String> map);

	public int processAttachList(FilmAtchVO filmAtchVO);




	public int modifyFilmDate(FilmAtchVO filmatchvo);


	public List<FilmAtchDetailVO> retrieveFilmAtchDetailVO(String rcpNo);

}
