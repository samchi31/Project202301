package kr.or.ddit.receiption.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.commons.vo.WaitHistoryVO;
import kr.or.ddit.receiption.service.ReceptionService;
import kr.or.ddit.receiption.vo.ReceiptionVO;
import kr.or.ddit.receiption.vo.RegistVO;
import kr.or.ddit.receiption.vo.SelectPatientVO;
import kr.or.ddit.receiption.vo.SmsVO;
import kr.or.ddit.receiption.vo.WaitListVO;
import kr.or.ddit.receiption.vo.SelectOperationListVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/receiption")
public class ReceiptionViewController {
	String viewName = null;
    @Inject
    ReceptionService service;
	
    @ModelAttribute("receiptionVO")
    public ReceiptionVO receiptionVO() {
    	return new ReceiptionVO();
    }
    @ModelAttribute("registVO")
    public RegistVO registVO() {
    	return new RegistVO();
    }
    @GetMapping("/receiptionView")
	public String receiptionView(Model model) {
    	List<WaitListVO> retrieveWaitList = service.retrieveWaitList("DO101");
    	List<WaitListVO> retrieveWaitList2 = service.retrieveWaitList("DO102");
    	List<WaitListVO> retrieveWaitList3 = service.retrieveWaitList("DO103");
    	List<SelectOperationListVO> operationList = service.retrieveOperationList("Y");
    	List<SmsVO> smsList = service.retrieveSmsList();
		viewName = "receiption/receiptionView";
		model.addAttribute("DO101List", retrieveWaitList);
		model.addAttribute("DO102List", retrieveWaitList2);
		model.addAttribute("DO103List", retrieveWaitList3);
		model.addAttribute("operationList", operationList);
		model.addAttribute("smsList", smsList);
		return viewName;
	}
 
    
    @ResponseBody
    @PostMapping("/patientSearch")
    public List<ReceiptionVO> patientSearch(@RequestBody Map<String, String> map
    		) {
    	
    	List<ReceiptionVO> searchPatientList = service.searchPatientList(map);
    	return searchPatientList;
    }
    
    @GetMapping("/searchList")
    public String patientSearchList(@RequestParam("searchOption") String searchOption
    		, @RequestParam("searchWord") String searchWord
    		, Model model) {
    	Map<String, String> map = new HashMap<>();
    	map.put("searchOption",searchOption);
    	map.put("searchWord",searchWord);
    	List<ReceiptionVO> list = service.searchPatientList(map);
    	model.addAttribute("list", list);
    	return "receiption/searchList";
    }
    
    @ResponseBody
    @PostMapping("/registration")
    public int registRCP(@RequestBody RegistVO registVO) {
    	int rowcnt = service.createReceiption(registVO);
    	return rowcnt;
    }	
    
    @ResponseBody
    @PostMapping("/newPatient")
    public int	newPatient(@RequestBody PatientVO patientVO,Model model) {
    	int rowcnt = service.createPatient(patientVO);
    	return rowcnt;
    }
    
    @ResponseBody
    @PostMapping("/selectPatient")
    public SelectPatientVO selectPatient() {
    	SelectPatientVO selectPatient = service.selectPatient();
    	return selectPatient;
    }
    
    @ResponseBody
    @PostMapping("/waitingHistory")
    public int waitingHistory() {
    	int rowcnt = service.createWaitHistory();
    	return rowcnt;
    }
    
    @ResponseBody
    @PostMapping("/waitingList")
    public List<WaitListVO> waitList(@RequestBody Map<String, String> map) {
    	//map : {officeCd=DO102}
    	log.info("map : " + map);
    	
    	String officeCd = map.get("officeCd");
    	log.info("officeCd : " + officeCd);
    	List<WaitListVO> list = service.retrieveWaitList(officeCd);
    	return list;
    }
    
    
}

