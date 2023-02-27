package kr.or.ddit.pt.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.commons.vo.PtAssinmentVO;
import kr.or.ddit.commons.vo.PtDocumentVO;
import kr.or.ddit.commons.vo.ReceptionVO;
import kr.or.ddit.commons.vo.TrmChartVO;
import kr.or.ddit.commons.vo.WaitHistoryVO;
import kr.or.ddit.pt.dao.PtAssinmentDAO;
import lombok.extern.slf4j.Slf4j;

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

@Slf4j
@Service
public class PtAssinmentServiceImpl implements PtAssinmentService {
	
	@Inject
	PtAssinmentDAO ptdao;
	
	/**
	 * 물리치료실 대기 환자 목록 조회
	 * retrievePtRoomList
	 */
	@Override
	public List<PtAssinmentVO> retrievePtRoomList(PtAssinmentVO ptAssinmentList) {
		List<PtAssinmentVO> ptList = ptdao.selectPtRoomList(ptAssinmentList);
		log.info("ptList : {}",ptList);
		return ptList;
	}
	
	/**
	 * 물리치료실 bed 상태출력
	 */
	@Override
	public List<PtAssinmentVO> retrievePtBedList() {
		return ptdao.selectPtBedList();
	}
	/**
	 * 진료일지 보여주기
	 */
	@Override
	public List<PtAssinmentVO> retrievePtDocument() {
		return ptdao.selectPtDocument();
	}
	
	/**
	 * 물리치료실 Bed 상태 변경/ Bed에 환자 배정
	 * Update =>(후) insert(대기중->치료중)
	 */
	@Override
	public int modifyptBedFull(PtAssinmentVO ptAssinmentVO) {
		int rowcnt = ptdao.updatePtBedFull(ptAssinmentVO);
		int insertCnt = 0;
		if (rowcnt > 0) {
			insertCnt = ptdao.insertCureListChange(ptAssinmentVO.getRcpNo());
		}
		return insertCnt;
	}
	
	/**
	 * 물리치료실 Bed 상태 변경/배드 비우기
	 * Update =>(후) insert(치료중->완료)
	 */
	@Override
	public int modifyptBedEmpty(PtAssinmentVO ptAssinmentVO) {
		int rowcnt = ptdao.updatePtBedEmpty(ptAssinmentVO);
		int insertCnt = 0;
		if(rowcnt > 0) {
			insertCnt = ptdao.insertCompletionChange(ptAssinmentVO.getRcpNo());
		}
		return insertCnt;
	}
	
	/**
	 * 초기화면 환자리스트 출력
	 */
	@Override
	public List<PatientVO> selectPatientList() {
		return ptdao.selectPatientList(null);
	}
	
	/**
	 * 환자 조회 (search)
	 */
	@Override
	public List<PatientVO> searchPatients(Map<String, String> map) {
		List<PatientVO> searchPatients = ptdao.searchPatients(map);
		return searchPatients;
	}
	
	/**
	 * 환자 치료일지 조회
	 */
	@Override
	public List<PtAssinmentVO> searchAgoDocu(Map<String, String> map) {
		List<PtAssinmentVO> searchAgoDocu = ptdao.searchAgoDocu(map);
		return searchAgoDocu;
	}

	@Override
	public ReceptionVO selectPatient(String rcpNo) {
		return ptdao.selectPatient(rcpNo);
	}
	
	/**
	 * 물리치료기록서 List 출력
	 */
	@Override
	public List<PtDocumentVO> retrievePtDocumentAgo() {
		return ptdao.selectPtDocumentAgo();
	}
	
	/**
	 * 환자 chart 조회
	 */
	@Override
	public List<TrmChartVO> retrievePtChart(TrmChartVO trmChartVO) {
		return ptdao.selectptChart(trmChartVO);
	}
	
	/**
	 * 환자 치료일지 cureWrite
	 */
	@Override
	public int createCureWrite(PtAssinmentVO ptAssinmentVO) {
		return ptdao.insertCureWrite(ptAssinmentVO);
	}

	
	
	
}
