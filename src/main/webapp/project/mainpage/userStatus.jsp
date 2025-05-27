<%@page import="kr.co.gungon.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%

%>
<div class="header">
<div class="user-status-bar">
  <% if (session.getAttribute("userData") != null) { 
	  String loginUser = ((MemberDTO)session.getAttribute("userData")).getId() ;
	  System.out.print(loginUser);
  %>
    <div class="user-status-logged-in">
      <span class="user-name"><strong><%= loginUser %></strong>님</span>
      <a href="http://localhost/jsp_prj/project/mypage/mypage.jsp"><img src="http://192.168.10.72/jsp_prj/common/images/user_profile.png">
      <strong>  마이페이지</strong></a>
      <a href="#"><img src="http://192.168.10.72/jsp_prj/common/images/logout.png">
      <strong>  로그아웃</strong></a>
    </div> 
  <% } else { %>
    <div class="user-status-guest">
      <a href="http://localhost/jsp_prj/project/singup/sign_up.jsp"><img src="http://localhost/jsp_prj/common/images/user_profile.png">
      <strong>  회원가입</strong></a>
      <a href="http://localhost/jsp_prj/project/login/login.jsp"><span class="login-icon"><i class="fa fa-user"></i></span>
      <img src="http://localhost/jsp_prj/common/images/login.png"><strong>  로그인</strong></a>
      
    </div>
  <% } %>
</div>
</div>
