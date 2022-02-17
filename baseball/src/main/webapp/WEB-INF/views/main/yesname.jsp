<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		#infos {
			width:1200px;
			padding-top:6px;
			padding-bottom:25px;
			text-align:center;
			margin:auto;
		}
		table{
			width:500px;
			border-collapse:collapse;
			border-collapse:separate;
		}
		tr {
			text-align:center;
		}
		th {
			border-top:1px solid #222222;
			border-bottom:1px solid #222222;
			background: #efeff1;
		}
		td {
			border-bottom:1px solid #c0c0c0;
			
		}
	</style>
</head>
<body>
	<div id="infos">
		<table align="center" cellspacing="0">
			<tr>
				<th> 선수명 </th>
				<th> 생년월일 </th>
				<th> 스펙 </th>
			</tr>
			
			<c:forEach items="${list }" var="mdto">
			<tr>
				<td>
					<a href="../players/playersprf?pid=${mdto.pid }">${mdto.pname }</a>
				</td>
				<td>${mdto.birth }</td>
				<td>${mdto.spec }</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>