package kr.or.ddit.radiology.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

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
}
