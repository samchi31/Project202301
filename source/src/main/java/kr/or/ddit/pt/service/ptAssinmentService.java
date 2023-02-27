package kr.or.ddit.pt.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.commons.vo.PtAssinmentVO;
import kr.or.ddit.commons.vo.PtDocumentVO;
import kr.or.ddit.commons.vo.ReceptionVO;
import kr.or.ddit.commons.vo.TrmChartVO;
import kr.or.ddit.commons.vo.WaitHistoryVO;

/**
 * @author 장예지
 * @since 2023. 2. 3.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * 
 *      <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 3.      장예지       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 *      </pre>
 */

public interface PtAssinmentService {
	
	/**
	 * 물리치료실 대기환자 목록 조회
	 * @param ptAssinmentVO
	 * @return
	 */
	public List<PtAssinmentVO> retrievePtRoomList(PtAssinmentVO ptAssinmentVO);
	
	/**
	 * 물리치료실 Bed 상태
	 * @param ptAssinmentVO
	 * @return
	 */
	public List<PtAssinmentVO> retrievePtBedList();
	
	/**
	 * 환자 진료일지 첫 화면
	 * @return
	 */
	public List<PtAssinmentVO> retrievePtDocument();
	
	/**
	 * 물리치료실 Bed에 환자를 배정함 (update)
	 * @return
	 */
	public int modifyptBedFull(PtAssinmentVO ptAssinmentVO);
	
	/**
	 * 물리치료실 Bed에 환자 빼는 것 (update)
	 * @return
	 */
	public int modifyptBedEmpty(PtAssinmentVO ptAssinmentVO);
	
	/**
	 * 대기중->치료중 Insert
	 * 히스토리에 추가
	 * @param waitHistoryVO
	 * @return
	 */

	/**
	 * 환자 치료 상태를 대기 히스토리에 추가(치료중->완료)
	 * @param waitHistoryVO
	 * @return
	 */
//	public int completionChangeInsert(WaitHistoryVO waitHistoryVO);
	
	
	/**
	 * 초기 화면 환자 리스트(전체 출력)
	 * @return
	 */
	public List<PatientVO> selectPatientList();

	/**
	 * 환자 조회 (search)
	 */
	public List<PatientVO> searchPatients(Map<String, String> map);
	
	/**
	 * 환자 치료일지 검색 (search)
	 */
	public List<PtAssinmentVO> searchAgoDocu(Map<String, String> map);
	
	
	
	public ReceptionVO selectPatient(String rcpNo);
	
	/**
	 * 작성한 ptDocument List 조회 
	 * 물리치료기록서 List 출력
	 */
	public List<PtDocumentVO> retrievePtDocumentAgo();
	
	/**
	 * 환자 차트 조회
	 */
	public List<TrmChartVO> retrievePtChart(TrmChartVO trmChartVO);
	
	/**
	 * 환자 치료일지 작성 Insert
	 * @param ptAssinmentVO
	 * @return
	 */
	public int createCureWrite(PtAssinmentVO ptAssinmentVO);                                                                  
}
