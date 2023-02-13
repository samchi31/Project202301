package kr.or.ddit.radiology.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.vo.TrmChartVO;
import kr.or.ddit.commons.vo.WaitHistoryVO;

@Mapper
public interface RadiologyWaitingListDAO {

	/**
	 * xray촬영리스트 출력
	 * @param map
	 * @returnsize 
	 */
	public List<WaitHistoryVO> selectXrayList(Map<String, String> map);
	
	/**
	 * MRI촬영리스트 출력
	 * @param map
	 * @returnsize 
	 */
	public List<WaitHistoryVO> selectMRIList(Map<String, String> map);
	
	/**
	 * CT촬영리스트 출력
	 * @param map
	 * @returnsize 
	 */
	public List<WaitHistoryVO> selectCTList(Map<String, String> map);
	
	/**
	 * 초음파촬영리스트 출력
	 * @param map
	 * @returnsize 
	 */
	public List<WaitHistoryVO> selectUltraList(Map<String, String> map);
	
	/**
	 * 촬영실 대기리스트 출력
	 * @param map
	 * @returnsize 
	 */
	public List<WaitHistoryVO> selectRadiAllList(Map<String, String> map);
	
	/**
	 *  대기히스토리 추가(대기중->촬영중)
	 * @param map : {rcpNo=202302062, waitstCd=WS001, divCd=DV007}
	 * @returnsize
	 */
	public int changeWaitListInsert(Map<String, String> map);
	
	/**
	 * 환자 현재 진료 차트
	 * @param rcpNo 접수번호
	 * @return 환자의 진료차트
	 */
	public TrmChartVO selectTrmChart(int rcpNo);
	
}
