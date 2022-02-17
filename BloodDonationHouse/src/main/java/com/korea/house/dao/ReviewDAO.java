package com.korea.house.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.korea.house.vo.ReviewVO;

public class ReviewDAO {

	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println("--- ReviewDAO의 setter ---");
	}
	
	// 리뷰 전체 목록
	public List<ReviewVO> review_list() {
		
		List<ReviewVO> list = sqlSession.selectList("r.review_list");
		
		return list;
	}
	
	// 리뷰 등록 
	public int review_insert(ReviewVO vo) {
		
		int res = sqlSession.insert("r.review_insert", vo);
		
		return res;
	}
	
	// 리뷰 삭제
	public int review_delete(int idx) {
		
		int res = sqlSession.delete("r.review_delete", idx);
		
		return res;
	}
	
	// 리뷰 수정위한 한 건의 정보 조회
	public ReviewVO review_update_one(int idx) {
		
		ReviewVO vo = sqlSession.selectOne("r.review_one", idx);
		
		return vo;
	}
	
	// 리뷰 수정
	public int review_update(ReviewVO vo) {
		
		int res = sqlSession.update("r.review_update", vo);
		
		return res;
	}
	
}
