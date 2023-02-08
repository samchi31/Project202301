package kr.or.ddit.pt.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.commons.vo.PtAssinmentVO;
import kr.or.ddit.enumpkg.ServiceResult;

@Mapper
public interface PtAssinmentDAO {
	
	/**
	 * 물리치료실 대기 환자 목록 조회
	 * @param ptAssinmentVO
	 * @return
	 */
	public List<PtAssinmentVO> selectPtAssinmentList(PtAssinmentVO ptAssinmentVO);
	
	/**
	 * 물리치료실 bed 상태
	 * @param ptAssinmentVO
	 * @return
	 */
	public List<PtAssinmentVO> ptBedList();
	
	/**
	 * 물리치료실 bed 수정
	 * @param 
	 * @return
	 */
	public int ptBedFull(PtAssinmentVO ptAssinmentVO);
	
	/**
	 * 환자조회
	 * @param map
	 * @return
	 */
	public List<PatientVO> selectPatientList(Map<String, String> map);
}
