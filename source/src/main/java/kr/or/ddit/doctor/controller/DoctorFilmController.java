package kr.or.ddit.doctor.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.vo.FilmAtchDetailVO;
import kr.or.ddit.doctor.service.DoctorService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/doctor")
public class DoctorFilmController {

	@Inject
	DoctorService service;
	
	@GetMapping("/filmDetail")
	public String enterFilmView() {
		return "sub/doctorFilm";
	}
	
	@ResponseBody
	@GetMapping("/filmList/{trmCd}")
	public List<FilmAtchDetailVO> getFilmList( @PathVariable String trmCd) {
		List<FilmAtchDetailVO> filmList = service.retreiveFilmResult(trmCd);
		log.info("filmList : {}", filmList);
		return filmList;
	}
}
