package com.korea.house.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.korea.house.dao.MemberDAO;
import com.korea.house.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	JavaMailSender mailSender;

	MemberDAO member_dao;
	
	public void setMember_dao(MemberDAO member_dao) {
		this.member_dao = member_dao;
		System.out.println("--- MemberController의 setter ---");
	}
	
	// 로그인 맵핑
	@RequestMapping("/login_form.do")
	public String login_form() {
		
		return "/WEB-INF/views/member/login_form.jsp";
	}
	
	// 로그인 맵핑
	@RequestMapping("/login.do")
	public String login(MemberVO vo) {
		
		MemberVO res = member_dao.select_login(vo);
		
		if(res == null) {
			
			return "redirect:login_form.do?chk=1";			
		}
		
		session.setAttribute("loginid", vo.getId());
		
		return "/WEB-INF/views/index.jsp";
	}
	
	// 회원가입 폼 맵핑
	@RequestMapping("/join_form.do")
	public String join_form() {
		
		return "/WEB-INF/views/member/join_form.jsp";
	}
	
	// 회원가입 맵핑
	@RequestMapping("/join.do")
	public String join(MemberVO vo) {
		
		member_dao.insert(vo);
		
		return "/WEB-INF/views/member/login_form.jsp";
	}
	
	// 로그아웃 맵핑
	@RequestMapping("/logout.do")
	public String logout() {
		
	//	session.removeAttribute("loginid");
		session.invalidate();
		
		return "redirect:index.do";
	}
	
	// 회원정보 : mypage
	@RequestMapping("/mypage.do")
	public String mypage(Model model, String id) {
				
		id = (String)session.getAttribute("loginid");
		
		//System.out.println("로그인 한 아이디 : " + id);
		
		MemberVO vo = member_dao.selectOne(id);
		
		model.addAttribute("vo", vo);
		
		return "/WEB-INF/views/member/mypage.jsp";
	}
	
	// 회원정보 수정 맵핑
	@RequestMapping("/update.do")
	public String update(MemberVO vo) {
		
		member_dao.update(vo);
		
		return "redirect:mypage.do";
	}
	
	// 회원 탈퇴 맵핑
	@RequestMapping("/delete.do")
	public String delete(int idx) {
		
		member_dao.delete(idx);
		
		session.invalidate();
		
		return "redirect:index.do";
	}
	
	// 아이디 찾기 폼 맵핑
	@RequestMapping("/fine_id_form.do")
	public String fine_id_form() {
		
		return "/WEB-INF/views/member/fine_id.jsp";
	}
	
	// 아이디 찾기 맵핑
	@RequestMapping("/fine_id.do")
	public String fine_id(MemberVO vo, Model model) {
		
		MemberVO res = member_dao.fineId(vo);
		
		if(res == null) {
			
			return "redirect:fine_id_form.do?chk=1";
		}
		
		model.addAttribute("vo", res);
		
		return "/WEB-INF/views/member/fine_id_value.jsp";
	}
	
	// 비밀번호 찾기 폼 맵핑
	@RequestMapping("/fine_pwd_form.do")
	public String fine_pwd_form() {
		
		return "/WEB-INF/views/member/fine_pwd.jsp";
	}
	
	// 비밀번호 찾기 맵핑
	@RequestMapping("/fine_pwd.do")
	public String fine_pwd(MemberVO vo, Model model) {
		
		MemberVO res = member_dao.finePwd(vo);
		
		if(res == null) {
			
			return "redirect:fine_pwd_form.do?chk=1";
		}
		
		model.addAttribute("vo", res);
		
		// 인증번호 이메일 : 난수 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;	// 111111 ~ 999999
		System.out.println("=== 인증번호 : " + checkNum);
		
		// 이메일 보내기 
        String setFrom = "sto0214kr@naver.com";
        String toMail = vo.getEmail();
        String title = "비밀번호 찾기 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        // 인증번호 넘기기
        request.setAttribute("checkNum", checkNum);
		
		return "/WEB-INF/views/member/fine_pwd_pass.jsp";
	}
	
	// 비밀번호 인증번호 맵핑
	@RequestMapping("/fine_pwd_pass.do")
	public String fine_pwd_pass() {
				
		return "/WEB-INF/views/member/fine_pwd_pass.jsp";
	}
	
	// 비밀전호 재설정 폼 맵핑
	@RequestMapping("/fine_pwd_reset_form.do")
	public String fine_pwd_reset_form(Model model, int idx) {
	
		model.addAttribute("idx", idx);
		
		return "/WEB-INF/views/member/fine_pwd_reset.jsp";
	}
	
	// 비밀번호 재설정 맵핑
	@RequestMapping("/fine_pwd_reset.do")
	public String fine_pwd_reset(MemberVO vo) {
		
		request.removeAttribute("checkNum");
		
		member_dao.finePwdReset(vo);
		
		return "redirect:login_form.do";
	}
		
}
