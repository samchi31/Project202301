package kr.or.ddit.nurse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/nurse")
public class CexViewController {
	
	@GetMapping("/cexView")
	public String cexView() {
		String viewName = null;
		viewName = "nurse/cexView";
		
		return viewName;
	}
}
