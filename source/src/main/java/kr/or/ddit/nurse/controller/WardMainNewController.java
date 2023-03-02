package kr.or.ddit.nurse.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.vo.DiagHistoryVO;
import kr.or.ddit.commons.vo.OperationInfomationVO;
import kr.or.ddit.commons.vo.SymptomVO;
import kr.or.ddit.nurse.service.NewWardService;
import kr.or.ddit.nurse.service.WardService;
import kr.or.ddit.nurse.vo.WardVO;
import kr.or.ddit.receiption.vo.ReceiptionVO;

@Controller
@RequestMapping("/nurse")
public class WardMainNewController {
	
	@Inject
	private WardService service;
	
	@Inject
	private NewWardService newService;
	
	@GetMapping("/wardMainNew")
	public String wardView(Model model) {
		
		model.addAttribute("intakeList", service.retrieveIntakeList());
		model.addAttribute("outputList", service.retrieveOutputList());
		model.addAttribute("dietCateList", service.retrieveDietCateList());
		
		return "nurse/wardMainNew";
	}
	
	@ResponseBody
	@GetMapping("/wardPaList")
	public List<WardVO> wardWaitList() {
		List<WardVO> list = service.retrieveWardPatientList();
		return list;
	}
	
	@ResponseBody
    @PostMapping("/wardPatientSearch")
    public List<OperationInfomationVO> wardPatientSearch(@RequestBody Map<String, String> map) {
    	
    	List<OperationInfomationVO> PatientList = newService.retrievePatientSearch(map);
    	return PatientList;
    }
	
	@ResponseBody
	@PostMapping("/diagnosisList")
	public List<DiagHistoryVO> diagnosisList(@RequestBody Map<String, String> map) {
		List<DiagHistoryVO> diagnosis = newService.retrieveDiagnosisList(map);
		return  diagnosis;
	}
}
