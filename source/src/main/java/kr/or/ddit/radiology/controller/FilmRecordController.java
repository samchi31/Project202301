package kr.or.ddit.radiology.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.vo.FilmCateVO;
import kr.or.ddit.commons.vo.WaitHistoryVO;
import kr.or.ddit.radiology.service.RadiologyService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/radiology")
@Controller
public class FilmRecordController {
   
	@Inject
	private RadiologyService service;
	
	@GetMapping("/filmRecordView") // 촬영기록보기
	public String filmRecordView() {
		String viewName = null;
		viewName = "radiology/filmRecordView";
      
		return viewName;
	}
	
	@ResponseBody
	@GetMapping("/filmList")
	public List filmList () {
		List<FilmCateVO> list = service.retrieveFilmList();
		return list;
		
	}
	
	@ResponseBody
	@PostMapping("/filmSearch")
	public List filmSearch(@RequestBody Map<String, String> map
			,Model model) {
		log.info("searchOption : " + map.get("searchOption"));
		log.info("searchWord :" + map.get("searchWord"));
		
		List<FilmCateVO> list = service.retrieveFilmRecordList(map);
		model.addAttribute("filmList",list);
		log.info("list : {}",list);
		
		return list;
	}
	
	@ResponseBody
	@PostMapping(value="/filmResultList",produces="application/json;charset=utf-8")
	public List RadiAllList(
			@RequestBody WaitHistoryVO whVO) {
		log.info("들어갔다");
		log.info("paNo : {}",whVO.getPaNo());
		List<WaitHistoryVO> list = service.selectfilmResultList(whVO.getPaNo());
		return list;
		
	}
}