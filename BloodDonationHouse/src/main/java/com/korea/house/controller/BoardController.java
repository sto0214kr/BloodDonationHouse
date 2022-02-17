package com.korea.house.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.korea.house.dao.BoardDAO;
import com.korea.house.util.Common;
import com.korea.house.util.Paging;
import com.korea.house.vo.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	HttpServletRequest request;

	BoardDAO board_dao;
	
	public void setBoard_dao(BoardDAO board_dao) {
		this.board_dao = board_dao;
		System.out.println("--- BoardController의 setter ---");
	}
	
	// 공지사항 전체 목록 맵핑
	@RequestMapping("/community.do")
	public String community(Model model, String page) {
		
		// 페이징 처리
		int nowPage = 1;	// 기본 페이지
		
		if(page != null && !page.isEmpty()) {
			nowPage = Integer.parseInt(page);
		}
		
		int start = (nowPage - 1) * Common.Board.BLOCKLIST + 1;
		int end = start + Common.Board.BLOCKLIST -1;
		
		List<BoardVO> list = board_dao.list(start, end);
		
		// 전체 게시물 수
		int row_total = board_dao.rowTotal();
		
		// 하단부에 추가될 페이지 메뉴 생성
		String pageMenu = Paging.getPaging(
				"community.do", 	// 호출되는 페이지 url 경로
				nowPage,	// 현재 페이지 번호 
				row_total, 	// 전체 게시물 수
				Common.Board.BLOCKLIST, 
				Common.Board.BLOCKPAGE);
		
		model.addAttribute("list", list);
		model.addAttribute("pageMenu", pageMenu);
		
		// 세션에 저장해 둔 read라는 키 값을 제거
		HttpSession session = request.getSession();
		session.removeAttribute("read");
		
		return "/WEB-INF/views/community/community.jsp";
	}
	
	// 공지사항 글 등록 폼 맵핑
	@RequestMapping("/write_form.do")
	public String write_form() {
		
		return "/WEB-INF/views/community/write_form.jsp";
	}
	
	// 공지사항 글 등록 맵핑
	@RequestMapping("/write.do") 
	public String write(BoardVO vo) {
		
		board_dao.insert(vo);
		
		return "redirect:community.do";
	}
	
	// 공지사항 상세페이지 맵핑
	@RequestMapping("/view.do")
	public String view(Model model, int idx) {
		
		BoardVO vo = board_dao.selectOne(idx);
		
		// 조회수 증가
		HttpSession session = request.getSession();
		String show = (String)session.getAttribute("read");
		
		if(show == null) {
			board_dao.readnum(idx);
			session.setAttribute("read", "yes");
		}
		
		model.addAttribute("vo", vo);
		
		return "/WEB-INF/views/community/view.jsp";
	}
	
	// 공지사항 수정 맵핑
	@RequestMapping("/modify.do")
	public String modify(BoardVO vo) {
		
		board_dao.update(vo);
		
		return "redirect:community.do";
	}
	
	// 공지사항 삭제 맵핑
	@RequestMapping("/del.do")
	public String delete(int idx) {
		
		board_dao.delete(idx);
		
		return "redirect:community.do";
	}
	
}
