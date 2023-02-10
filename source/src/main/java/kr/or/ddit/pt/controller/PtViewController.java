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

import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.commons.vo.PtAssinmentVO;
import kr.or.ddit.commons.vo.ReceptionVO;
import kr.or.ddit.commons.vo.WaitHistoryVO;
import kr.or.ddit.nurse.vo.CexVO;
import kr.or.ddit.pt.dao.PtAssinmentDAO;
import kr.or.ddit.pt.service.PtAssinmentService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/pt")
@Controller
public class PtViewController {
	
	@Inject
	PtAssinmentService service;
	
	@Inject
	PtAssinmentDAO ptAssinmentdao;
	
	@GetMapping("/ptView")
	public String ptView( 
			@ModelAttribute("ptAssinmentVOList") PtAssinmentVO ptAssinmentVO, 
			Model model) {
		
		List<PtAssinmentVO> ptAssinmentVOList = service.ptAssinmentVOList(ptAssinmentVO);
		List<PtAssinmentVO> ptBedList = service.ptBedList();
		
		model.addAttribute("ptAssinmentList", ptAssinmentVOList);
		model.addAttribute("ptBedList",ptBedList);
		String viewName = null;
		viewName = "pt/ptView";

		return viewName;
	}
	/**
	 * Bed 상태를 변경 (물리치료실 대기중->치료중 update)
	 * 대기상태를 insert
	 * @param ptAssinmentVO
	 * @param waitHistoryVO
	 * @return
	 */
	@ResponseBody
	@PostMapping(value ="/ptBedFull", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Map<String, Object> ptBedFull(PtAssinmentVO ptAssinmentVO, WaitHistoryVO waitHistoryVO) {
		
		int result = service.ptBedFull(ptAssinmentVO);
		int result2 = service.cureListChangeInsert(waitHistoryVO);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		if(result > 0) { //성공했다
			ReceptionVO receptionVO = ptAssinmentdao.selectPatient(ptAssinmentVO.getRcpNo());
			resultMap.put("receptionVO", receptionVO);
			resultMap.put("ptAssinmentVO", ptAssinmentVO);
			resultMap.put("waitHistoryVO", waitHistoryVO);
		}
		return resultMap;
	}
	                                          
	/**
	 * Bed 상태를 변경 (물리치료실 치료중->치료완료 update)
	 * 치료 완료 상태를 insert
	 * @param ptAssinmentVO
	 * @param waitHistoryVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/ptBedEmpty")
	public Map<String, Object> ptBedEmpty(PtAssinmentVO ptAssinmentVO , WaitHistoryVO waitHistoryVO) {
		log.info("ptAssinmentVO : " + ptAssinmentVO);
		log.info("WaitHistoryVO : " + waitHistoryVO);
		int result = service.ptBedEmpty(ptAssinmentVO);
		int result2 = service.completionChangeInsert(waitHistoryVO);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(result > 0) {//성공했다면
			ReceptionVO receptionVO = ptAssinmentdao.selectPatient(ptAssinmentVO.getRcpNo());
			resultMap.put("receptionVO", receptionVO);
			resultMap.put("ptAssinmentVO", ptAssinmentVO);
			resultMap.put("waitHistoryVO", waitHistoryVO);
		}
		return resultMap;
	}
	/**
	 * 환자 검색
	 * @param map
	 * @return 
	 * @return
	 */
	@ResponseBody
	@PostMapping("/ptPatientSearch")
	public List<PatientVO> patientSearch(@RequestBody Map<String, String> map) {
		log.info("searchOption : {}",map.get("searchOption"));
		log.info("searchWord : {}" , map.get("searchWord"));
		
		List<PatientVO> list = service.searchPatienList(map);
		return list;
	}
	
	
}