<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>영화 등록</title>
<script src="assets/scripts/theaterform.js"></script>
</head>
<body>
<%@ page import="java.util.ArrayList, theater.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	String	location	=	"";
	String  address     =   "";
	String	room_num	=	"";
	String	seat	=	"";
	String	time_schedule	=	"";
	
	String	headline = "등록";

	String theater_id= request.getParameter("id");
	
	if (theater_id != null){
		// 등록이 아닌 경우 출력을 위해 각 필드 내용을 저장
		int idnum = Integer.parseInt(theater_id);
		TheaterDatabase theaterdb = new TheaterDatabase();
		TheaterEntity theater	= theaterdb.getTheater(idnum);
		
		location=theater.getLocation();
		address=theater.getAddress();
		room_num=theater.getRoom_num();
		seat=theater.getSeat();
		time_schedule=theater.getTime_schedule();
		
		headline = "수정 삭제";	
	};
%>
<h2> 극장 <%= headline %> 프로그램 </h2>
<form name=theaterform method=post action="processthetaer.jsp">
<!-- menu : 등록, 수정 또는 삭제 구분을 위한 매개변수로 이용 -->
<input type=hidden name="menu" value="insert">
<!-- 수정, 삭제를 위한 parameter 전송 -->
<input type=hidden name="id" value="<%= theater_id %>">
<table>
<tr>
<td>위치 : <input type=text name=location value="<%= location %>"></td>
<td>주소 : <input type=text name=address value="<%= address %>"/></td>
<td>관 : <input type=number name=room_num value="<%= room_num %>"></td>
<td>좌석 : <input type=text name=seat value="<%= seat %>"></td>
<td>장르 : <input type=text name=time_schedule value="<%= time_schedule %>"></td>

</tr>
</table>
<% if (theater_id == null){ %>
	<input type="button" value="등록" onClick="insertcheck()"><input type="reset">
<%}else{ %>
	<input type="button" value="수정" onClick="updatecheck()"><input type="button" value="삭제" onClick="deletecheck()">
<% } %>
<input type="button" value="목록" onClick="location.href='listtheaters.jsp'">

</form>
</body>
</html>