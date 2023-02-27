package kr.or.ddit.pt.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

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

@Mapper
public interface PtAssinmentDAO {

	/**
	 * 물리치료실 대기 환자 목록 조회
	 * @param ptAssinmentVO
	 * @return PtAssinmentVO
	 */
	public List<PtAssinmentVO> selectPtRoomList(PtAssinmentVO ptAssinmentVO);

	/**
	 * 물리치료실 bed 상태
	 * @param 
	 * @return PtAssinmentVO
	 */
	public List<PtAssinmentVO> selectPtBedList();
	
	/**
	 * 치료일지 select
	 * @return
	 */
	public List<PtAssinmentVO> selectPtDocument();
	
	/**
	 * 물리치료실 bed에 환자 배정(수정)
	 * @param PtAssinmentVO
	 * @return int
	 */
	public int updatePtBedFull(PtAssinmentVO ptAssinmentVO);
	
	/**
	 * 대기히스토리 추가(대기중->치료중) Insert
	 * @param rcpNo
	 */
	public int insertCureListChange(String rcpNo);
	
	
	/**
	 * 물리치료실 bed 치료완료처리 update
	 * @param
	 * @return
	 */
	public int updatePtBedEmpty(PtAssinmentVO ptAssinmentVO);
	
	/**
	 * 대기히스토리 추가(치료중->치료완료) insert
	 * @param waitHistoryVO
	 */
	public int insertCompletionChange(String rcpNo);
	
	/**
	 * 처음 화면에 들어가면 환자 조회에서 
	 * 병원 내부 환자 List 출력됨
	 * 환자 List
	 * @param map
	 * @return
	 */
	public List<PatientVO> selectPatientList(Map<String, String> map);
	
	/**
	 * 환자 조회(검색)
	 * @param map
	 * @return
	 */
	public List<PatientVO> searchPatients(Map<String, String> map);
	
	/**
	 * 환자 치료일지 검색(검색)
	 * @param map
	 * @return
	 */
	public List<PtAssinmentVO> searchAgoDocu(Map<String, String> map);

	
	public ReceptionVO selectPatient(String rcpNo);
	
	
	/**
	 * 물리치료기록서 조회
	 * @param ptDocumentVO
	 * @return
	 */
	public List<PtDocumentVO> selectPtDocumentAgo();
	
	/**
	 * 환자 차트 조회
	 * @param map
	 * @return TrmChartVO
	 */
	public List<TrmChartVO> selectptChart(TrmChartVO trmChartVO);
	
	/**
	 * 환자 치료일지 작성
	 * @param ptAssinmentVO
	 * @return
	 */
	public int insertCureWrite(PtAssinmentVO ptAssinmentVO);
	
}
