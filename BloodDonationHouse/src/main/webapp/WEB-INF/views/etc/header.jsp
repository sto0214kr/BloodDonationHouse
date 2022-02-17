<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 	<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Clean Blog - Start Bootstrap Theme</title>
        <link rel="icon" type="image/x-icon" href="${ pageContext.request.contextPath }/resources/assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${ pageContext.request.contextPath }/resources/css/styles.css" rel="stylesheet" />
               
    </head>
    <body>
 
 <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="index.do">BloodDonation_House</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto py-4 py-lg-0">
                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="index.do">Home</a></li>
                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="review.do">Review</a></li>
                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="location.do">Location</a></li>
                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="community.do">community</a></li>
                    
                    <!-- 로그인 / 회원가입 / 로그아웃 메뉴 시작 -->
                    <c:if test="${empty sessionScope.loginid}">
                    	<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="login_form.do">Login/Join</a></li>
                	</c:if>
                	<c:if test="${not empty sessionScope.loginid}">
                		<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="mypage.do">${sessionScope.loginid}♡MyPage</a></li>
                    	<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="logout.do">LogOut</a></li>
                    </c:if>
                    <!-- 로그인 / 회원가입 / 로그아웃 메뉴 끝 -->
                </ul>
            </div>
        </div>
    </nav>