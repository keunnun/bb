<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <table width="700" align="center" border="1">
    <c:forEach items="${list}" var="maindto"> 
      <tr>
     <td rowspan="3">  
     	<img src="../resources/players/${maindto.pid}.jpg" width="100">
     </td>
    </tr>
    <tr>  
     <td><b>연봉:</b>${maindto.ymoney}</td>
     <td><b>등번호:</b>${maindto.bnum}</td>
    </tr>
    <tr>   
     <td><b>포지션:</b>${maindto.position}</td>
     <td><b>경력:</b>${maindto.career}</td>
    </tr>
   </table>
	<table align="center">
		<tr>
			<td>
			<input type="button" value="목록으로" onclick=location.href="../adminp/players_list2">
			</td>
		</tr>
	</table>
	</c:forEach>
</body>
</html> 
