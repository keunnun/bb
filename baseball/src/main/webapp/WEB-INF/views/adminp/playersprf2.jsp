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
     <td rowspan="3" align="center">  
     	<img src="../resources/players/${maindto.pid}.jpg" width="100">
     <td><b>연봉:</b>${maindto.ymoney}</td>
     <td><b>등번호:</b>${maindto.bnum}</td>
    </tr>
    <tr>   
     <td><b>포지션:</b>${maindto.position}</td>
     <td><b>경력:</b>${maindto.career}</td>
    </tr>
   </table>
   <br>
	<table align="center">
		<tr>
			<td>
			<input type="button" value="정보수정" onclick=location.href="../adminp/update2?pid=${maindto.pid}">
			<input type="button" value="삭제" onclick=location.href="../adminp/delete2?pid=${maindto.pid}"> 
			<input type="button" value="목록으로" onclick=location.href="../adminp/players_list2">
			</td>
		</tr>
	</table>
	</c:forEach>
	<br>
</c:if>
</body>
</html> 
