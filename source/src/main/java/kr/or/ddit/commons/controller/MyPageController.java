package kr.or.ddit.commons.controller;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.service.MemberService;
import kr.or.ddit.commons.vo.EmployeeVO;
import kr.or.ddit.enumpkg.ServiceResult;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/employee")
public class MyPageController {
	
	@Inject
	MemberService service;
	
	@GetMapping("/mypage")
	public String enterMyPageView() {
		return "commons/myPage";
	}
	
	
	@GetMapping("/edit")
	public String enterUpdateView() {
		return "commons/myPageEdit";
	}
	
	@PostMapping("/edit")
	public String updateInfo(
			@ModelAttribute EmployeeVO member
			) {
		log.info("들어갔나유?{}", member);
		service.modifyMember(member);
		
		return "redirect:/employee/mypage"; 
	}
	
	@ResponseBody
	@PostMapping(value="/valid", produces="application/json;charset=UTF-8")
	public EmployeeVO checkPW(
			@RequestBody Map<String, String> password
			, @AuthenticationPrincipal(expression="realMember") EmployeeVO emp
			) {
//		log.info("{}", password.get("password"));
		String msg= null;
		ServiceResult res = service.matchPassword(password.get("password"), emp.getEmpPw());
		log.info("{}", res);
		if(res.equals(ServiceResult.OK)) {
			msg = "일치";
			return emp; 
		} else {
			msg = "불일치";
			return null;
		}
	}
}
