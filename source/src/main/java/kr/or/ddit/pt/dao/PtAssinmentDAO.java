package kr.or.ddit.pt.dao;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.vo.PtAssinmentVO;

@Mapper
public interface PtAssinmentDAO {
	
	/**
	 * 물리치료실 대기 환자 목록 조회
	 * @param ptAssinmentVO
	 * @return
	 */
	public List<PtAssinmentVO> selectPtAssinmentList(PtAssinmentVO ptAssinmentVO);
}
