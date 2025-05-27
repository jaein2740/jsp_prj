<%@page import="kr.co.gungon.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%-- <%@ include file="../common/jsp/site_config.jsp" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
//1. 한글처리
request.setCharacterEncoding("UTF-8");

%>

<jsp:useBean id="mDTO" class="kr.co.gungon.member.MemberDTO" scope="page"/>
<jsp:setProperty property="*" name="mDTO"/>
<% 
	mDTO.setIp(request.getRemoteAddr());
	
	MemberService ms = new MemberService();
	//비연결성인 웹에서 한정적인 자원을 먼저 선점하는 접속자 이외에는 "해당자원을 다른 접속자가
	// 사용중입니다." 를 제공해야한다.
	boolean flag=ms.searchId(mDTO.getId());//아이디가 사용중인지 사용중이면 true
	if(!flag){
	pageContext.setAttribute("addResult", ms.addMember(mDTO));
	}
	
%>
