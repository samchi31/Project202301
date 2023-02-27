package kr.or.ddit.commons.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.dao.NoticeDAO;
import kr.or.ddit.commons.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Inject
	NoticeDAO noticedao;
	
	@Override
	public List<NoticeVO> selectNoticeList(NoticeVO noticeVO) {
		List<NoticeVO> selectNoticeList = noticedao.selectNoticeList(noticeVO);
		log.info("selectNoticeList : {}" , selectNoticeList);
		
		return selectNoticeList;
	}
	
	/**
	 * 공지사항 Insert
	 */
	@Override
	public int createWriteInsert(NoticeVO noticeVO) {
		return noticedao.insertNotice(noticeVO);
	}
}
