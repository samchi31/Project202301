package kr.or.ddit.receive.service;

import java.util.List;

import kr.or.ddit.commons.vo.ReceiveDetailVO;
import kr.or.ddit.commons.vo.ReceiveVO;

/**
 * @author 박시윤
 * @since 2023. 2. 22.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 22.  박시윤       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
public interface ReceiveService {
	
	/**
	 * 수납 작성
	 * @param receive
	 * @return
	 */
	public int createReceive(ReceiveDetailVO receiveDetailVO);
	
	/**
	 * 수납 리스트 조회
	 * @param receive
	 */
	public List<ReceiveVO> retrieveReceiveList();
	
	/**
	 * 수납 조회
	 * @param recNo
	 * @return
	 */
	public ReceiveVO retrieveReceive(int recNo);
	
	/**
	 * 수납 수정
	 * @param receive
	 * @return
	 */
	public int modifyReceive(ReceiveVO receive);
	
	/**
	 * 수납 삭제
	 * @param recNo
	 * @return
	 */
	public int removeReceive(int recNo);
	
	/**
	 * 수납 상세 삽입
	 * @param receiveDetailVO
	 * @return
	 */
	public int createReceiveDetail(ReceiveDetailVO receiveDetailVO);
}
