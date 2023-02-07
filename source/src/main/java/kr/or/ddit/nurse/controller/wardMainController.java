package kr.or.ddit.nurse.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.nurse.service.WardService;
import kr.or.ddit.nurse.vo.CexVO;
import kr.or.ddit.nurse.vo.WardVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/nurse")
public class wardMainController {
	
	@Inject
	private WardService service;
	
	@GetMapping("/wardMain")
	public String cexView() {
		String viewName = null;
		viewName = "nurse/wardMain";
		
		return viewName;
	}
	
	@ResponseBody
	@GetMapping("/wardPatientList")
	public List<WardVO> cexWaitList() {
		List<WardVO> list = service.retrieveWardPatientList();
		return list;
	}
}
