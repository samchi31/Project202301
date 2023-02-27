package kr.or.ddit.doctor.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.doctor.service.DoctorService;
import kr.or.ddit.doctor.service.GOService;
import kr.or.ddit.doctor.vo.GroupOrderVO;

@Controller
@RequestMapping("/group")
public class GroupOrderController {
	
	@Inject
	private DoctorService service;
	
	@Inject
	private GOService goService;
	
	@GetMapping("/grouporder")
	public String groupOrderView(Model model) {
		model.addAttribute("disList", service.retrieveDisList());
		model.addAttribute("symList", service.retrieveSymList());
		// model.addAttribute("goList", goService.retrieveGOList());
		
		return "sub/groupOrder";
	}
	
	@ResponseBody
	@GetMapping(value="/grouporder/{goCd}", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public  GroupOrderVO getGO(@PathVariable String goCd) {
		
		GroupOrderVO groupOrderVO = goService.retrieveGO(goCd);
		
		return groupOrderVO;
	}
	
	@ResponseBody
	@PostMapping(value="/grouporder", produces="text/plain;charset=UTF-8")
	public String insertGO(@RequestBody GroupOrderVO groupOrderVO) {
		
		String ret = null;
		
		int rowcnt = goService.createGO(groupOrderVO);
		if(rowcnt > 0) {
			ret = "성공";
		} else {
			ret = "실패";
		}
		
		return ret;
	}
	
	@ResponseBody
	@PostMapping(value="/goUpdate", produces="text/plain;charset=UTF-8")
	public String updateGO(@RequestBody GroupOrderVO groupOrderVO) {
		String ret = null;
		
		int rowcnt = goService.modifyGO(groupOrderVO);
		if(rowcnt > 0) {
			ret = "성공";
		} else {
			ret = "실패";
		}
		
		return ret;
	}
	
	@ResponseBody
	@GetMapping(value="/goDelete/{goCd}", produces="text/plain;charset=UTF-8")
	public String deleteGO(@PathVariable String goCd) {
		String ret = null;
		
		int rowcnt = goService.removeGO(goCd);
		if(rowcnt > 0) {
			ret = "성공";
		} else {
			ret = "실패";
		}
		
		return ret;
	}
	
	@ResponseBody
	@GetMapping(value="/goList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<GroupOrderVO> getGOList(){
		return goService.retrieveGOList();
	}
}
