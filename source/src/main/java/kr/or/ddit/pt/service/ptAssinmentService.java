package kr.or.ddit.pt.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.commons.vo.PtAssinmentVO;
import kr.or.ddit.enumpkg.ServiceResult;
import lombok.extern.slf4j.Slf4j;

public interface ptAssinmentService {
	
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
	 * 물리치료실 Bed에 상태가 변경된 (update)
	 * @return
	 */
	public int ptBedFull(PtAssinmentVO ptAssinmentVO);
	
	/**
	 * 환자 검색 리스트
	 * @param map
	 * @return
	 */
	public List<PatientVO> searchPatienList(Map<String, String>map);
	
}
