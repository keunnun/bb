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
  <form method="post" action="update_ok2" align="center">
         <input type="hidden" name="pid" value="${mdto.pid}"> <p>
	연봉 <input type="text" name="ymoney" value="${mdto.ymoney}"> <p>
	드번호 <input type="text" name="bnum" value="${mdto.bnum}"> <p>
         포지션<input type="text" name="position" value="${mdto.position}"> <p>
	경력 <input type="text" name="career" value="${mdto.career}"> <p>
	<input type="submit" value="수정"> 
	<input type="button" value="취소" onclick=location.href="playersprf2?pid=${mdto.pid}">
  </form>
</c:if>
</body>
</html>