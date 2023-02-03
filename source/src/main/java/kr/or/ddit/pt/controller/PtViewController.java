package kr.or.ddit.pt.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.commons.vo.PtAssinmentVO;
import kr.or.ddit.pt.service.ptAssinmentService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/pt")
public class PtViewController {
	
	@Inject
	ptAssinmentService service;
	
	@GetMapping("/ptView")
	public String ptView( @ModelAttribute("ptAssinmentVOList")PtAssinmentVO ptAssinmentVO, Model model) {
		
		List<PtAssinmentVO> ptAssinmentVOList = service.ptAssinmentVOList(ptAssinmentVO);
		
		log.info("ptAssinmentVOList : {}",ptAssinmentVOList);
		
		model.addAttribute("ptAssinmentList", ptAssinmentVOList);
		
		String viewName = null;
		viewName = "pt/ptView";

		return viewName;
	}
}