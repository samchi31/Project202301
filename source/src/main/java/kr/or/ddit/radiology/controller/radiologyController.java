package kr.or.ddit.radiology.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/radiology")
public class radiologyController {
   
	@GetMapping("/radiologyView")
	public String radiologyView() {
		String viewName = null;
		viewName = "radiology/radiologyView";
      
		return viewName;
	}
}
