<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>

</script>
</head>
<body>
	<c:if test="${userid==tfdto.userid}">
	<form method="post" action="update_ok" align="center">
		<input type="hidden" name="tid" value="${tid }">
		<input type="hidden" name="fid" value="${fid }">
		제목<input type="text" name="title" value="${tfdto.title }"><p>
		내용<input type="text" name="content" value="${tfdto.content }"><p>
		<input type="submit" value="수정">
		<input type="button" value="취소" onclick="location.href='content?tid=${tid}&fid=${fid}'">
	</form>
	</c:if>
</body>
</html>