<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-sclae=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/enter.css">
<title>※탑골뮤직차트※</title>
</head>

<body>

<div class="wrapper">
	<img class="cd" src="css/cd.png">
	<div class="title">
		<span class="prjtitle"> ★ 뮤 직 차 트 ★</span>
	</div>
<div class="box">
	<form action="ChartFind" method ="get" id="chart" >
		<input type="text" name="year" placeholder="년도를 입력하세요 ! "class="enter-year" id="year">
		<input type="submit" class="btn" value="Go">
	</form>
</div>
</div>
</body>
</html>
