<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
      
      <%@include file="../etc/header.jsp" %>
      
        <!-- Page Header-->
        <header class="masthead" style="background-image: url('assets/img/home-bg.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="page-heading">
                            <h2 align="center">Community</h2>
                            <span class="subheading">Various website notices.</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Post Content-->
        <article class="mb-4">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                    
                    	<table class="table table-striped table-bordered table-hover" border="1">
                    		<tr>
                    			<th width="25">NO.</th>
                    			<th width="400">Title</th>
                    			<th width="50">Count</th>
                    			<th width="120">WriteDay</th>
                    		</tr>
                    		<c:forEach var="vo" items="${ list }">
                    			<tr>
                    				<td align="center">${ vo.idx }</td>
                    				<td><a href="view.do?idx=${ vo.idx }&page=${param.page}">${ vo.title }</a></td>
                    				<td align="center">${ vo.readnum }</td>
                    				<td>
                    					<c:set var="textValue" value="${ vo.writeday }"/>
                    						${ fn:substring(textValue, 0, 10) }
                    				</td>
                    			</tr>
                    		</c:forEach>
                    		<tr>
								<td colspan="4" align="center">
									${ pageMenu }
								</td>
							</tr>
                    	</table>
                    	
                    	<!-- 관리자만 글 등록 가능 -->
                    	<c:if test="${ sessionScope.loginid eq 'admin'}">
                  			<input class="btn btn-primary" type="button" value="Write" onclick="location.href='write_form.do'">
                    	</c:if>
                    </div>
                </div>
            </div>
        </article>
        
        <%@include file="../etc/footer.jsp" %>