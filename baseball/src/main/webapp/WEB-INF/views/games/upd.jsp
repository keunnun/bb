<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function del_chk()
{
	if(confirm("삭제하면 복구할 수 없습니다 \n정말이 경기를 삭제하겠습니까?")==true)
	{
		location.href="del?gnum="+${gdto.gnum}+"&y="+${gdto.year}+"&m="+${gdto.month};
	}	
	else
	{
		return false;
	}
}
</script>
<style>
	table {
		text-align: center;
	}
	th{
		background:#c3c3c3
	}
	
</style>
</head>

<body>
	<form method="post" action="upd_ok">
	<input type="hidden" value="${gdto.gnum }" name="gnum">
		<table align="center">
			<tr>
				<th>날짜</th>
				<th>시간</th>
				<th>홈팀</th>
				<th>원정팀</th>
			</tr>
			<tr>
				<td><input type="text" name="days" value="${gdto.days}" onfocus="this.select()"></td>
				<td><input type="text" name="gtime" value="${gdto.gtime}" onfocus="this.select()"></td>
				<td><input type="text" name="hxt" value="${gdto.hxt}" onfocus="this.select()"></td>
				<td><input type="text" name="ext" value="${gdto.ext}" onfocus="this.select()"></td>
			</tr>
		</table>
		<br><br>
		<table align="center">
			<tr>
				<th>홈팀점수</th>
				<th>원정팀점수</th>
				<th>취소사유</th>
				<th>관중숫자</th>
			</tr>
			<tr>
			<tr>
				<td><input type="text" name="hxscore" value="${gdto.hxscore}" onfocus="this.select()"></td>
				<td><input type="text" name="exscore" value="${gdto.exscore}" onfocus="this.select()"></td>
				<td><input type="text" name="reason" value="${gdto.reason}" onfocus="this.select()"></td>
				<td><input type="text" name="fannum" value="${gdto.fannum}" onfocus="this.select()"></td>
			</tr>
			<tr>
			<td colspan="4">
				<input	type="button" value="취소" onclick="location.href='adl?y=${gdto.year}&m=${gdto.month }'">
				<input type="submit" value="수정">
				<button type="button" onclick="del_chk()">삭제</button></td>
			</tr>


		</table>
	</form>



</body>
</html>