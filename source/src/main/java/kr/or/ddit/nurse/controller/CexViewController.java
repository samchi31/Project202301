package kr.or.ddit.nurse.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.nurse.service.CexService;
import lombok.RequiredArgsConstructor;
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
	@PostMapping("/cexPatientSearch")
	public List patientSearch(@RequestBody Map<String, String> map) {
		log.info("searchOption : " + map.get("searchOption"));
		log.info("searchWord :" + map.get("searchWord"));
		
		List<PatientVO> list = service.retrievePatientList(map);
			
		return list;
	}
}
