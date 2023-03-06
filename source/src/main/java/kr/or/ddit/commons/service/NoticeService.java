package kr.or.ddit.commons.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.commons.vo.EmployeeVO;
import kr.or.ddit.commons.vo.NoticeVO;
import kr.or.ddit.commons.vo.WorkingStatusVO;

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
 * 2023. 2. 25.      위대현       풀캘린더 추가
 * Copyright (c) 2023 by DDIT All right reserved
 *      </pre>
 */
public interface NoticeService {
	
	/**
	 * 공지사항 조회
	 */
	public List<NoticeVO> selectNoticeList();
	public NoticeVO retreiveNotice(int ntcCd);
	
	/**
	 * 공지사항 수정하기
	 * @param ntcCd
	 * @return
	 */
	public int modifyNotice(NoticeVO noticeVO);
	
	/**
	 * 공지사항 삭제하기
	 * @param ntcCd
	 * @return
	 */
	public int removeNotice(int ntcCd);
	
	/**
	 * 공지사항 Insert
	 * @param noticeVO
	 * @return
	 */
	public int createWriteInsert(NoticeVO noticeVO);

	/**
	 * 등록된 근무상태 모두 조회
	 * @return
	 */
	public List<WorkingStatusVO> retrieveScheduleList();

	/**
	 * 스케줄 시간 등록
	 * @param map
	 * @return
	 */
	public int createschedule(Map<String, Object> map);

	/**
	 * 직원명단 조회
	 * @return
	 */
	public List<EmployeeVO> retrieveEmpList();

	/**
	 * 스케줄 번호에 해당하는 스케줄 정보를 조회
	 * @param wsNo
	 * @return
	 */
	public WorkingStatusVO retrieveScheduleDetail(String wsNo);
	
	/**
	 * 근무상태 리스트 조회
	 * @return List<WorkingStatusVO>
	 */
	public List<WorkingStatusVO> retrieveWsOption();

	/**
	 * 근무상태 수정
	 * @param map
	 * @return 성공/실패
	 */
	public int modifyWs(Map<String, String> map);

	/**
	 * 근무상태 삭제
	 * @param map
	 * @return 성공/실패
	 */
	public int removeWs(Map<String, String> map);

	/**
	 * 일일 접수 환자 수 조회
	 * @param map
	 * @return
	 */
	public int retrieveCountReception(Map<String, String> map);
	
	
}
