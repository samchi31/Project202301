package kr.or.ddit.doctor.controller;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.commons.vo.TrmChartVO;
import kr.or.ddit.doctor.service.DoctorService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/doctor")
public class DoctorMainController {
	
	@Inject
	DoctorService service;
	
	@GetMapping("/main")
	public String enterMainView(Model model) {
		
		/*
		 * 
		 */
		
		model.addAttribute("disList", service.retrieveDisList());
		model.addAttribute("symList", service.retrieveSymList());
		model.addAttribute("filmList", service.retrieveRadiList());
		model.addAttribute("goList", service.retrieveGOList());
		model.addAttribute("waitList", service.retrieveWaitHistory(1));		// kkk 로그인한 사람 잇다 치고
		
		return "doctor/doctorMain";
	}
	
	@GetMapping("/main/{paNo}")
	public String getPaInfo(
			@PathVariable int paNo
			, Model model
			) {
//		log.info("{}",paNo);
		model.addAttribute("patientInfo", service.retrievePaInfo(paNo));
		return "jsonView";
	}
	
	@PostMapping("/main")
	public String submitChart(
		@ModelAttribute("trmChart") TrmChartVO trmChart
	) {
		log.info("{}",trmChart);
//		service.createTrmChart(trmChart);
		return "doctor/doctorMain";
	}
}
