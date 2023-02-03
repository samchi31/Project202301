package kr.or.ddit.doctor.controller;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.doctor.service.DoctorService;

@Controller
@RequestMapping("/doctor")
public class DoctorMainController {
	
	@Inject
	DoctorService service;
	
	@GetMapping("/main")
	public String enterMainView(Model model) {
		
		model.addAttribute("disList", service.retrieveDisList());
		model.addAttribute("symList", service.retrieveSymList());
		
		return "doctor/doctorMain";
	}
	
//	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
//	public String getRadiList() {
//		
//		
//		return "jsonView";
//	}
}
