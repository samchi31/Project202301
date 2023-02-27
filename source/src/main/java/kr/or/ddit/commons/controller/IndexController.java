package kr.or.ddit.commons.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class IndexController {
	/*
	 * 이렇게 서블릿 주소와 lvn 매핑만 되어 있는 것은
	 * view-controller.xml 에 적어도 된다
	 */
	
	@GetMapping
	public String index() {
		return "index";
	}
	
	@GetMapping("menu")
	public String enterMenu() {
		return "menu/menuView";
	}
}
