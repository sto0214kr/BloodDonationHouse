package com.korea.house.dao;

import org.apache.ibatis.session.SqlSession;

import com.korea.house.vo.MemberVO;

public class MemberDAO {

	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println("--- MemberDAO의 setter ---");
	}
	
	// 회원가입 
	public int insert(MemberVO vo) {
		
		int res = sqlSession.insert("m.member_insert", vo);
		
		return res;
	}
	
	// 로그인
	public MemberVO select_login(MemberVO vo) {
		
		MemberVO res = sqlSession.selectOne("m.member_login", vo);
		
		return res;
	}
	
	// 회원정보 한건 조회
	public MemberVO selectOne(String id) {
		
		MemberVO vo = sqlSession.selectOne("m.member_one", id);
		
		return vo;
	}
	
	// 회원정보 수정
	public int update(MemberVO vo) {
		
		int res = sqlSession.update("m.member_update", vo);
		
		return res;
	}
	
	// 회원 탈퇴
	public int delete(int idx) {
		
		int res = sqlSession.delete("m.member_delete", idx);
		
		return res;
	}
	
	// 아이디 찾기
	public MemberVO fineId(MemberVO vo) {
		
		MemberVO res = sqlSession.selectOne("m.member_fine_id", vo);
		
		return res;
	}
	
	// 비밀번호 찾기
	public MemberVO finePwd(MemberVO vo) {
		
		MemberVO res = sqlSession.selectOne("m.member_fine_pwd", vo);
		
		return res;
	}
	
	// 비밀번호 재설정
	public int finePwdReset(MemberVO vo) {
		
		int res = sqlSession.update("m.member_fine_pwd_reset", vo);
		
		return res;
	}
	
}
