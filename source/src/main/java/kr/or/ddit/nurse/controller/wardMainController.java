package kr.or.ddit.nurse.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.vo.HospitalizationVO;
import kr.or.ddit.commons.vo.IntakeOutputVO;
import kr.or.ddit.commons.vo.IntakeVO;
import kr.or.ddit.commons.vo.OutputVO;
import kr.or.ddit.commons.vo.VitalVO;
import kr.or.ddit.nurse.service.WardService;
import kr.or.ddit.nurse.vo.DietRecordVO;
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
	public String wardView(Model model) {
		String viewName = null;
		viewName = "nurse/wardMain";
		
		model.addAttribute("intakeList", service.retrieveIntakeList());
		model.addAttribute("outputList", service.retrieveOutputList());
		model.addAttribute("dietCateList", service.retrieveDietCateList());
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
	
	// 식이기록 리스트 출력
	@ResponseBody
	@PostMapping("/dietList")
	public List<DietRecordVO> dietList(@RequestBody DietRecordVO diet){
		int hsptNo = diet.getHsptNo();
		List<DietRecordVO> list = service.retrieveDietList(hsptNo);
		return list;
	}
	
	// 간호기록 리스트 출력
	@ResponseBody
	@PostMapping("/nrecList")
	public List<NrecVO> nrecList(
			@RequestBody NrecVO nrec
	){
		int hsptNo = nrec.getHsptNo();
		List<NrecVO> list = service.retrieveNrecList(hsptNo);
		return list;
	}

	// IO 리스트 출력
	@ResponseBody
	@PostMapping("/vitalList")
	public List<HospitalizationVO> vitalList(
			@RequestBody VitalVO vital
			){
		int hsptNo = vital.getHsptNo();
		List<HospitalizationVO> list = service.retrieveVitalList(hsptNo);
		return list;
	}
	
	// IO 리스트 출력
	@ResponseBody
	@PostMapping("/ioList")
	public List<IntakeOutputVO> ioList(@RequestBody IntakeOutputVO io){
		List<IntakeOutputVO> list = service.retrieveIoList(io);
		return list;
	}
	
	// IO 중복체크 (한 환자당 한 날짜에 하나씩)
	@ResponseBody
	@PostMapping("/ioDuplicateCheck")
	public int ioDuplicateCheck(@RequestBody IntakeOutputVO io) {
		int result = service.ioduplicateCheck(io);
		return result;
	}
	
	// IO 생성
	@ResponseBody
	@PostMapping("/ioCreate")
	public int ioCreate(@RequestBody IntakeOutputVO io) {
		int result = service.ioCreate(io);
		return result;
	}
	
	// intake 입력
	@ResponseBody
	@PostMapping("/intakeCreate")
	public int intakeCreate(@RequestBody IntakeVO intake) {
		int result = service.intakeCreate(intake);
		return result;
	}
	
	// output 입력
	@ResponseBody
	@PostMapping("/outputCreate")
	public int outputCreate(@RequestBody OutputVO output) {
		int result = service.outputCreate(output);
		return result;
	}
	
	// diet 입력
	@ResponseBody
	@PostMapping("/dietInsert")
	public int dietCreate(@RequestBody DietRecordVO diet) {
		int result = service.dietCreate(diet);
		return result;
	}
}


























