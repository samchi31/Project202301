package kr.or.ddit.pt.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.commons.vo.PtAssinmentVO;
import kr.or.ddit.commons.vo.WaitHistoryVO;

public interface PtAssinmentService {
	
	/**
	 * 물리치료실 대기환자 목록 조회
	 * @param ptAssinmentVO
	 * @return
	 */
	public List<PtAssinmentVO> ptAssinmentVOList(PtAssinmentVO ptAssinmentVO);
	
	/**
	 * 물리치료실 Bed 상태
	 * @param ptAssinmentVO
	 * @return
	 */
	public List<PtAssinmentVO> ptBedList();
	
	/**
	 * 물리치료실 Bed에 환자를 배정함 (update)
	 * @return
	 */
	public int ptBedFull(PtAssinmentVO ptAssinmentVO);
	
	/**
	 * 물리치료실 Bed에 환자 빼는 것 (update)
	 * @return
	 */
	public int ptBedEmpty(PtAssinmentVO ptAssinmentVO);
	
	 
	/**
	 * 환자 검색 리스트
	 * @param map
	 * @return
	 */
	public List<PatientVO> searchPatienList(Map<String, String> map);
	
	/**
	 * 대기중->치료중 Insert
	 * 히스토리에 추가
	 * @param waitHistoryVO
	 * @return
	 */
	public int cureListChangeInsert(WaitHistoryVO waitHistoryVO);

	/**
	 * 환자 치료 상태를 대기 히스토리에 추가(치료중->완료)
	 * @param waitHistoryVO
	 * @return
	 */
	public int completionChangeInsert(WaitHistoryVO waitHistoryVO);

	
}
