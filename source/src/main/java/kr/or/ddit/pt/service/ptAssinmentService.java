package kr.or.ddit.pt.service;

import java.util.List;

import kr.or.ddit.commons.vo.PtAssinmentVO;

public interface ptAssinmentService {
	
	/**
	 * 물리치료실 대기환자 목록 조회
	 * @param ptAssinmentVO
	 * @return
	 */
	public List<PtAssinmentVO> ptAssinmentVOList(PtAssinmentVO ptAssinmentVO);
}
