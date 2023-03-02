package kr.or.ddit.receive.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.vo.DiagHistoryVO;
import kr.or.ddit.commons.vo.ReceiveDetailVO;
import kr.or.ddit.commons.vo.TrmChartVO;
import kr.or.ddit.doctor.service.DoctorService;
import kr.or.ddit.receive.service.ReceiveService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/receive")
public class ReceiveController {
	
	@Inject
	ReceiveService receiveService;
	
	@Inject
	DoctorService doctorService;
	
	public String writeReceive(
			String rcpNo
			) {
		
		/*
		 * 접수 번호에 해당하는 진료차트 조회
		 * 진료차트에서 처방, 촬영, 진단(수술, 물리치료) 확인
		 * 수납 상세에 기록
		 * 수납 요약에 기록
		 */	
		
		
		
		return null;
	}
	
	@ResponseBody
	@GetMapping(value="/chart/{rcpNo}", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public TrmChartVO getChart(
			@PathVariable String rcpNo
	){
		// 차트 조회
		return doctorService.retrieveTrmChart(rcpNo);
	}
	
	@ResponseBody
	@PostMapping("/detail")
	public String insertReceive(
			@RequestBody ReceiveDetailVO receiveDetailVO
	) {
		log.info("detail : {}", receiveDetailVO);
		int rowcnt = receiveService.createReceive(receiveDetailVO);
		
		String message = "";
		if(rowcnt > 0 ) {
			message = "성공";
		} else {
			message = "실패";
		}
		return message;
	}
	
}
