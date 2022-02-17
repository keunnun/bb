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
    <c:forEach items="${list}" var="maindto">
     <table width="700" align="center" border="1" id="table"> 
      <tr>
     <td rowspan="7" align="center">  
     	<img src="../resources/players/${maindto.pid}.jpg" width="100">
     </td>
     <td><b>선수번호-시즌:</b><a href="playersprf32?gid=${maindto.gid}">${maindto.gid}</a></td>
     <td><b>선수명:</b>${maindto.pname}</td>
     <td><b>연도:</b>${maindto.year}</td>
    </tr>
    <tr>   
     <td><b>팀:</b>${maindto.tname}</td>
     <td><b>타율:</b>${maindto.avg}</td>
     <td><b>경기수:</b>${maindto.g}</td>
    </tr>
    <tr>
     <td><b>안타:</b>${maindto.h}</td>
     <td><b>2루타:</b>${maindto.b2}</td>
     <td><b>3루타:</b>${maindto.b3}</td>
    </tr>
    <tr>
     <td><b>홈런:</b>${maindto.hr}</td>
     <td><b>볼넷:</b>${maindto.bb}</td>
     <td><b>출루율:</b>${maindto.obp}</td>
    </tr>
    <tr>
     <td><b>장타율:</b>${maindto.slg}</td>
     <td><b>삼진:</b>${maindto.so}</td>
     <td><b>평균자책점:</b>${maindto.era}</td>
    </tr>
     <tr>
     <td><b>이닝:</b>${maindto.ip}</td>
     <td><b>사구:</b>${maindto.hbp}</td>
     <td><b>실점:</b>${maindto.r}</td>
    </tr>
    </table>
    </c:forEach>
    <br>
    <table align="center">
    <tr>
     <td>
    <input type="button" value="목록으로" onclick=location.href="../adminp/players_list3">
     </td>
    </tr>
   </table>
   <br>
</c:if>
</body>
</html> 
