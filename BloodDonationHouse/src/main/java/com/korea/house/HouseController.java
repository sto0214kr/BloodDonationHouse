package com.korea.house;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HouseController {

	// 메인 페이지 맵핑
	@RequestMapping(value= {"/","/index.do"})
	public String index() {
		
		return "/WEB-INF/views/index.jsp";
	}
		
}
