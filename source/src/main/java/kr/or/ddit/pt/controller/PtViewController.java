package kr.or.ddit.pt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pt")
public class PtViewController {
	
	@GetMapping("/ptView")
	public String ptView() {
		String viewName = null;
		viewName = "pt/ptView";

		return viewName;
	}
}