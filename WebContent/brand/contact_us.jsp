<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Open+Sans&display=swap" rel="stylesheet">
  <style>
    *{
    margin:0;
    padding:0;
    color: #818181;
    }
    span {
      font-family: 'Open Sans', 'Noto Sans KR', sans-serif;
    }
    #map {
      border: 1px solid black;
      margin: 30px auto auto auto;
    }
    #con_title {
      text-align: center;
      margin: 10px auto auto auto;
    }
    #title_name {
      font-size: 32px;
    }
    #con_section {
      text-align: center;
      margin-top: 12px;
    }
  </style>
  <title>contact_us</title>
</head>
<body>
  <div id="con_title">
    <span id="title_name">오시는 길</span>
  </div>
	<div id="map" style="width:600px;height:500px;"></div>
  <div id="con_section">
    <span>주소 : 서울특별시 중구 태평로1가 31</span><br>
    <span>번호 : 02-123-4567</span>
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
</body>
</html>