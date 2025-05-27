<%@page import="kr.co.sist.place.RestDTO"%>
<%@page import="kr.co.sist.place.PlaceService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ include file="../common/jsp/site_config.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../common/jsp/login_chk.jsp" %>
<%
String paramRestNum=request.getParameter("num");
int num=0;
try{
	num=Integer.parseInt(paramRestNum);
}catch(NumberFormatException nfe){
	
}
PlaceService ps = new PlaceService();
RestDTO rDTO = ps.searchOneRestaurant(num);
pageContext.setAttribute("rDTO", rDTO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ site_name }-맛집상세정보</title>
<c:import url="${url}/common/jsp/external_file.jsp"/>

<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e6d7826fd651b9cbede904ecba8d43e3"></script>
<script>
$(function(){
	
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${ rDTO.lat }, ${ rDTO.lng }), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도를 클릭한 위치에 표출할 마커입니다
var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시합니다
marker.setMap(map);

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    // 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng; 
    
    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);
    
    $("#lat").val(latlng.getLat());//위도 설정
    $("#lng").val(latlng.getLng());//경도 설정
});//addListener
});//ready
</script>
<script type="text/javascript">
$(function(){
	$("#btnAdd").click(function(){
		<c:choose>
		<c:when test="${ empty userData.id }">
		if(confirm("식당 정보를 입력하시려면 로그인 하세요 \n 로그인 하시겠습니까?")){
			location.href="../login/login_frm.jsp"
		}//end if
		</c:when>
		<c:otherwise>
		var restaurant=$("#restaurant").val();
		var menu=$("#menu").val();
		var price=$("#price").val();
		var info=$("#info").val();
		
		if(restaurant.trim() == ""){
			alert("식당명은 필수 입력!!");
			$("#restaurant").focus();
			return;
		}
		if(menu.trim() == ""){
			alert("대표메뉴 필수 입력!!");
			$("#menu").focus();
			return;
		}
		if(price.trim() == ""){
			alert("대표메뉴의 가격 필수 입력!!");
			$("#price").focus();
			return;
		}
		if(info.trim() == ""){
			alert("식당설명은 필수 입력!!");
			$("#info").focus();
			return;
		}
		$("#restFrm").submit();
		
		</c:otherwise>
		</c:choose>
	});//click
});//ready


</script>
</head>
<body>
<header data-bs-theme="dark">
<c:import url="${ url }/common/jsp/header.jsp"/>
</header>
<main>
<div id="container">
<div id="restWrap" style="width: 80%; margin: 0px auto">
<h3>맛집보기</h3>
<div id="map" style="width:100%;height:550px; border: solid 1px #dedede;"></div>
<table>
<tbody>
<tr>
<td colspan="2" style="text-align: center;">
<h3>맛집 정보</h3>
</td>
</tr>
<tr>
<td>식당명</td>
<td><strong><c:out value="${ rDTO.restaurant }"/></strong></td>
</tr>
<tr>
<td>대표메뉴</td>
<td><strong><c:out value="${ rDTO.menu }"/></strong></td>
</tr>
<tr>
<td>메뉴가격</td>
<td><strong><fmt:formatNumber value="${ rDTO.price }" pattern="#,###"/>원</strong></td>	
</tr>
<tr>
<td>식당정보</td>
<td><strong><c:out value="${ rDTO.info }"/></strong></td>
</tr>
<tr>
<td>작성일/작성일</td>
<td><strong><c:out value="${ rDTO.id }"/>/
<fmt:formatDate value="${ rDTO.input_date }" pattern="yyyy-MM-dd EEEE HH:mm"/></strong></td>
</tr>
<tr>
<td colspan="2" style="text-align: center;">
<a href="restaurant_list.jsp" class="btn btn-info">맛집리스트</a>
</td>
</tr>

</tbody>
</table>

</div>
</div>
</main>
<footer class="text-body-secondary py-5">
<c:import url="${ url }/common/jsp/footer.jsp"/>
  
</footer>


</body>
</html>