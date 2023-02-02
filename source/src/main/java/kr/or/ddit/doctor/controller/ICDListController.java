package kr.or.ddit.doctor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/doctor")
public class ICDListController {
	
	@GetMapping("/ICD")
	public String listData() {
		
		return "doctor/medicineList";
	}
}
