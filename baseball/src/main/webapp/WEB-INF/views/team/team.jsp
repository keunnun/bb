<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		#content {
			width:1200px;
			padding-top:6px;
			padding-bottom:25px;
			margin:auto;
		}
		
		table{
			width:1000px;
			border-collapse:collapse;
			border-collapse:separate;
		}
		tr {
			text-align:center;
			height:60px;
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
		<table align="center" cellspacing="0">
		<caption><h3>구단소개</h3></caption>
			<tr>
				<th>팀페이지</th>
				<th>팀명</th>
				<th>창단연도</th>
				<th>연고지</th>
				<th>우승횟수(연도)</th>
			</tr>
			<c:forEach items="${tdto }" var="tdtos">
			<tr>
				<td>
					<a href="list?tid=${tdtos.tid }">
						<img src="../resources/team/${tdtos.imgname }.png">
					</a>
				</td>
				<td>${tdtos.tname }</td>
				<td>${tdtos.cyear }</td>
				<td>${tdtos.area }</td>
				<td align="left">${tdtos.win }<br>${tdtos.winsub }</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>