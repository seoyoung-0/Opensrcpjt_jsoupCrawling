<%@page import="org.json.simple.*"%>
<%@page import="org.json.simple.parser.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>※탑골뮤직차트※</title>
</head>

<body>
<%
	String jsonstr =(String)request.getAttribute("returnResult");
	System.out.print(jsonstr);
	System.out.println();
	
	JSONParser jsonParser = new JSONParser();
	JSONObject jsonObj = (JSONObject)jsonParser.parse(jsonstr); //chart
	
	JSONArray jsonArr= (JSONArray)jsonObj.get("ChartArray");
%>
	<table>
	<thead>
		<tr>
			<td>순위</td>
			<td>노래명</td>
			<td>가수명</td>
			<td>앨범명</td>
		</tr>
	</thead>	
	<tbody>
	<%
	for(int i=0;i<jsonArr.size();i++){
		JSONObject obj = (JSONObject)jsonArr.get(i);
%>
	<tr>
		<td><%=i+1 %></td>
		<td><%= obj.get("title")%></td>
		<td><%= obj.get("artist")%></td>
		<td><%= obj.get("albumTitle")%></td>
	</tr>
<%} %>
</table>
</body>
</html>