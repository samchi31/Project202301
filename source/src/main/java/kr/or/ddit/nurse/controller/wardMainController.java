package kr.or.ddit.nurse.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.vo.HospitalizationVO;
import kr.or.ddit.commons.vo.IntakeOutputVO;
import kr.or.ddit.commons.vo.VitalVO;
import kr.or.ddit.nurse.service.WardService;
import kr.or.ddit.nurse.vo.NrecVO;
import kr.or.ddit.nurse.vo.WardVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/nurse")
public class wardMainController {
	
	@Inject
	private WardService service;
	
	@GetMapping("/wardMain")
	public String wardView() {
		String viewName = null;
		viewName = "nurse/wardMain";
		
		return viewName;
	}
	
	@ResponseBody
	@GetMapping("/wardPatientList")
	public List<WardVO> wardWaitList() {
		List<WardVO> list = service.retrieveWardPatientList();
		return list;
	}
	
	@ResponseBody
	@PostMapping("/wardPatientDetail")
	public WardVO wardPatientInfoView(@RequestBody WardVO ward) {
		int hsptNo = ward.getHsptNo();
		ward = service.retrieveWardPatient(hsptNo);
		return ward;
	}
	
	@ResponseBody
	@PostMapping("/nrecInsert")
	public int nursingRecordInsert(
			@RequestBody NrecVO nrec
	) {
		int result = service.createNrec(nrec);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/vitalInsert")
	public int vitalInsert(
			@RequestBody VitalVO vital
			) {
		int result = service.createVital(vital);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/nrecList")
	public List<NrecVO> nrecList(
			@RequestBody NrecVO nrec
	){
		int hsptNo = nrec.getHsptNo();
		List<NrecVO> list = service.retrieveNrecList(hsptNo);
		return list;
	}
	
	@ResponseBody
	@PostMapping("/vitalList")
	public List<HospitalizationVO> vitalList(
			@RequestBody VitalVO vital
			){
		int hsptNo = vital.getHsptNo();
		List<HospitalizationVO> list = service.retrieveVitalList(hsptNo);
		return list;
	}
	
	@ResponseBody
	@PostMapping("/ioList")
	public List<IntakeOutputVO> ioList(@RequestBody IntakeOutputVO io){
		List<IntakeOutputVO> list = service.retrieveIoList(io);
		return list;
	}
	
	@ResponseBody
	@PostMapping("/ioDuplicateCheck")
	public int ioDuplicateCheck(@RequestBody IntakeOutputVO io) {
		int result = service.ioduplicateCheck(io);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/ioCreate")
	public int ioCreate(@RequestBody IntakeOutputVO io) {
		int result = service.ioCreate(io);
		return result;
	}
}


























