package com.korea.house.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchController {

	@RequestMapping("/location.do")
	public String search() {
		
		return "/WEB-INF/views/search/location.jsp";
	}
	
	// 지도 보기 맵핑
	@RequestMapping("/location_map.do")
	public String search_map() {
		
		return "/WEB-INF/views/search/location_map.jsp";
	}
	
}
