<%@page import="org.json.simple.*"%>
<%@page import="org.json.simple.parser.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/result.css">
<title>※탑골뮤직차트※</title>
</head>

<body>
<%
	String jsonstr =(String)request.getAttribute("returnResult");
	System.out.print(jsonstr);
	System.out.println();
	
	JSONParser jsonParser = new JSONParser();
	JSONObject jsonObj = (JSONObject)jsonParser.parse(jsonstr); //chart
	
	System.out.println("jsonObj:"+ jsonObj);
	JSONArray jsonArr= (JSONArray)jsonObj.get("ChartArray");
%>
<h2 class="yearTitle"> ♣ <%=jsonObj.get("year") %> 년의 음악 차트 ♣ </h2>
<hr class="line">
	<table>
	<thead>
		<tr>
			<td><div class="first">순위</div></td>
			<td><div class="second">노래명</div></td>
			<td><div class="third">가수명</div></td>
			<td><div class="four">앨범명</div></td>
		</tr>
	</thead>
	<tbody>
	<%
	for(int i=0;i<jsonArr.size();i++){
		JSONObject obj = (JSONObject)jsonArr.get(i);
%>
<tr>
		<td><%= i+1 %>위 </td>
		<td><%= obj.get("title")%></td>
		<td><%= obj.get("artist")%></td>
		<td><%= obj.get("albumTitle")%></td>
	</tr>
<%} %>
</table>
</body>
</html>