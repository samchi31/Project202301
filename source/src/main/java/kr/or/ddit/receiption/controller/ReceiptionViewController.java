package kr.or.ddit.receiption.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.commons.service.PatientService;
import kr.or.ddit.commons.vo.PagingVO;
import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.enumpkg.ServiceResult;

@Controller
@RequestMapping("/receiption")
public class ReceiptionViewController {
    @Inject 
	PatientService service;
	
    @ModelAttribute("patient")
    public PatientVO patient() {
    	return new PatientVO();
    }
    
    @GetMapping("/receiptionView")
	public String receiptionView(PagingVO<PatientVO> pagingvo
		,PatientVO patient, Model model) {
    	
    	  List<PatientVO> patientList = service.retrievePatientList(pagingvo);
		
    	model.addAttribute("patientList",patientList);
		String viewName = null;
		viewName = "receiption/receiptionView";
      
		return viewName;
	}
    
    @PostMapping("/receiptionView")
    public String insertForm(PatientVO patient) {
    	String viewName=null;
    	
    	ServiceResult createPatient = service.createPatient(patient);
    	if(createPatient == ServiceResult.OK) {
    		viewName = "receiption/receiptionView";
    	}
    	return viewName;
    }
}

