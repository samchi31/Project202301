package kr.or.ddit.radiology.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.commons.vo.DiagHistoryVO;
import kr.or.ddit.commons.vo.FilmAtchVO;
import kr.or.ddit.commons.vo.FilmAttachVO;
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
	

	@GetMapping("/radiologyView") //메인페이지
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
	@GetMapping("/patientList")
	public List patientList () {
		List<FilmCateVO> list = service.retrievePatientList();
		return list;
		
	}
	
	// 환자 검색
	@ResponseBody
	@PostMapping("/patientSearch")
	public List patientSearch(@RequestBody Map<String, String> map
			,Model model) {
		log.info("searchOption : " + map.get("searchOption"));
		log.info("searchWord :" + map.get("searchWord"));
		
		List<FilmCateVO> list = service.retrievePatientSearchList(map);
		model.addAttribute("patientList",list);
		log.info("list : {}",list);
		
		return list;
	}
	
//	// 환자 검색
//	@ResponseBody
//	@PostMapping("/patientSearch")
//	public List MripatientSearch(@RequestBody Map<String, String> map
//			,Model model) {
//		log.info("searchOption : " + map.get("searchOption"));
//		log.info("searchWord :" + map.get("searchWord"));
//		
//		List<FilmCateVO> list = service.retrieveMriPatientSearchList(map);
//		model.addAttribute("patientList",list);
//		log.info("list : {}",list);
//		
//		return list;  
//	}

	
	@ResponseBody
	@GetMapping("/xrayList")
	public List filmXList() {
		log.info("엑스레이 리스트 왔다.");
		List<WaitHistoryVO> list = service.selectXrayList();
		return list;
		
	}
	@ResponseBody
	@GetMapping("/mriList")
	public List filmMList() {
		List<WaitHistoryVO> list = service.selectMRIList();
		return list;
		
	}
	@ResponseBody
	@GetMapping("/ctList")
	public List filmCList() {
		List<WaitHistoryVO> list = service.selectCTList();
		return list;
		
	}
	@ResponseBody
	@GetMapping("/ultraList")
	public List filmUList() {
		List<WaitHistoryVO> list = service.selectUltraList();
		return list;
		
	}

	@ResponseBody
	@GetMapping("/radiwaitinglist")
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
	@PostMapping("/changeWaitList")
	public String changeWaitList(@RequestBody Map<String, String> map) {
		//map : {trmCd=TC0182, rcpNo=RCP0033, waitstCd=WS001, divCd=DV002, filmCd=MRI}
		log.info("map : " + map.get("rcpNo"));
		
		System.out.println(map.get("radioVal"));
				
		int result = service.modifyWaitListInsert(map);
		//result : 2이면 성공
		log.info("result : " + result);
		
		String viewName = "";
		
		if(result > 0) {
			log.info("등록됨 ");
			viewName = "redirect:/radiology/radiwaitinglist";
			return viewName;
		}
		else {
			viewName = "redirect:/radiology/radiologyView";
			return viewName;
		}
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
	public List RadiAllList(
			@RequestBody WaitHistoryVO whVO) {
		log.info("들어갔다");
		log.info("paNo : {}",whVO.getPaNo());
		List<WaitHistoryVO> list = service.selectChartList(whVO.getPaNo());
		return list;
		
	}
	
	// 환자 진료차트 증상 리스트
	@ResponseBody
	@PostMapping("/symptomList")
	public List<SymptomVO> symptonList(@RequestBody Map<String, String> map){
		List<SymptomVO> symptom = service.retrieveSymptomList(map);
		return symptom;
	}
	
	// 환자 진료차트 상병 리스트
	@ResponseBody
	@PostMapping("/diagList")
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
	@ResponseBody
	@PostMapping("/processAttachList")
	public String processAttachList(FilmAtchVO filmAtchVO) {
		log.info("filmAttachVO : " + filmAtchVO);
		
		String fiatCd = this.service.processAttachList(filmAtchVO);
		
		return fiatCd;
	}

	// date 바뀐 값 가져올 컨트롤러
	@ResponseBody
	@PostMapping("/updateFilmDate")
	public int updateFilmDate(@RequestBody Map<String, String> map) {
		//map : {trmCd=TC0202, filmCd=MRI}
		log.info("map : " + map);
		
		int result = service.updateFilmDate(map);
		//result : 2이면 성공
		log.info("result : " + result);
		
//		String viewName = "";
//		
//		String filmCd = map.get("filmCd");
//		log.info("filmCd : {}",filmCd);
//		if(result > 0) {
//			log.info("등록됨 ");
//			if(filmCd.equals("X-RAY")) {
//				log.info("엑스레이 왔다.");
//				viewName = "redirect:/radiology/xrayList";
//				return viewName;
//				
//			}
//			else if(filmCd.equals("MRI")) {
//				viewName = "redirect:/radiology/mriList";
//				return viewName;
//				
//			}
//			else if(filmCd.equals("CT")) {
//				viewName = "redirect:/radiology/ctList";
//				return viewName;
//				
//			}
//			else{
//				viewName = "redirect:/radiology/ultraList";
//				return viewName;
//				
//			}
//		}
//		else {
//			viewName = "redirect:/radiology/radiologyView";
//			return viewName;
//		}
		return result;
	}
}


















