<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>경기 표</title>
	<style>
		#content {
			width:1200px;
			padding-top:6px;
			padding-bottom:25px;
			margin:auto;
		}
		table{
			border-collapse:collapse;
			border-collapse:separate;
		}
		tr {
			text-align:center;
		}
		th {
			border-top:1px solid #222222;
			border-bottom:1px solid #222222;
			border-left:1px solid #c0c0c0;
			background: #efeff1;
		}
		td {
			border-bottom:1px solid #c0c0c0;
			border-left:1px solid #c0c0c0;
		}
		th:first-child,td:first-child {
			border-left:none;
		}
	</style>
</head>
<body>
<div id="content">
	<%@page import="java.time.LocalDate"%>
	<%
		int y, m;
		if (request.getParameter("y") == null) {
			LocalDate today = LocalDate.now();
			y = today.getYear();
			m = today.getMonthValue();
		} else {
			y = Integer.parseInt(request.getParameter("y"));
			m = Integer.parseInt(request.getParameter("m"));
		}
	%>
	<br>
	<table align="center" cellspacing="0">
		<caption>
			<a href="../games/list?y=<%=y - 1%>&m=<%=m%>"> &lt&lt </a>
			<%
				if (m == 1) {
			%>
			<a href="../games/list?y=<%=y - 1%>&m=12"> <b>&lt</b>
			</a>
			<%
				} else {
			%>
			<a href="../games/list?y=<%=y%>&m=<%=m - 1%>"> <b>&lt</b>
			</a>
			<%
				}
			%>
			<select name="y" onchange="location.href=this.value">
				<%for (int i=2012;i<=2022;i++){ %>
				<option value="../games/list?y=<%=i%>&m=<%=m%>" <%if (i==y) {%>
					selected <%} %>><%=i%> 년
				</option>
				<%} %>
			</select> <select name="m" onchange="location.href=this.value">
				<%for (int j=1;j<13;j++){ %>
				<option value="../games/list?y=<%=y%>&m=<%=j%>" <%if (j==m) {%>
					selected <%} %>><%=j %> 월
				</option>
				<%} %>
			</select>

			<%
				if (m == 12) {
			%>
			<a href="../games/list?y=<%=y + 1%>&m=1"> <b>&gt</b>
			</a>
			<%
				} else {
			%>
			<a href="../games/list?y=<%=y%>&m=<%=m + 1%>"> <b>&gt</b>
			</a>
			<%
				}
			%>
			<a href="../games/list?y=<%=y + 1%>&m=<%=m%>"> &gt&gt </a>
			<hr>
			<a href="../games/games?y=<%=y%>&m=<%=m%>"">Go to calendar</a> <br>
			<br>
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
				<td>${cdto.hxscore} : ${cdto.exscore}</td>
				<td>${cdto.ext}</td>
				<td>${cdto.parea}</td>
				<td>${cdto.hxresult }</td>
				<td>${cdto.reason}</td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>