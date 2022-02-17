<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
        
        <%@include file="../etc/header.jsp" %>
        
        <style>
        	.btn_review {
        		margin-left: 200px;
        		margin-bottom: 20px;
        		width: 180px;
        	}
        	.img_box{
        		width: 150px;
        		float: left;
        	}
        	.content_box{
        		font-size: 14px;
        	}
        	.content_box .col {
        		padding-left: 20px;
        		margin-top: 50px;
        	}
        	.name_box{
        		clear: both;
        		font-size: 14px;
        	}
        	.writeday_box{
        		font-size: 14px;
        	}
        	.btn_box {
        		text-align: right;
        		font-size: 12px;
        	}
        </style>
        
        <!-- Page Header-->
        <header class="masthead" style="background-image: url('assets/img/home-bg.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="page-heading">
                            <h2 align="center">Review</h2>
                            <span class="subheading">My blood donation record.</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Main Content-->
        <main class="mb-4">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <p>Thank you for your enjoyable blood donation review. We look forward to your participation.</p>
                        
                        <div>
                        	<input class="btn btn-primary btn_review" value="Review Write" onclick="location.href='review_write_form.do'">
                        </div>
                        
                        <!-- 한줄 포토 리뷰 -->
                        <div style="overflow: auto;">
	                        <c:forEach var="vo" items="${ list }">
	                        
	                        	<div class="img_box">
	                        		<!-- 첨부된 이미지가 있을때만 img태그를 사용 -->
									<c:if test = "${ vo.filename ne 'no_file' }">
										<img src="${ pageContext.request.contextPath }/resources/upload/${vo.filename}" width="130">
									</c:if>
									<c:if test="${ vo.filename eq 'no_file' }">
										<img src="${ pageContext.request.contextPath }/resources/img/no_img.jfif" width="130">
									</c:if>
	                        	</div>
	                        	
	                        	<div class="form-floating content_box">
	                        		<pre><input class="form-control col" value="${ vo.content }"></pre>
	                        	</div>
	                        	
	                        	<div class="name_box">작성자 : ${ vo.name }(${vo.member_id})</div>
	                        	<div class="writeday_box">작성일 : 
									<c:set var="textValue" value="${ vo.writeday }"/>
	                    						${ fn:substring(textValue, 0, 16) }
								</div>
								
								<c:if test="${ sessionScope.loginid eq vo.member_id }">
									<form>
										<input type="hidden" value="${ vo.idx }" name="idx" id="idx">
									
										<div class="btn_box">
											<input type="button" value="수정" onclick="modify(this.form);">
											<input type="button" value="삭제" onclick="del(this.form);">
										</div>
									</form>
								</c:if>
								<br>
	                        </c:forEach>
                        </div>
                        
                    </div>
                </div>
            </div>
        </main>
        
        <script>
        	// 수정
        	function modify(f) {
        		
        		var idx = f.idx.value;
        		
        		if(!confirm("해당 리뷰를 수정하시겠습니까?")) {
        			return;
        		}
        		
        		f.action = "review_update_form.do?idx=" + idx;
        		f.method = "post";
        		f.submit();
        	}
        	
        	// 삭제
        	function del(f) {
        		
        		var idx = f.idx.value;
        		//alert(idx);
        		if(!confirm("정말 삭제하시겠습니까?")) {
        			return;
        		}
        		
        		f.action = "review_delete.do?idx=" + idx;
        		f.method = "post";
        		f.submit();
        	}
        </script>
        
        <%@include file="../etc/footer.jsp" %>