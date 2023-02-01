package kr.or.ddit.doctor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ICD")
public class ICDListController {
	
	public String listData() {
		
		
		return "jsonView";
	}
}
