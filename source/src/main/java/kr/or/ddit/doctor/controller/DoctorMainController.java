package kr.or.ddit.doctor.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.vo.EmployeeVO;
import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.commons.vo.TrmChartVO;
import kr.or.ddit.commons.vo.WaitHistoryVO;
import kr.or.ddit.doctor.service.DoctorService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/doctor")
public class DoctorMainController {
	
	@Inject
	private DoctorService service;
	
	@GetMapping("/main")
	public String enterMainView(Model model
			, @AuthenticationPrincipal(expression="realMember") EmployeeVO emp
	) {
		
		/*
		 * 
		 */
		
//		log.info("empNo : {} " , emp.getEmpNo() );
		model.addAttribute("waitStatus", service.retreiveWaitStatus());
		model.addAttribute("divTreat", service.retreiveDvTr());
		
		model.addAttribute("disList", service.retrieveDisList());
		model.addAttribute("symList", service.retrieveSymList());
		model.addAttribute("filmList", service.retrieveRadiList());
//		model.addAttribute("goList", service.retrieveGOList());
		model.addAttribute("waitList", service.retrieveWaitHistory(emp.getEmpNo()));
		
		return "doctor/doctorMain";
	}
	
	@ResponseBody
	@GetMapping(value="/main/paNo/{paNo}", produces="application/json;charset=UTF-8")
	public PatientVO getPaInfo(
			@PathVariable String paNo
			) {
//		log.info("{}",paNo);
		
		PatientVO patientVO = service.retrievePaInfo(paNo);
		return patientVO;
	}
	
	@ResponseBody
	@GetMapping(value="/main/chartlist/{paNo}", produces="application/json;charset=UTF-8")
	public List<TrmChartVO> getChartList(@PathVariable String paNo) {
		// ?????? ?????? ?????? ?????? ?????????
		List<TrmChartVO> trmChartList = service.retrieveTrmChartList(paNo);
		return trmChartList;
	}
	
	@ResponseBody
	@GetMapping(value="/main/chart/{rcpNo}", produces="application/json;charset=UTF-8")
	public TrmChartVO getChart(@PathVariable String rcpNo) {
		TrmChartVO trmChartVO = service.retrieveTrmChart(rcpNo);
		
		log.info(" getChart - trmVO : {}", trmChartVO);
		
		
		return trmChartVO;
	}
	
	@ResponseBody
	@PostMapping(value="/main", produces="text/plain;charset=UTF-8")
	public String submitChart(
		@RequestBody TrmChartVO trmChart
		, @AuthenticationPrincipal(expression="realMember") EmployeeVO emp
	) {
		// log.info("updateTrmChart {}",trmChart);
		
		String msg = null;
		
		if(trmChart.getTrmCd() != null) {
			// ??????
			int rowcnt = service.modifyTrmChart(trmChart);
			if(rowcnt > 0) {
				msg = "????????????(??????) ?????? ??????";
			} else {
				msg = "?????? ??????";
			}
		} else {	
			// ?????? ??????
			trmChart.setEmpNo(emp.getEmpNo());
			int rowcnt = service.createTrmChart(trmChart);
			if(rowcnt > 0) {
				msg = "????????????(??????) ?????? ??????";
			} else {
				msg = "?????? ?????? ??????";
			}
		}
		return msg;
	}
	
	@PostMapping(value="/main/wait", produces="text/plain;charset=UTF-8")
	@ResponseBody	// ajax??? ????????? ?????????
	public String changeWait( @RequestBody WaitHistoryVO waitHistoryVO ) {
		// log.info("wait vo request : {}",waitHistoryVO);
		int rowcnt = service.createWaitHistory(waitHistoryVO);
		
		String resp = null;
		if(rowcnt > 0) {
			resp= "?????? ???????????? ?????? ??????";
		} else {
			resp = "?????? ???????????? ?????? ??????";
		}
		return resp;
	}	
}

/*
 * modelAttribute : form ??????????????? ?????? ???, controller?????? jsp??? ?????????
 * 
 * responseBody : ?????? ?????? ??? -> produces ???????????? dataType, encoding ??????
 * 
 * requestBody : ?????? ????????? ?????? ???
 */