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
import kr.or.ddit.radiology.service.RadiologyService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/radiology")
@Controller
public class FilmRecodeController {
   
	@Inject
	private RadiologyService service;
	
	@GetMapping("/filmRecodeView") // 촬영기록보기
	public String filmRecodeView() {
		String viewName = null;
		viewName = "radiology/filmRecodeView";
      
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
		
		List<FilmCateVO> list = service.retrieveFilmRecodeList(map);
		model.addAttribute("filmList",list);
		log.info("list : {}",list);
		
		return list;
	}
}