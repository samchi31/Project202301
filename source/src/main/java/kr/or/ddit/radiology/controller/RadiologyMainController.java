package kr.or.ddit.radiology.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.vo.FilmCateVO;
import kr.or.ddit.commons.vo.WaitHistoryVO;
import kr.or.ddit.radiology.service.RadiologyService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/radiology")
public class RadiologyMainController {
	@Inject
	private RadiologyService service;
	
	@GetMapping("/radiologyView") //메인페이지
	public String RadiologyView() {
		String viewName = null;
		viewName = "radiology/radiologyView";
      
		return viewName;
	}
	
	@ResponseBody
	@GetMapping("/xraywait")
	public List filmXList() {
		List<WaitHistoryVO> list = service.selectXrayList();
		return list;
		
	}
	@ResponseBody
	@GetMapping("/mriwait")
	public List filmMList() {
		List<WaitHistoryVO> list = service.selectMRIList();
		return list;
		
	}
	@ResponseBody
	@GetMapping("/ctwait")
	public List filmCList() {
		List<WaitHistoryVO> list = service.selectCTList();
		return list;
		
	}
	@ResponseBody
	@GetMapping("/ultrawait")
	public List filmUList() {
		List<WaitHistoryVO> list = service.selectUltraList();
		return list;
		
	}
	
	@ResponseBody
	@GetMapping("/radiwaitinglist")
	public List RadiAllList() {
		List<WaitHistoryVO> list = service.selectRadiAllList();
		return list;
		
	}
}
