<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 극장 리스트</title>
</head>
<body>
<%@ page import="java.util.ArrayList, theater.TheaterEntity" %>
<h2>자바 빈즈 TheaterDatabase를 이용한 테이블 THEATER 조회</h2>
<jsp:useBean id="theaterdb" class="theater.TheaterDatabase" scope="page"></jsp:useBean>
<%
request.setCharacterEncoding("euc-kr");

ArrayList<TheaterEntity>list = theaterdb.getTheaterList();
int counter = list.size();
if(counter > 0 ){
%>
<hr><p>조회된 극장은 <%= counter  %> 개 입니다.</p><hr>
<table>
<tr>
	<th><b>이름</b></th>
	<th><b>주소</b></th>
	<th><b>관</b></th>
	
	
</tr>
<%
	for(TheaterEntity theater : list){
%>
<tr>
	<td><%= theater.getTheater_name()%><a href="edittheater.jsp?id=<%=theater.getTheater_id()%>">수정</a></td>
	<td><%= theater.getAddress()%></td>
	<td><%= theater.getTheater_room_id() %></td>
	
		
</tr>
</table>
<%
	}
	
}else{
%>
	<p>등록된 극장이 하나도 없습니다.</p>
<%
}
%>
<form name=form method=post action=edittheater.jsp>
	<input type=submit value="극장 등록">
</form>
	

</html>