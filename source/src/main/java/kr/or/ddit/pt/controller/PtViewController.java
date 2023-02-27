package kr.or.ddit.pt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.commons.vo.PtAssinmentVO;
import kr.or.ddit.commons.vo.PtDocumentVO;
import kr.or.ddit.commons.vo.TrmChartVO;
import kr.or.ddit.pt.service.PtAssinmentService;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 장예지
 * @since 2023. 2. 3.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * 
 *      <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 3.      장예지       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 *      </pre>
 */
@Slf4j
@RequestMapping("/pt")
@Controller
public class PtViewController {

	@Inject
	PtAssinmentService service;
	
	@GetMapping("/ptView")
	public String ptView(@ModelAttribute("ptAssinmentVOList") PtAssinmentVO ptAssinmentVO, Model model) {
		
		List<PtAssinmentVO> ptAssinmentVOList = service.retrievePtRoomList(ptAssinmentVO);
		List<PtAssinmentVO> ptBedList = service.retrievePtBedList();
//		List<PtAssinmentVO> ptDocument = service.retrievePtDocument();
		
		model.addAttribute("ptAssinmentList", ptAssinmentVOList);
		model.addAttribute("ptBedList", ptBedList);
//		model.addAttribute("ptDocument", ptDocument);
		
		String viewName = null;
		viewName = "pt/ptView";
//		log.info("hello ptDocument : {} ",ptDocument);
		return viewName;
	}

	/**
	 * Bed에 환자를 배정 
	 * (물리치료실 bed의 상태를) => update
	 * watingHistory에 현재 상태(대기중->치료중)를 Insert
	 * @param ptAssinmentVO
	 * @return map
	 */
	@ResponseBody
	@PostMapping(value ="/ptBedFull", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Map<String, Object> ptBedFull(@RequestBody PtAssinmentVO ptAssinmentVO) {
		int insertCnt = service.modifyptBedFull(ptAssinmentVO); //업데이트

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", insertCnt);
		map.put("rcpNo", ptAssinmentVO.getRcpNo());
		map.put("paName", ptAssinmentVO.getPaName());
		map.put("ptBedCd", ptAssinmentVO.getPtBedCd());

		return map;
	}
	
	/**
	 * Bed에 환자의 데이터를 제거
	 * (물리치료실 bed의 상태를) => update
	 * watingHistory에 현재 상태(치료중->완료) Insert
	 * @param ptAssinmentVO
	 * @param waitHistoryVO
	 * @return map
	 */
	@ResponseBody
	@PostMapping(value = "/ptBedEmpty" ,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Map<String, Object> ptBedEmpty(@RequestBody PtAssinmentVO ptAssinmentVO) {
//		log.info("ptAssinmentVO : " + ptAssinmentVO);
		int insertCnt = service.modifyptBedEmpty(ptAssinmentVO); //엡데이트 문 호출
		
		Map<String, Object> map = new HashMap<String, Object>();
			map.put("result", insertCnt);
			map.put("rcpNo", ptAssinmentVO.getRcpNo());
			map.put("paName", ptAssinmentVO.getPaName());
			map.put("ptBedCd", ptAssinmentVO.getPtBedCd());
//		log.info("resultMap : {}" ,map);
		return map;
	}

	/**
	 * 환자 검색
	 * @param map
	 */
	@ResponseBody
	@PostMapping("/ptPatientSearch")
	public List<PatientVO> patientSearch(@RequestBody Map<String, String> map) {
		List<PatientVO> list = service.searchPatients(map);
		return list;
	}
	/**
	 * 환자 치료일지 검색
	 * @param map
	 */
	@ResponseBody
	@PostMapping("/searchAgoDocu")
	public List<PtAssinmentVO> searchAgoDocu(@RequestBody Map<String, String> map) {
		List<PtAssinmentVO> list = service.searchAgoDocu(map);
		return list;
	}

	/**
	 * 환자조회 List 출력(초기화면)
	 * @return
	 */
	@ResponseBody
	@GetMapping("/patientList")
	public List<PatientVO> patientList() {
		List<PatientVO> list = service.selectPatientList();
		return list;
	}
	
	/**
	 * 물리치료기록서 List 출력
	 * @return
	 */
	@ResponseBody
	@GetMapping("/ptDocumentList")
	public List<PtAssinmentVO> ptDocumentList() {
		log.info("hello ptAssinmentVOList : {dsdsdsdsdsdsdsdsd}");
		List<PtAssinmentVO> ptDocument = service.retrievePtDocument();
		return ptDocument;
	}
	
	/**
	 * 환자 차트 조회
	 * @param trmChartVO
	 * @return
	 */
	@ResponseBody
	@PostMapping(value = "/ptPatientChart" ,produces = MediaType.APPLICATION_JSON_UTF8_VALUE )
	public List<TrmChartVO> ptPatientChart(@RequestBody TrmChartVO trmChartVO) {
//		trmChartVO 로 받아서 Ajax에 Map으로 넘겨준다
		List<TrmChartVO> list = service.retrievePtChart(trmChartVO);
		return list;
	}
	
	
	/**
	 * 치료일지 Insert
	 * @param ptAssinmentVO
	 * @return
	 */
	@ResponseBody
	@PostMapping(value = "/ptCureWrite" ) 
	public List<PtAssinmentVO> ptCureWrite(@RequestBody PtAssinmentVO ptAssinmentVO, RedirectAttributes reAttributes ) {
		int list = service.createCureWrite(ptAssinmentVO);
		log.info("나오고 있늬이 ? list {}  : ", list);
//		if문해서 리다이렉트해서 뿌려준다
		
		List<PtAssinmentVO> ptAssinmentVOList = this.service.retrievePtDocument();
		
		return ptAssinmentVOList;
		
	}
}