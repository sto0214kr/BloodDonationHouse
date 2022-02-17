package com.korea.house.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.korea.house.vo.BoardVO;

public class BoardDAO {

	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println("--- BoardDAO의 setter ---");
	}
	
	// 공지사항 전체 목록 조회
	public List<BoardVO> list(int start, int end) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("s", start);
		map.put("e", end);	
		
		List<BoardVO> list = sqlSession.selectList("b.board_list", map);
		
		return list;
	}
	
	// 전체 게시물 수 구하기
	public int rowTotal() {
		
		int count = sqlSession.selectOne("b.board_count");
		
		return count;
	}
	
	// 공지사항 등록
	public int insert(BoardVO vo) {
		
		int res = sqlSession.insert("b.board_insert", vo);
		
		return res;
	}
	
	// 공지사항 상세페이지
	public BoardVO selectOne(int idx) {
		
		BoardVO vo = sqlSession.selectOne("b.board_one", idx);
		
		return vo;
	}
	
	// 공지사항 수정
	public int update(BoardVO vo) {
		
		int res = sqlSession.update("b.board_update", vo);
		
		return res;
	}
	
	// 공지사항 삭제
	public int delete(int idx) {
		
		int res = sqlSession.delete("b.board_delete", idx);
		
		return res;
	}
	
	// 조회수 증가
	public int readnum(int idx) {
		
		int res = sqlSession.update("b.board_readnum", idx);
		
		return res;
	}
	
}
