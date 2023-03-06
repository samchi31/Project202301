package kr.or.ddit.commons.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.dao.NoticeDAO;
import kr.or.ddit.commons.vo.EmployeeVO;
import kr.or.ddit.commons.vo.NoticeVO;
import kr.or.ddit.commons.vo.WorkingStatusVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Inject
	NoticeDAO noticedao;
	
	@Override
	public List<NoticeVO> selectNoticeList() {
		List<NoticeVO> selectNoticeList = noticedao.selectNoticeList();
		log.info("selectNoticeList : {}" , selectNoticeList);
		
		return selectNoticeList;
	}
	
	@Override
	public NoticeVO retreiveNotice(int ntcCd) {
		return noticedao.selectNotice(ntcCd);
	}
	
	/**
	 * 공지사항 삭제하기
	 */
	@Override
	public int removeNotice(int ntcCd) {
		return noticedao.deleteNotice(ntcCd);
	}
	/**
	 * 공지사항 수정하기
	 */
	@Override
	public int modifyNotice(NoticeVO noticeVO) {
		return noticedao.updateNotice(noticeVO);
	}
	
	/**
	 * 공지사항 Insert
	 */
	@Override
	public int createWriteInsert(NoticeVO noticeVO) {
		return noticedao.insertNotice(noticeVO);
	}

	@Override
	public List<WorkingStatusVO> retrieveScheduleList() {
		return noticedao.selectScheduleList();
	}

	@Override
	public int createschedule(Map<String, Object> map) {
		return noticedao.insertSchedule(map);
	}

	@Override
	public List<EmployeeVO> retrieveEmpList() {
		return noticedao.selectEmpList();
	}

	@Override
	public WorkingStatusVO retrieveScheduleDetail(String wsNo) {
		return noticedao.selectScheduleDetail(wsNo);
	}

	@Override
	public List<WorkingStatusVO> retrieveWsOption() {
		return noticedao.selectWsOption();
	}

	@Override
	public int modifyWs(Map<String, String> map) {
		return noticedao.updateWs(map);
	}

	@Override
	public int removeWs(Map<String, String> map) {
		return noticedao.deleteWs(map);
	}

	@Override
	public int retrieveCountReception(Map<String, String> map) {
		return noticedao.selectCountReception(map);
	}

	

	
}
