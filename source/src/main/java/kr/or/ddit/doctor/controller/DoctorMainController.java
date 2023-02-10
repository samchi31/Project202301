package kr.or.ddit.doctor.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.commons.vo.EmployeeVO;
import kr.or.ddit.commons.vo.TrmChartVO;
import kr.or.ddit.commons.vo.WaitHistoryVO;
import kr.or.ddit.doctor.service.DoctorService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/doctor")
public class DoctorMainController {
	
	@Inject
	private DoctorService service;
	
	@GetMapping("/main")
	public String enterMainView(Model model) {
		
		/*
		 * 
		 */
		model.addAttribute("waitStatus", service.retreiveWaitStatus());
		model.addAttribute("divTreat", service.retreiveDvTr());
		
		model.addAttribute("disList", service.retrieveDisList());
		model.addAttribute("symList", service.retrieveSymList());
		model.addAttribute("filmList", service.retrieveRadiList());
		model.addAttribute("goList", service.retrieveGOList());
		model.addAttribute("waitList", service.retrieveWaitHistory(1));		// kkk 로그인한 사람 잇다 치고
		
		return "doctor/doctorMain";
	}
	
	@GetMapping("/main/paNo/{paNo}")
	public String getPaInfo(
			@PathVariable int paNo
			, Model model
			) {
//		log.info("{}",paNo);
		model.addAttribute("patientInfo", service.retrievePaInfo(paNo));
		
		return "jsonView";
	}
	
	@GetMapping("/main/chartlist/{paNo}")
	public String getChartList(
			@PathVariable int paNo
			, Model model
			) {
		// 회원 과거 차트 기록 잇는지
		List<TrmChartVO> trmChartList = service.retrieveTrmChartList(paNo);
		model.addAttribute("chartList", trmChartList);		
		return "jsonView";
	}
	
	@GetMapping("/main/chart/{rcpNo}")
	public String getChart(
			@PathVariable int rcpNo
			, Model model) {
		
		model.addAttribute("chartVO", service.retrieveTrmChart(rcpNo));
		
		return "jsonView";
	}
	
	@PostMapping("/main")
	public String submitChart(
		@ModelAttribute("trmChart") TrmChartVO trmChart
//		, @AuthenticationPrincipal EmployeeVO emp
	) {
		 log.info("{}",trmChart);
		
		// 현재 로그인한 의사 사번 넣기	kkk	
		trmChart.setEmpNo(1);
		service.createTrmChart(trmChart);
		return "jsonView";
	}
	
	@PostMapping("/main/wait")
	public String changeWait(
		@ModelAttribute WaitHistoryVO waitHistoryVO
	) {
		//log.info("{}",waitHistoryVO);
		int rowcnt = service.createWaitHistory(waitHistoryVO);
		
		// websocket으로 다른 접속자들한테도 알리기
		if(rowcnt > 0) {
			
		}
		return "jsonView";
	}
}
