package kr.or.ddit.doctor.service;

import java.util.List;

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
 * 2023. 2. 3.     박시윤       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
public interface DoctorService {
	
	/**
	 * 기초 자료용 전체 상병 리스트
	 * @return 상병리스트
	 */
	public List<DiseaseVO> retrieveDisList();
	
	/**
	 * 기초 자료용 전체 증상 리스트
	 * @return 증상 리스트
	 */
	public List<SymptomVO> retrieveSymList();
	
//	/**
//	 * 기초자료용 전체 검사 리스트
//	 * @return 검사 항목 리스트
//	 */
//	public List<> retrieveExamList();
	
	/**
	 * 기초 자료용 전체 촬영 항목 리스트
	 * @return 촬영 항목 리스트
	 */
	public List<FilmCateVO> retrieveRadiList();
	
	/**
	 * 기초 자료용 그룹오더 리스트 
	 * @return
	 */
	public List<GroupOrderVO> retrieveGOList();
	
	/**
	 * 선택한 환자의 진료 차트
	 * @param paNo
	 * @return
	 */
	public TrmChartVO retrieveTrmChart(int paNo);
	
	/**
	 * 환자의 과거 진료 차트 기록 리스트
	 * @param paNo
	 * @return
	 */
	public List<TrmChartVO> retrieveTrmChartList(int paNo);
	
	/**
	 * 내 진료실에 해당하는 대기실 환자 리스트
	 * @param docNo 사번
	 * @return 대기 환자 리스트 (환자번호, 환자이름, 대기상태)
	 */
	public List<WaitHistoryVO> retrieveWaitHistory(int docNo);
	
	/**
	 * 환자 상세 정보
	 * @param paNo 환자 번호
	 * @return
	 */
	public List<PatientVO> retrievePaInfo(int paNo);
	
	/**
	 * 진료 차트 작성
	 * @param trmChartVO 진료차트
	 * @return
	 */
	public int createTrmChart(TrmChartVO trmChartVO);
	
	/**
	 * 진료 차트 작성 시 증상 내역 입력
	 * @param symptomVOList
	 * @return
	 */
	public int createSymList(List<SymptomVO> symptomVOList);
	
	/**
	 * 진료 차트 작성 시 상병 내역 입력
	 * @param diseaseVOList
	 * @return
	 */
	public int createDisList(List<DiseaseVO> diseaseVOList);
	
	/**
	 * 진료 차트 작성 시 처방 내역 입력
	 * @param prescriptionVOList
	 * @return
	 */
	public int createPreList(List<PrescriptionVO> prescriptionVOList);
	
	/**
	 * 진료 차트 작성 시 영상 촬영 오더 내역 입력
	 * @param filmCateVOList
	 * @return
	 */
	public int createRadiList(List<FilmCateVO> filmCateVOList);
	
	/**
	 * 진료 후 환자의 대기 상태 변경
	 * @param waitHistoryVO
	 * @return
	 */
	public int createWaitHistory(WaitHistoryVO waitHistoryVO);
}
