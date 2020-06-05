<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-sclae=1">
	<link rel="stylesheet" href="css/enter.css">

<title>※탑골뮤직차트※</title>
</head>
<body>

<form action="ChartFind" method ="get" id="chart">
년도를 입력하세요!<br>
	<input type="text" name="year" id="year">
	<input type="submit" value="제출">
</form>

<table >
<thead>
<tr>
	<th>
	</th>
</tr>
</thead>
<tbody id="ajaxTable">
	<tr>
		<td></td>
		<td></td>
		<td></td>
	</tr>
</tbody>
</table>

</body>
</html>