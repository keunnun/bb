<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${userid=='admin'}">
	<form name="mem" method="post" action="write_ok2" align="center">
	 선수번호<input id="pid" type="text" name="pid"> <p>
	연봉 <input type="text" name="ymoney"> <p>
       등번호 <input type="text" name="bnum"> <p>
	포지션 <input type="text" name="position"> <p>
	경력 <input type="text" name="career"> <p>
	<input type="submit" value="등록">
	</form>
</c:if>
</body>
</html>