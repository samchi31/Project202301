package kr.or.ddit.nurse.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.nurse.service.CexService;
import kr.or.ddit.nurse.vo.CexVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/nurse")
@Controller
public class CexViewController {
	
	@Inject
	private CexService service;
	
	@GetMapping("/cexView")
	public String cexView() {
		String viewName = null;
		viewName = "nurse/cexView";
		
		return viewName;
	}
	
	@ResponseBody
	@GetMapping("/cexWaitLsit")
	public List<CexVO> cexWaitList() {
		List<CexVO> list = service.retrieveCexWaitList();
		return list;
	}
	
	@ResponseBody
	@PostMapping("/cexPatientSearch")
	public List patientSearch(@RequestBody Map<String, String> map) {
		log.info("searchOption : " + map.get("searchOption"));
		log.info("searchWord :" + map.get("searchWord"));
		
		List<PatientVO> list = service.retrievePatientList(map);
			
		return list;
	}
	
	@ResponseBody
	@PostMapping("/patientCexHistory")
	public List patientCexHistory(@RequestBody Map<String, String> map) {
		log.info("paNo:" + map.get("paNo"));
		
		int paNo = Integer.parseInt(map.get("paNo"));
		List<CexVO> list = service.retrieveCexHistoryList(paNo);
		return list;
	}
	
	@ResponseBody
	@PostMapping("/cexHistoryDetail")
	public CexVO cexHistoryDetail(@RequestBody Map<String, String> map) {
		log.info("cexNo:" + map.get("cexNo"));
		
		String cexNo = map.get("cexNo");
		CexVO cex = service.retrieveCexDetail(cexNo);
		return cex;
	}
	
	@ResponseBody
	@PostMapping("/cexInsert")
	public String cexInsert(
			@RequestBody CexVO cex
	) {
		
		int result = service.createCex(cex);
		String cexNo = cex.getCexNo();

		return cexNo;
	}
}
