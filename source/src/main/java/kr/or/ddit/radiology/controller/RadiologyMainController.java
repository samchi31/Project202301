package kr.or.ddit.radiology.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.hc.core5.http.HttpResponse;
import org.apache.logging.log4j.core.config.plugins.PluginNode;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.vo.DiagHistoryVO;
import kr.or.ddit.commons.vo.FilmAtchDetailVO;
import kr.or.ddit.commons.vo.FilmAtchVO;
import kr.or.ddit.commons.vo.FilmCateVO;
import kr.or.ddit.commons.vo.SymptomVO;
import kr.or.ddit.commons.vo.TrmChartVO;
import kr.or.ddit.commons.vo.WaitHistoryVO;
import kr.or.ddit.radiology.service.RadiologyService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/radiology")
public class RadiologyMainController {
	@Inject
	private RadiologyService service;
	

	@GetMapping(value="/radiologyView", produces=MediaType.APPLICATION_JSON_UTF8_VALUE) //메인페이지
	public String RadiologyView(Model model) {
		String viewName = null;
		
		model.addAttribute("waitStatus", service.retreiveWaitStatus());
		model.addAttribute("filmCate", service.retrieveFilmCate());
//		model.addAttribute("waitList", service.retrieveWaitHistory(11));	
		
		
		viewName = "radiology/radiologyView";
      
		return viewName;
	}
	
	// 환자리스트
	@ResponseBody
	@GetMapping(value="/patientList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List patientList () {
		List<FilmCateVO> list = service.retrievePatientList();
		return list;
		
	}
	
	// 환자 검색
	@ResponseBody
	@PostMapping(value="/patientSearch", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List patientSearch(@RequestBody Map<String, String> map
			,Model model) {
			
		log.info("searchOption : " + map.get("searchOption"));
		log.info("searchWord :" + map.get("searchWord"));
		
		List<FilmCateVO> list = service.retrievePatientSearchList(map);
		model.addAttribute("patientList",list);
		log.info("list : {}",list);
		
		return list;
	}
	
	
	@ResponseBody
	@GetMapping(value="/xrayList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<WaitHistoryVO> filmXList() {
		log.info("엑스레이 리스트 왔다.");
		List<WaitHistoryVO> list = service.selectXrayList();
		return list;
		
	}
	
	
	@ResponseBody
	@GetMapping(value="/radiwaitinglist", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List RadiAllList() {
		List<WaitHistoryVO> list = service.selectRadiAllList();
		//MRI,URSONIC -> List<String> filmCdList로 들어감
		List<WaitHistoryVO> listResult = new ArrayList<WaitHistoryVO>();
		
		
		for(WaitHistoryVO vo : list) {
			String[] filmCdArr = vo.getFilmCd().split(",");
			
			List<String> filmCdList = new ArrayList<String>();
			
			for(int i=0;i<filmCdArr.length;i++) {
				filmCdList.add(filmCdArr[i]);
			}
			
			vo.setFilmCdList(filmCdList);
			
			listResult.add(vo);
		}
		
		return listResult;
		
	}

	// 바뀐 값 가져올 컨트롤러
	@ResponseBody
	@PostMapping(value="/changeWaitList", produces="text/plain;charset=UTF-8")
	public String changeWaitList(@RequestBody Map<String, String> map) {
		//map : {trmCd=TC0182, rcpNo=RCP0033, waitstCd=WS001, divCd=DV002, filmCd=MRI}
		log.info("map : " + map.get("rcpNo"));
		
		System.out.println(map.get("radioVal"));
				
		int result = service.modifyWaitListInsert(map);
		//result : 2이면 성공
		log.info("result : " + result);
		
		String msg = "";
		
		if(result > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}
		return msg;
	}
	
	// 바뀐 값 가져올 컨트롤러
	@ResponseBody
	@PostMapping(value="/insertWaitList", produces="text/plain;charset=UTF-8")
	public String createWaitList(@RequestBody Map<String, String> map) {
		String msg = "";
		int result = 0;
		log.info("map : " + map.get("rcpNo"));
		
		System.out.println(map.get("radioVal"));
		int cnt = service.retriveCheckFilmList();
		log.info("cnt : {} ", cnt);
		if(cnt>0) {
			msg = "실패"; 
		}else {
			result = service.createWaitList(map);
		}
		//result : 2이면 성공
		log.info("result : " + result);
		
		
		if(result > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}
		return msg;
	}
	

	// 차트 가져올 거
	@GetMapping("chart/{rcpNo}")
	public String getChart(
			@PathVariable String rcpNo
			, Model model) {
		log.info("rcpNo : {}",rcpNo);
		
		TrmChartVO retrieveTrmChart = service.retrieveTrmChart(rcpNo);
		log.info("retrieveTrmChart : {}",retrieveTrmChart);
		model.addAttribute("chartVO",retrieveTrmChart );
		
		return "jsonView";
	}
	
	@GetMapping("filmChart/{rcpNo}")
	public String getFilmChart(
			@PathVariable String rcpNo
			, Model model) {
		log.info("rcpNo : {}",rcpNo);
		
		TrmChartVO retrieveTrmChart = service.retrieveFilmChart(rcpNo);
		log.info("retrieveTrmChart : {}",retrieveTrmChart);
		model.addAttribute("chartVO",retrieveTrmChart );
		
		return "jsonView";
	}
	
	// 대기리스트출력
	@ResponseBody
	@PostMapping(value="/chartList",produces="application/json;charset=utf-8")
	public List<WaitHistoryVO> RadiAllList(
			@RequestBody WaitHistoryVO whVO) {
		log.info("들어갔다");
		log.info("paNo : {}",whVO.getPaNo());
		List<WaitHistoryVO> list = service.selectChartList(whVO.getPaNo());
		return list;
		
	}
	
	// 환자 진료차트 증상 리스트
	@ResponseBody
	@PostMapping(value="/symptomList", produces="application/json;charset=utf-8")
	public List<SymptomVO> symptonList(@RequestBody Map<String, String> map){
		List<SymptomVO> symptom = service.retrieveSymptomList(map);
		return symptom;
	}
	
	// 환자 진료차트 상병 리스트
	@ResponseBody
	@PostMapping(value="/diagList", produces="application/json;charset=utf-8")
	public List<DiagHistoryVO> diagList(@RequestBody Map<String, String> map){
		List<DiagHistoryVO> diag = service.retrieveDiagList(map);
		return diag;
	}
	
	/*
	 console.log("trmCd : " + trmCd);
		console.log("rcpNo : " + rcpNo);
		console.log("paNo : " + paNo);
		console.log("paName : " + paName);
		console.log("filmCd : " + filmCd);
	 */
	

	// date 바뀐 값 가져올 컨트롤러
	@ResponseBody
	@PostMapping(value="/updateFilmDate", produces="text/plain;charset=utf-8")
	public String updateFilmDate(
			FilmAtchVO filmatchvo
			,HttpServletResponse resp
			) throws IOException {
		//map : {trmCd=TC0202, filmCd=MRI}
		if(filmatchvo == null) {
			resp.sendError(500);
		}
		log.info("vo : {}", filmatchvo);
		
		int result = service.modifyFilmDate(filmatchvo);
		//result : 2이면 성공
		log.info("result : " + result);
		String msg = null;
		if(result > 2) {
			msg = "성공";
		} else {
			msg = "실패";
			
		}
		return msg;
	}
	
	@ResponseBody
	@GetMapping(value="/filmImage/{rcpNo}", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<FilmAtchDetailVO> getImageURL(
			@PathVariable String rcpNo
			) {
		List<FilmAtchDetailVO> filmAtchDetailVOList = service.retrieveFilmAtchDetailVO(rcpNo);		
		log.info("cat : {}", filmAtchDetailVOList);
	return filmAtchDetailVOList;
	
	}
	
	@ResponseBody
	@PostMapping("/countRadiWaitList")
	public int countRadiWaitList(
				@RequestBody Map<String, String> map
			) {
		int cnt = service.retriveRadiWaitList(map);
		
		
		return cnt;
	}
}


















