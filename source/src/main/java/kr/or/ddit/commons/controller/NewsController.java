package kr.or.ddit.commons.controller;

import java.io.IOException;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/commons")
public class NewsController {

	@GetMapping(value="/sch/{word}",produces="text/plain;charset=utf-8")
	@ResponseBody
	public String getNews(@PathVariable String word) throws Exception{
	 	return Request.Get("https://news.google.com/rss/search?q="+word+"&hl=ko&gl=KR&ceid=KR:k")
	    .execute().returnContent().toString();
	}
	
	@GetMapping("/news")
	public String newsTest() {
		return "/commons/test";
	}
	
}
