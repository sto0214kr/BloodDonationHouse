package com.korea.house.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.korea.house.dao.ReviewDAO;
import com.korea.house.vo.ReviewVO;

@Controller
public class ReviewController {
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	ServletContext application;

	ReviewDAO review_dao;
	
	public void setReview_dao(ReviewDAO review_dao) {
		this.review_dao = review_dao;
		System.out.println("--- ReviewController의 setter ---");
	}
	
	// 리뷰 전체목록 맵핑
	@RequestMapping("/review.do")
	public String review_list(Model model) {
		
		List<ReviewVO> list = review_dao.review_list();
		
		model.addAttribute("list", list);
		
		return "/WEB-INF/views/review/review.jsp";
	}
	
	// 리뷰 글쓰기 폼 맵핑
	@RequestMapping("/review_write_form.do")
	public String review_write_form() {
		
		return "/WEB-INF/views/review/review_write_form.jsp";
	}
	
	// 리뷰 글쓰기 맵핑
	@RequestMapping("/review_write.do") 
	public String review_write(ReviewVO vo) {
		
		// 파일 업로드를 위한 절대경로 지정
		String webPath = "/resources/upload/";
		String savePath = application.getRealPath(webPath);
		System.out.println("== savePath : " + savePath);
		
		// 파라미터로 넘어온 파일의 정보
		MultipartFile photo = vo.getPhoto();
		
		String filename = "no_file";
		
		// 수신된 photo가 존재한다면
		if(!photo.isEmpty()) {
			
			filename = photo.getOriginalFilename();
			
			// 파일을 저장할 경로를 생성
			File saveFile = new File(savePath, filename);
			
			if(!saveFile.exists()) {
				saveFile.mkdirs();
				
			} else {
				// 업로드 시도시, 동일한 이름의 파일이 존재할 경우 업로드 시간을 붙여서 중복을 방지
				
				// currentTimeMillis() : 1970/1/1 ~ 현재까지의 경과시간을 1/1000단위로 저장하고 있는 메소드
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}
			try {
				// saveFile이 가지고 있는 경로에 실제로 파일을 업로드
				// 폴더 -> 이미지로 저장
				photo.transferTo(saveFile);
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		vo.setFilename(filename);
		
		review_dao.review_insert(vo);
		
		return "redirect:review.do";
	}
	
	// 리뷰 삭제 맵핑
	@RequestMapping("/review_delete.do")
	public String review_delete(int idx) {
		
		review_dao.review_delete(idx);
		
		return "redirect:review.do";
	}
	
	// 리뷰 수정 폼 맵핑
	@RequestMapping("/review_update_form.do")
	public String review_update_form(Model model, int idx) {
		
		ReviewVO vo = review_dao.review_update_one(idx);
		
		model.addAttribute("vo", vo);
		
		return "/WEB-INF/views/review/review_update_form.jsp";
	}
	
	// 리뷰 수정 맵핑
	@RequestMapping("/review_update.do")
	public String review_update(ReviewVO vo) {
		
		// 파일 업로드를 위한 절대경로 지정
		String webPath = "/resources/upload/";
		String savePath = application.getRealPath(webPath);
		System.out.println("== savePath : " + savePath);
				
		// 파라미터로 넘어온 파일의 정보
		MultipartFile photo = vo.getPhoto();
				
		String filename = "no_file";
				
		// 수신된 photo가 존재한다면
		if(!photo.isEmpty()) {
					
			filename = photo.getOriginalFilename();
					
			// 파일을 저장할 경로를 생성
			File saveFile = new File(savePath, filename);
					
			if(!saveFile.exists()) {
				saveFile.mkdirs();
						
			} else {
				// 업로드 시도시, 동일한 이름의 파일이 존재할 경우 업로드 시간을 붙여서 중복을 방지
						
				// currentTimeMillis() : 1970/1/1 ~ 현재까지의 경과시간을 1/1000단위로 저장하고 있는 메소드
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}
			try {
				// saveFile이 가지고 있는 경로에 실제로 파일을 업로드
				// 폴더 -> 이미지로 저장
				photo.transferTo(saveFile);
						
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		vo.setFilename(filename);
		
		review_dao.review_update(vo);
		
		return "redirect:review.do";
	}
	
}
