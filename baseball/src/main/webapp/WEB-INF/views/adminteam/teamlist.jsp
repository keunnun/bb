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
			margin:auto;
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
		<caption><h3>구단리스트</h3></caption>
			<tr>
				<td colspan="2">
					정보변경시 해당 구단 클릭(로고:로고변경,구단명:구단정보변경)
				</td>
			</tr>
			<tr>
				<td>로고</td>
				<td>구단명</td>
			</tr>
			
			<c:forEach items="${adto }" var="adtos">
			<tr>
				<td>
					<img src="../resources/team/${adtos.imgname }.png">
				</td>
				<td>
					<a href="teamupdate?tid=${adtos.tid }">
						${adtos.tname }
					</a>
				</td>
			</tr>
			</c:forEach>
			
			<tr>
				<td colspan="2">
					<a href="teamwrite">추가</a>
				</td>
			</tr>
		</table>
	</div>
</c:if>
</body>
</html>