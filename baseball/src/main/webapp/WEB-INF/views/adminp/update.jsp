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
  <form method="post" action="update_ok" align="center">
         <input type="hidden" name="pid" value="${mdto.pid}"> <p>
	선수이름 <input type="text" name="pname" value="${mdto.pname}"> <p>
	생년원일 <input type="text" name="birth" value="${mdto.birth}"> <p>
       신장/체중 <input type="text" name="spec" value="${mdto.spec}"> <p>
	입단년도 <input type="text" name="pyear" value="${mdto.pyear}"> <p>
	지명순위 <input type="text" name="lank" value="${mdto.lank}"> <p>
     입단 계약금 <input type="text" name="pmoney" value="${mdto.pmoney}"> <p>
	<input type="submit" value="수정"> 
	<input type="button" value="취소" onclick=location.href="playersprf?pid=${mdto.pid}">
  </form>
</c:if>
</body>
</html>