package kr.or.ddit.receive.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.vo.ReceiveDetailVO;
import kr.or.ddit.commons.vo.ReceiveVO;
import kr.or.ddit.commons.vo.TrmChartVO;
import kr.or.ddit.commons.vo.WaitHistoryVO;

/**
 * @author 작성자명
 * @since 2023. 2. 22.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일          수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 22.    박시윤       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface ReceiveDAO {
	
	
	/**
	 * 대기상태 완료인 환자 리스트
	 * @return
	 */
	public List<WaitHistoryVO> selectCompletePatientList();
	
	/**
	 * 수납 작성
	 * @param receive 
	 * @return
	 */
	public int insertReceive(ReceiveVO receive);
	
	/**
	 * 수납 상세 작성
	 * @param receiveDetailVO
	 * @return
	 */
	public int insertReceiveDetail(ReceiveDetailVO receiveDetailVO);
	
	public ReceiveVO selectReceive(int recNo);
	public List<ReceiveVO> selectReceiveList(ReceiveVO receive);
	public int updateReceive(ReceiveVO receive);
	public int deleteReceive(int recNo);
	
	
}
