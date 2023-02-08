package kr.or.ddit.pt.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.commons.vo.PtAssinmentVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.pt.service.ptAssinmentService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/pt")
@Controller
public class PtViewController {
	
	@Inject
	ptAssinmentService service;
	
	@GetMapping("/ptView")
	public String ptView( 
			@ModelAttribute("ptAssinmentVOList") PtAssinmentVO ptAssinmentVO, 
			Model model) {
		
		List<PtAssinmentVO> ptAssinmentVOList = service.ptAssinmentVOList(ptAssinmentVO);
		List<PtAssinmentVO> ptBedList = service.ptBedList();
		
		model.addAttribute("ptAssinmentList", ptAssinmentVOList);
		model.addAttribute("ptBedList",ptBedList);
		String viewName = null;
		viewName = "pt/ptView";

		return viewName;
	}
	//let data = {"paNo":no,"paName":name,"paReg":reg, "ptBedCd" : ptBedCd}
	@ResponseBody
	@PostMapping("/ptBedFull")
	public int ptBedFull(PtAssinmentVO ptAssinmentVO) {
		log.info("ptAssinmentVO : " + ptAssinmentVO);
		int result = service.ptBedFull(ptAssinmentVO);
		
//		int result = 1;
		return result;
	}
	
	@ResponseBody
	@PostMapping("/ptPatientSearch")
	public List patientSearch(@RequestBody Map<String, String> map) {
		log.info("searchOption : {}",map.get("searchOption"));
		log.info("searchWord : {}" , map.get("searchWord"));
		
		List<PatientVO> list = service.searchPatienList(map);
		return list;
	}
	
}