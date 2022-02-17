package com.korea.house.util;

public class Common {

	public static class Board {
		
		public static final String VIEW_PATH = "/WEB-INF/views/board/";
		
		// 한 페이지에 보여줄 게시물 수
		public final static int BLOCKLIST = 5;
		
		// 한 화면에 보여질 페이지 메뉴 수
		// < 1 2 3 4 5 >
		public final static int BLOCKPAGE= 5;
		
	}
	
	// 예를들어 게시판이 여러개인데, 한페이지에 보여줄 게시물 수와
	// 페이지 메뉴 수가 다를 경우...
	public static class Notice {
		
		public final static int BLOCKLIST = 10;
		public final static int BLOCKPAGE= 5;
	}

}
