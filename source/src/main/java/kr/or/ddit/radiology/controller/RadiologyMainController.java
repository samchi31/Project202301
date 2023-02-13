package kr.or.ddit.radiology.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.vo.FilmCateVO;
import kr.or.ddit.commons.vo.TrmChartVO;
import kr.or.ddit.commons.vo.WaitHistoryVO;
import kr.or.ddit.doctor.dao.DoctorDAO;
import kr.or.ddit.doctor.service.DoctorService;
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
	
	// 바뀐 값 가져올 컨트롤러
	@PostMapping("/changeWaitList")
	public String changeWaitList(@RequestBody Map<String, String> map) {
		log.info("map : " + map);
		
		System.out.println(map.get("radioVal"));
		
		int result = service.changeWaitListInsert(map);
		log.info("result : " + result);
		String viewName = "";
		if(result > 0) {
			log.info("등록됨 ");
			viewName = "redirect:/radiology/radiwaitinglist";
			return viewName;
		}
		else {
			viewName = "redirect:/radiology/radiologyView";
			return viewName;
		}
	}
	
}
