package kr.or.ddit.commons.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/employee")
public class MyPageController {
	
	@GetMapping("/mypage")
	public String enterMyPageView() {
		return "commons/myPage";
	}
	
	
	@GetMapping("/edit")
	public String enterUpdateView() {
		return "commons/myPageEdit";
	}
	
	@PostMapping("/edit")
	public String updateInfo() {
		
		
		return "commons/myPage"; 
	}
}
