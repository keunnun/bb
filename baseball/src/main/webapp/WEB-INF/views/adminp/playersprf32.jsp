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
     <td rowspan="7" align="center">  
     	<img src="../resources/players/${maindto.pid}.jpg" width="100">
     </td>
     <td><b>선수번호-시즌:</b>${maindto.gid}</td>
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
    <br>
    <table align="center">
     <tr>
      <td>
    <input type="button" value="정보수정" onclick='location.href="../adminp/update3?gid=${maindto.gid}"'>
    <input type="button" value="삭제" onclick='location.href="../adminp/delete3?gid=${maindto.gid}"'>
    <!-- 여긴 1개의상세정보값만오기때문에 포이치문에넣어도 전페이지의 선수정보수만큼 출력안됨 -->
    </c:forEach> 
    <!-- 위에 2개는 상세정보이기때문에 gid가필요하고 밑에는 그선수의모든정보가필요해 pid를줌 -->
    <input type="button" value="이전으로" onclick='location.href="playersprf3?pid=${list[0].pid}"'>
    <!-- 선수시즌이여러개있는선수는 playersprf3 으로이동해 전체를보여준다. -->
      </td>
     </tr>
   </table>
   <br>
</c:if>
</body>
</html> 
