<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		#content {
			width:1200px;
			padding-top:6px;
			padding-bottom:15px;
			text-align:center;
			margin:auto;
		}
		.button {
			width:130px;
		}
		th {
			background: #c3c3c3
		}
		tr {
			text-align:center;
		}
		tr:nth-child(even) {
			background-color: #e2e2e2;
		}
		tr:nth-child(odd) {
			background-color: #d4d4d4;
		}
	</style>
</head>
<body>
<c:if test="${userid=='admin'}">
<div id="content">
 <table width="300" align="center">
  <caption> <h3> 관리자 페이지 </h3></caption>
  	<tr>
  		<th>관리버튼</th>
  	</tr>
	<tr>
	  <td> <a href="../admin/member_list"> <input type="button" value="회원 관리" class="button"> </a></td>
	</tr>       
	<tr>
	  <td> <a href="../games/adl"> <input type="button" value="일정/결과 관리" class="button"> </a> </td>
	</tr> 
	<tr>
	  <td> <a href="../adminp/players_list"> <input type="button" value="선수 정보 관리" class="button"> </a> </td>
	</tr>
	<tr>
	  <td> <a href="../adminp/players_list2"> <input type="button" value="구단 선수 관리" class="button"> </a> </td>
	</tr>
	<tr>
	  <td> <a href="../adminp/players_list3"> <input type="button" value="시즌별 선수 관리" class="button"> </a> </td>
	</tr> 	
		<tr>
	  <td> <a href="../adminteam/teamlist"> <input type="button" value="구단 관리" class="button"> </a> </td>
	</tr>
	<tr>
	  <td> <a href="../adminrank/adminrank"> <input type="button" value="구단 순위 관리" class="button"> </a> </td>
	</tr>
	<tr>
	  <td> <a href="../adminteam/fightinglist"> <input type="button" value="게시판 관리" class="button"> </a> </td>
	</tr> 	 	 	 	 		 		
  </table>
</div>
</c:if>
</body>
</html>