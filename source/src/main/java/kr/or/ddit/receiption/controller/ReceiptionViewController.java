package kr.or.ddit.receiption.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.receiption.service.ReceptionService;
import kr.or.ddit.receiption.vo.ReceiptionVO;

@Controller
@RequestMapping("/receiption")
public class ReceiptionViewController {
 
    @Inject
    ReceptionService service;
	
    @ModelAttribute("receiptionVO")
    public ReceiptionVO receiptionVO() {
    	return new ReceiptionVO();
    }
    
    @GetMapping("/receiptionView")
	public String receiptionView() {
    	
		String viewName = null;
		viewName = "receiption/receiptionView";
      
		return viewName;
	}
    
    @ResponseBody
    @PostMapping("/receiptionPatientSearch")
    public List patientSearch(@RequestBody Map<String, String> map) {
    	String viewName=null;
    	
    	List<ReceiptionVO> searchPatientList = service.searchPatientList(map);
    	return searchPatientList;
    }
    
    
    @PostMapping("/registration")
    @ResponseBody
    public void registRCP(
    		 @ModelAttribute("receiptionVO") @RequestBody ReceiptionVO receiptionVO) {
  
    	service.createReceiption(receiptionVO);
    }
 
}

