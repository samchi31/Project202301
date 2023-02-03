package kr.or.ddit.doctor.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.vo.DiseaseVO;
import kr.or.ddit.commons.vo.FilmCateVO;
import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.commons.vo.PrescriptionVO;
import kr.or.ddit.commons.vo.SymptomVO;
import kr.or.ddit.commons.vo.TrmChartVO;
import kr.or.ddit.commons.vo.WaitHistoryVO;
import kr.or.ddit.doctor.vo.GroupOrderVO;

/**
 * @author 박시윤
 * @since 2023. 2. 3.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 3.      박시윤       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface DoctorDAO {
		
	/**
	 * 병 목록 전체
	 * @return 병 목록
	 */
	public List<DiseaseVO> selectDisList();
		
	
	/**
	 * 증상 전체 목록 가져오기
	 * @return 증상 리스트
	 */
	public List<SymptomVO> selectSymList();
	
//	/**
//	 * 검사 목록 전체 kkk
//	 * @RETURN 검사 목록
//	 */
//	public List<> selectExamList(); 
	
	/**
	 * 촬영 검사 목록 전체
	 * @return 촬영 검사 목록 
	 */
	public List<FilmCateVO> selectRadiList();

	/**
	 * 그룹오더 리스트 전체 가져오기
	 * @return 그룹오더 리스트
	 */
	public List<GroupOrderVO> selectGOList();
	
	
	/**
	 * 환자 현재 진료 차트
	 * @param paNo 환자번호
	 * @return 환자의 진료차트
	 */
	public TrmChartVO selectTrmChart(int paNo);
	
	/**
	 * 환자의 진료 차트 기록 리스트
	 * @param paNo 환자 번호
	 * @return 환자 진료 차트 기록 리스트
	 */
	public List<TrmChartVO> selectTrmChartList(int paNo);
	
	/**
	 * 내 진료실에 대기실 환자 리스트
	 * @param docNo 사번
	 * @return 대기 환자 리스트
	 */
	public List<WaitHistoryVO> selectWaitHistory(int docNo);
	
	/**
	 * 환자 상세 정보
	 * @param paNo 환자번호
	 * @return 환자 정보
	 */
	public PatientVO selectPaInfo(int paNo);	
	
	/**
	 * 진료 차트 작성
	 * @param trmChartVO 진료차트 내용
	 * @return
	 */
	public int insertTrmChart(TrmChartVO trmChartVO);
	
	/**
	 * 진료 차트 작성 시 증상 내역 입력
	 * @param symptomVOList
	 * @return
	 */
	public int insertSymList(List<SymptomVO> symptomVOList);
	
	/**
	 * 진료 차트 작성 시 상병 내역 입력
	 * @param diseaseVOList
	 * @return
	 */
	public int insertDisList(List<DiseaseVO> diseaseVOList);
	
	/**
	 * 진료 차트 작성 시 처방 내역 입력
	 * @param prescriptionVOList
	 * @return
	 */
	public int insertPreList(List<PrescriptionVO> prescriptionVOList);
	
	/**
	 * 진료 차트 작성 시 영상 촬영 오더 내역 입력
	 * @param filmCateVOList
	 * @return
	 */
	public int insertRadiList(List<FilmCateVO> filmCateVOList);
	
	/**
	 * 진료 후 환자의 대기 상태 변경
	 * @param waitHistoryVO
	 * @return
	 */
	public int insertWaitHistory(WaitHistoryVO waitHistoryVO);
	
}
