package kr.or.ddit.commons.controller;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.commons.dao.NoticeDAO;
import kr.or.ddit.commons.service.NoticeService;
import kr.or.ddit.commons.vo.EmployeeVO;
import kr.or.ddit.commons.vo.NoticeVO;
import kr.or.ddit.commons.vo.WorkingStatusVO;
import kr.or.ddit.utils.fullcalendar.FullCalendarEvent;
import kr.or.ddit.utils.fullcalendar.ScheduleFullCalendarEvent;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/notice")
@Controller
public class NoticeController {
	
	@Inject
	NoticeService noticeService;
	
	@Inject
	NoticeDAO noticeDAO;
	/**
	 * 공지사항 일반조회
	 * @param noticeVO
	 * @param model
	 * @return
	 */ 
	@GetMapping("/notice")
	public String noticeList(
			@ModelAttribute("noticeService") NoticeVO noticeVO,
			Model model
			) {
		log.info("noticeVO : " + noticeVO);
		List<NoticeVO> selectNoticeList = noticeService.selectNoticeList(noticeVO);
		model.addAttribute("selectNoticeList",selectNoticeList);
		model.addAttribute("wsOptionList",noticeService.retrieveWsOption());
		return "notice/noticeView";
		
	}
	
	//노티스 비동기 요청할 때 가져갈 수 있는 데이터..?ㅎ
	@GetMapping(value="/notice", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<NoticeVO> noticeListJson(
			@ModelAttribute("noticeService") NoticeVO noticeVO,
			Model model
			) {
		log.info("noticeVO : " + noticeVO);
		return noticeService.selectNoticeList(noticeVO);
		
		
	}
	
	/**
	 * 공지사항 Insert
	 * @param noticeVO
	 * @param reAttributes
	 * @return
	 */
	@ResponseBody
	@PostMapping(value = "/noticeWriteInsert" ) 
	public int noticeInsert(@RequestBody NoticeVO noticeVO , RedirectAttributes reAttributes) {
		int list = noticeService.createWriteInsert(noticeVO);
		log.info("나오고 있늬이 ? list {}  : ", list);
		return list;
	}
	
	
//	public List<NoticeVO>noticeDetail
//	
	
//	풀캘린더
	@RequestMapping(value="/noticeView/events", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<FullCalendarEvent<WorkingStatusVO>> json(){
		
		List<WorkingStatusVO> scheduleList = noticeService.retrieveScheduleList();
		
		return scheduleList.stream()
					.map(ScheduleFullCalendarEvent::new)
					.collect(Collectors.toList());
	}
	
	@ResponseBody
	@PostMapping("/scheduleInsert")
	public int scheduleInsert(@RequestBody Map<String, Object> map) {
		int result = noticeService.createschedule(map);
		
		return result;
	}
	
	@ResponseBody
	@GetMapping("/selectEmp")
	public List<EmployeeVO> selectEmp(){
		List<EmployeeVO> list = noticeService.retrieveEmpList();
		return list;
	}
	
	@ResponseBody
	@PostMapping("/scheduleDetailSelect")
	public WorkingStatusVO scheduleDetailSelect(@RequestBody WorkingStatusVO work) {
		String wsNo = work.getWsNo();
		WorkingStatusVO schedule = noticeService.retrieveScheduleDetail(wsNo);
		
		return schedule;
	}
	
	// 근무상태변경
	@ResponseBody
	@PostMapping("/wsUpdate")
	public int wsUpdate(@RequestBody Map<String, String> map) {
		int result = noticeService.modifyWs(map);
		return result;
	}
	
	// 근무상태삭제
	@ResponseBody
	@PostMapping("/wsDelete")
	public int wsDelete(@RequestBody Map<String, String> map) {
		int result = noticeService.removeWs(map);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/countReception")
	public int countReception(@RequestBody Map<String, String> map) {
		int result = noticeService.retrieveCountReception(map);
		return result;
	}
	
}
