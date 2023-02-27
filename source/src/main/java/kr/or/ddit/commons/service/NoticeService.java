package kr.or.ddit.commons.service;

import java.util.List;

import kr.or.ddit.commons.vo.NoticeVO;

/**
 * @author 장예지
 * @since 2023. 2. 13.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * 
 *      <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 13.      장예지       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 *      </pre>
 */
public interface NoticeService {
	
	/**
	 * 공지사항 조회
	 */
	public List<NoticeVO> selectNoticeList(NoticeVO noticeVO);
	
	/**
	 * 공지사항 Insert
	 * @param noticeVO
	 * @return
	 */
	public int createWriteInsert(NoticeVO noticeVO);
	
	
}
