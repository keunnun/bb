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
	<form method="post" action="write_ok" align="center">
		<input type="hidden" name="tid" value="${tid }">
		<input type="hidden" name="userid" value="${userid }">
		제목<input type="text" name="title"><p>
		내용<input type="text" name="content"><p>
		<input type="submit" value="작성">
		<input type="button" value="취소" onclick="location.href='list?tid=${tid}'">
	</form>
</body>
</html>