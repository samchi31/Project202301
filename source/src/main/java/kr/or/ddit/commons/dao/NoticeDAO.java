package kr.or.ddit.commons.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

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
 * Copyright (c) 2023 by DDIT All right reserved
 *      </pre>
 */
@Mapper
public interface NoticeDAO {
	/**
	 * 공지사항 리스트 조회
	 * @param noticeVO
	 * @return
	 */
	public List<NoticeVO> selectNoticeList();
	
	/**
	 * 공지사항 하나 조회
	 * @param ntcCd
	 * @return
	 */
	public NoticeVO selectNotice(int ntcCd);
	
	/**
	 * 공지사항 Insert
	 * @param noticeVO
	 * @return
	 */
	public int insertNotice(NoticeVO noticeVO);
	
	/**
	 * 공지사항 Update
	 * @param noticeVO
	 * @return
	 */
	public int updateNotice(NoticeVO noticeVO);
	
	/**
	 * 공지사항 Delete
	 * @param ntcCd
	 * @return
	 */
	public int deleteNotice(int ntcCd);
	
	/**
	 * 스케쥴 조회
	 * @return List<WorkingStatusVO>
	 */
	public List<WorkingStatusVO> selectScheduleList();

	/**
	 * 스케줄 등록
	 * @param map
	 * @return
	 */
	public int insertSchedule(Map<String, Object> map);

	/**
	 * 직원목록조회
	 * @return List<EmployeeVO>
	 */
	public List<EmployeeVO> selectEmpList();

	/**
	 * 스케줄 디테일 조회
	 * @param wsNo
	 * @return WorkingStatusVO
	 */
	public WorkingStatusVO selectScheduleDetail(String wsNo);
	
	/**
	 * 스케줄 상태 항목 조회
	 * @return List<WorkingStatusVO>
	 */
	public List<WorkingStatusVO> selectWsOption();

	/**
	 * 근무상태 변경
	 * @return 성공/실패
	 */
	public int updateWs(Map<String, String> map);

	/**
	 * 근무상태 삭제
	 * @param 성공/실패
	 * @return
	 */
	public int deleteWs(Map<String, String> map);

	/**
	 * 일일 접수 환자 수 조회
	 * @param map
	 * @return
	 */
	public int selectCountReception(Map<String, String> map);
}
