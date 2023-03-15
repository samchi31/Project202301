package kr.or.ddit.nurse.controller;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.vo.OperationInfomationVO;
import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.commons.vo.SymptomVO;
import kr.or.ddit.commons.vo.TrmChartVO;
import kr.or.ddit.nurse.service.OperationService;
import kr.or.ddit.nurse.vo.CexVO;
import kr.or.ddit.utils.fullcalendar.FullCalendarEvent;
import kr.or.ddit.utils.fullcalendar.OperationFullCalendarEvent;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/nurse")
public class OperationMainController {

	@Inject
	private OperationService service;
	
	@GetMapping("/operationMain")
	public String operationView(Model model) {
		String viewName = null;
		viewName = "nurse/operationMain";
		
		model.addAttribute("operationOption", service.retrieveOperationOption());
		model.addAttribute("docOption", service.retrieveDocOption());
		
		return viewName;
	}
	
	@ResponseBody
	@GetMapping("/operationList")
	public List<OperationInfomationVO> operationList(){
		List<OperationInfomationVO> list = service.retrieveOperationList();
		return list;
	}
	
	// 수술번호를 받아 그에 해당하는 수술예약정보를 조회
	@ResponseBody
	@PostMapping("/operationDetailSelect")
	public PatientVO operationDetail(@RequestBody OperationInfomationVO operation) {
		String opNo = operation.getOpNo();
		PatientVO patient = service.retrieveOperationDetail(opNo);
		
		return patient;
	}
	
	@ResponseBody
	@GetMapping("/operReservList")
	public List<OperationInfomationVO> operReservList(){
		List<OperationInfomationVO> list = service.retrieveOperReservList();
		return list;
	}
	
	@ResponseBody
	@GetMapping("/operCompleteList")
	public List<OperationInfomationVO> operCompleteList(){
		List<OperationInfomationVO> list = service.retrieveOperCompleteList();
		return list;
	}

	//	풀캘린더
	@RequestMapping(value="/operationMain/events", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<FullCalendarEvent<OperationInfomationVO>> json(){
		
		List<OperationInfomationVO> operList = service.retrieveOperationInfoList();
		
		return operList.stream()
					.map(OperationFullCalendarEvent::new)
					.collect(Collectors.toList());
	}
	
	@ResponseBody
	@PostMapping("/operationInsert")
	public int operationInsert(@RequestBody Map<String, Object> map) {
		log.info("스타트타임",map.get("opReservStarttime"));
		int result = service.createOperation(map);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/operationUpdate")
	public int operationUpdate(@RequestBody Map<String, String> map) {
		int result = service.modifyOperation(map);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/operationDelete")
	public int operationDelete(@RequestBody OperationInfomationVO operation) {
		
		int result = service.removeOperation(operation);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/diagnosisDetail")
	public TrmChartVO diagnosisDetail(@RequestBody Map<String, String> map) {
		TrmChartVO chart = service.retrieveDiagnosisDetail(map);
		return chart;
	}
	
	@ResponseBody
	@PostMapping("/operationReservDetail")
	public OperationInfomationVO operationReservDetail(@RequestBody OperationInfomationVO operation) {
		operation = service.retrieveOperationReservDatail(operation);
		return operation;
	}
	
	@ResponseBody
	@PostMapping("/operationStart")
	public OperationInfomationVO operationStart(@RequestBody OperationInfomationVO operation) {
		int result = service.modifyOperationStarttime(operation);
		
		// 업데이트된 예약정보를 다시 입력해줌
		operation = service.retrieveOperationReservDatail(operation);
		
		return operation;
	}
	
	@ResponseBody
	@PostMapping("/operationEnd")
	public OperationInfomationVO operationEnd(@RequestBody OperationInfomationVO operation) {
		int result = service.modifyOperationEndtime(operation);
		
		// 업데이트된 예약정보를 다시 입력해줌
		operation = service.retrieveOperationReservDatail(operation);
		
		return operation;
	}
	
	@ResponseBody
	@PostMapping("/symptomList")
	public List<SymptomVO> symptomList(@RequestBody Map<String, String> map) {
		List<SymptomVO> symptom = service.retrieveSymptomList(map);
		return symptom;
	}
	
	@ResponseBody
	@PostMapping("/cexCreate")
	public int createCex(@RequestBody Map<String, String> map) {
		int result = service.createCex(map);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/cexWaitList")
	public List<PatientVO> cexWaitList(){
		List<PatientVO> list = service.retrieveCexWaitList();
		return list;
	}
	
	@ResponseBody
	@PostMapping("/cexCompleteList")
	public List<PatientVO> cexCompleteList(){
		List<PatientVO> list = service.retrieveCexCompleteList();
		return list;
	}
	
	@ResponseBody
	@PostMapping("/cexRegistration")
	public int cexRegistration(@RequestBody CexVO cex) {
		int result = service.modifyCex(cex);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/cexResultDetail")
	public CexVO cexResultDetail(@RequestBody CexVO cex) {
		cex = service.retrieveCexDetail(cex);
		return cex;
	}
	
	@ResponseBody
	@PostMapping("/cexHistorySearch")
	public List<CexVO> cexPatientSearch(@RequestBody Map<String, String> map) {

		List<CexVO> list = service.retrieveCexPatientList(map);
			
		return list;
	}
	
	@ResponseBody
	@PostMapping("/operHistorySearch")
	public List<OperationInfomationVO> operHistorySearch(@RequestBody Map<String, String> map) {
		
		List<OperationInfomationVO> list = service.retrieveOperHistory(map);
		
		return list;
	}
}
