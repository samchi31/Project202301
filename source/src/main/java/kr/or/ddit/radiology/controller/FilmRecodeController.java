package kr.or.ddit.radiology.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/radiology")
public class FilmRecodeController {
   
	@GetMapping("/filmRecodeView")
	public String filmRecodeView() {
		String viewName = null;
		viewName = "radiology/filmRecodeView";
      
		return viewName;
	}
}