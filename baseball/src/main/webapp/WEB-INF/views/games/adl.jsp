<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>경기 표</title>
<style>
	table {
		text-align: center;
	}
	tr:nth-child(even) {
		background-color: #e2e2e2;
	}
	
	tr:nth-child(odd) {
		background-color: #d4d4d4;
	}
	th{
		background:#c3c3c3
	}
</style>
</head>
<body>
<c:if test="${userid=='admin'}">
	<%@page import="java.time.LocalDate"%>
	<%
		int y, m;
		LocalDate today = LocalDate.now();
		if (request.getParameter("y") == null) {
			y = today.getYear();
			m = today.getMonthValue();
		} else {
			y = Integer.parseInt(request.getParameter("y"));
			m = Integer.parseInt(request.getParameter("m"));
		}
	%>
	<br>
	<table align="center">
		<caption>
			<a href="../games/adl?y=<%=y - 1%>&m=<%=m%>"> &lt&lt </a>
			<%
				if (m == 1) {
			%>
			<a href="../games/adl?y=<%=y - 1%>&m=12"> <b>&lt</b> </a>
			<%
				} else {
			%>
			<a href="../games/adl?y=<%=y%>&m=<%=m - 1%>"> <b>&lt</b> </a>
			<%
				}
			%>
			<select name="y" onchange="location.href=this.value">
			<%for (int i=2012;i<=2022;i++){ %>
				<option value="../games/adl?y=<%=i%>&m=<%=m%>" 
				<%if (i==y) {%>
				selected<%} %>
				><%=i%> 년</option>
			<%} %>
			</select>
			
			<select name="m" onchange="location.href=this.value">
			<%for (int j=1;j<13;j++){ %>
				<option value="../games/adl?y=<%=y%>&m=<%=j%>"
				<%if (j==m) {%>
				selected<%} %>><%=j %> 월</option>
			<%} %>
			</select>

			<%
				if (m == 12) {
			%>
			<a href="../games/adl?y=<%=y + 1%>&m=1"> <b>&gt</b> </a>
			<%
				} else {
			%>
			<a href="../games/adl?y=<%=y%>&m=<%=m + 1%>"> <b>&gt</b> </a>
			<%
				}
			%>
			<a href="../games/adl?y=<%=y + 1%>&m=<%=m%>"> &gt&gt </a>
			<hr>
			<a href="../games/adc?y=<%=y%>&m=<%=m%>"">달력으로 관리</a>
			<br><br>
			<%int d = today.getDayOfMonth();%>
			<input type="button" onclick="location.href='pl?y=<%=y%>&m=<%if (m<10){%>0<%}%><%=m%>&d=<%if (d<10){%>0<%}%><%=d%>'" value="경기 추가">
			<br><br>
		</caption>
		<tr>
			<th width="50">날짜</th>
			<th width="50">시간</th>
			<th width="50">홈팀</th>
			<th width="60">스코어</th>
			<th width="50">원정팀</th>
			<th width="50">구장</th>
			<th width="90">홈팀 승패</th>
			<th width="90">비고</th>
		</tr>
		<c:forEach items="${list}" var="cdto">
			<tr>
				<td>${cdto.day}</td>
				<td>${cdto.gtime}</td>
				<td>${cdto.hxt}</td>
				<td>${cdto.hxscore}  :  ${cdto.exscore}</td>
				<td>${cdto.ext}</td>
				<td>${cdto.parea}</td>
				<td>${cdto.hxresult }</td>
				<td>${cdto.reason}</td>
				<td onclick="location.href='../games/upd?gnum=${cdto.gnum }'" style="cursor:pointer;border-radius:5px;font-size:13px">　<b>수정</b>　</td>
			</tr>
		</c:forEach>
	</table>
</c:if>
</body>
</html>