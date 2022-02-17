<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#table {
	padding-top: 25px;
	padding-bottom: 25px;
	border-collapse: collapse
}
</style>
</head>
<body>
<c:if test="${userid=='admin'}">
<br>
	<table width="700" align="center" border="1" id="table">
		<c:forEach items="${list}" var="maindto">
			<tr>
				<td rowspan="4" align="center"><img
					src="../resources/players/${maindto.pid}.jpg" width="100"> <!-- 경로설정 servlet-context에 
     	<resources mapping="/resources/**" location="/resources/" /> 부분 
     	시작지역은 로케이션쪽 resources 인부분이고 적용하는방법은 매핑부분 resources/**로 적는다 
     	지금우린 resources/players(폴더)/파일명 으로 pid.jpg를 받아서 띄워야함
     	그리고 views 에 바로 아래있으면 /resources로 가면되는데 현재 viwes에서 하위폴더 players로내려가기때문에
     	앞에 ../를 붙여서 경로설정을 해줘야 사진이나옴
     	 -->
			<tr>
				<td><b>선수명:</b>${maindto.pname}</td>
				<td><b>생년원일:</b>${maindto.birth}</td>
			</tr>
			<tr>
				<td><b>신장/체중:</b>${maindto.spec}</td>
				<td><b>입단년도:</b>${maindto.pyear}</td>
			</tr>
			<tr>
				<td><b>지명순위:</b>${maindto.lank}</td>
				<td><b>입단 계약금:</b>${maindto.pmoney}</td>
			</tr>
	</table>
	<br>
	<table align="center">
		<tr>
			<td>
			<input type="button" value="정보수정" onclick=location.href="../adminp/update?pid=${maindto.pid}">
			<input type="button" value="삭제" onclick=location.href="../adminp/delete?pid=${maindto.pid}"> 
			<input type="button" value="목록으로" onclick=location.href="../adminp/players_list">
			</td>
		</tr>
	</table>
	</c:forEach>
<br>
</c:if>
</body>
</html>
