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
			text-align:center;
			margin:auto;
		}
		table{
			width:1000px;
			border-collapse:collapse;
			border-collapse:separate;
		}
		tr {
			text-align:center;
		}
		th {
			border-top:1px solid #222222;
			border-bottom:1px solid #222222;
			background: #efeff1;
		}
		td {
			border-bottom:1px solid #c0c0c0;
			
		}
	</style>
	
	<script>
		function year_chk(year)
		{
			location.href="ranking?year="+year;
			document.getElementById("year").value=${year};
		}
		
		window.onload=function()
		{
			document.getElementById("year").value=${year};
		}

	</script>
</head>
<body>
	<div id="content">
		<table align="center" cellspacing="0">
		<caption><h3>구단순위</h3></caption>
			<tr>
				<td colspan="12" bgcolor="white">
					<select id="year" onchange="year_chk(this.value)">
						<c:forEach var="i" begin="0" end="39">
						<option value="${2021-i}">${2021-i}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>순위</th>
				<th>팀명</th>
				<th>경기</th>
				<th>승</th>
				<th>패</th>
				<th>무</th>
				<th>승률</th>
				<th>게임차</th>
				<th>최근10경기</th>
				<th>연속</th>
				<th>홈</th>
				<th>방문</th>
			</tr>
			<c:forEach items="${rlist }" var="rdto">
			<c:if test="${rdto.rank!=0}">
			<tr>
				<td>${rdto.rank }</td>
				<td>${rdto.tname }</td>
				<td>${rdto.games }</td>
				<td>${rdto.wins }</td>
				<td>${rdto.loses }</td>
				<td>${rdto.draws }</td>
				<td>${rdto.winrate }</td>
				<td>${rdto.gcs }</td>
				<td>${rdto.gten }</td>
				<td>${rdto.conw }</td>
				<td>${rdto.hxthap }</td>
				<td>${rdto.exthap }</td>
			</tr>
			</c:if>
			</c:forEach>
		</table>
	</div>
</body>
</html>