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
			padding-top:6px;
			padding-bottom:15px;
		}
		table{
			width:1000px;
		}
		tr {
			text-align:center;
		}
	</style>
</head>
<body>
<c:if test="${userid=='admin'}">
	<div id="content">
		<table align="center" border="1">
		<caption><h3>팀순위</h3></caption>
			<tr>
				<td>년도</td>
				<td>순위</td>
				<td>팀명</td>
				<td>경기</td>
				<td>승</td>
				<td>패</td>
				<td>무</td>
				<td>승률</td>
				<td>게임차</td>
				<td>최근10경기</td>
				<td>연속</td>
				<td>홈</td>
				<td>방문</td>
				<td>수정</td>
			</tr>
			<c:forEach items="${list }" var="rdto">
			<tr>
				<td> ${rdto.year } </td>
				<td> ${rdto.rank } </td>
				<td> ${rdto.tname } </td>
				<td> ${rdto.games } </td>
				<td> ${rdto.wins } </td>
				<td> ${rdto.loses } </td>
				<td> ${rdto.draws } </td>
				<td> ${rdto.winrate } </td>
				<td> ${rdto.gcs } </td>
				<td> ${rdto.gten } </td>
				<td> ${rdto.conw } </td>
				<td> ${rdto.hxthap } </td>
				<td> ${rdto.exthap } </td>
				<td> <a href="rankupdate?lid=${rdto.lid }">수정</a> </td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="14"> 
					<a href="rankwrite">추가</a>
				</td>
			</tr>
			<tr>
				<td colspan="14">
					<!-- 현재페이지 기준으로 이전 10페이지 이동 -->
					<c:if test="${pstart!=1 }">
						<a href="adminrank?page=${pstart-10 }"> (<) </a>
					</c:if>
					<c:if test="${pstart==1 }">
						(<)
					</c:if>
					<!-- 현재페이지 기준으로 이전 1페이지 이동 -->
					<c:if test="${page!=1 }">
						<a href="adminrank?page=${page-1 }"> < </a>
					</c:if>
					<c:if test="${page==1 }">
						<
					</c:if>
					
					<!-- 현재페이지 기준으로 이동할 수 있는 페이지 -->
					<c:forEach var="i" begin="${pstart }" end="${pend }" >
	
					
						<!-- 현재페이지 색은 다르게 => 빨강 -->
						<c:if test="${page!=i }">
							<a href="adminrank?page=${i }"> ${i }</a>
						</c:if>
						<c:if test="${page==i }">
							<a href="adminrank?page=${i }" style="color:red"> ${i }</a>
						</c:if>
					</c:forEach>
					<!-- 현재페이지 기준으로 다음 1페이지 이동 -->
					<c:if test="${page!=page_cnt }">
						<a href="adminrank?page=${page+1 }"> > </a>
					</c:if>
					<c:if test="${page==page_cnt }">
						>
					</c:if>
					<!-- 현재페이지 기준으로 이전 10페이지 이동 -->
					<c:if test="${page_cnt!=pend }">
						<a href="adminrank?page=${pend+1 }"> (>) </a>
					</c:if>
					<c:if test="${page_cnt==pend }">
						(>)
					</c:if>
				</td>
			</tr>
		</table>
	</div>
</c:if>
</body>
</html>