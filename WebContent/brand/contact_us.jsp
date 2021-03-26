<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:import url="/header.jsp"></c:import>

<div id="contactWrap">

<div id="con_title">
    <span id="title_name">오시는 길</span>
  </div>
	<div id="map" style="width:600px;height:350px;"></div>
  <div id="con_section">
    <span>주소 : 서울특별시 중구 태평로1가 31</span><br>
    <span>번호 : 02-123-4567</span>
  </div>


</div>

  	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c2a2550d5c82d16efa872e92e859be12"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.5666, 126.9784),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>

<c:import url="/footer.jsp"></c:import>