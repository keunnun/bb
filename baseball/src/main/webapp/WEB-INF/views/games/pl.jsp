<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<br>
	<form method="post">
		<table align="center">
		<caption>
		<%
			String d=request.getParameter("d");
			String m=request.getParameter("m");
			String y=request.getParameter("y");
			String date=y+"-"+m+"-"+d;%>
			<input	type="button" value="경기 리스트" onclick="location.href='adl?y=<%=y%>&m=<%=m%>'">
			<input	type="button" value="경기 달력" onclick="location.href='adc?y=<%=y%>&m=<%=m%>'">
			<br><br>
		</caption>
			<tr>
			
				<td colspan="3"><input type="date" name="date" value="<%=date%>"></td>
			</tr>
			<tr>
				<th>시간</th>
				<th>홈 팀</th>
				<th>원정 팀</th>
			</tr>
			<tr>
				<td><input type="time" name="gtime" value="10:00"></td>
				<td><select name=hxt>
						<option value="NC">NC</option>
						<option value="한화">한화</option>
						<option value="두산">두산</option>
						<option value="KT">KT</option>
						<option value="LG">LG</option>
						<option value="키움">키움</option>
						<option value="KIA">KIA</option>
						<option value="롯데">롯데</option>
						<option value="삼성">삼성</option>
						<option value="SSG">SSG</option>
				</select></td>

				<td><select name="ext">
						<option value="NC">NC</option>
						<option value="한화">한화</option>
						<option value="두산">두산</option>
						<option value="KT">KT</option>
						<option value="LG">LG</option>
						<option value="키움">키움</option>
						<option value="KIA">KIA</option>
						<option value="롯데">롯데</option>
						<option value="삼성">삼성</option>
						<option value="SSG">SSG</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="3"><br>
				<input type="submit" value="등록" onclick="javascript:form.action='pl_ok'">　
				<input	type="submit" value="상세넣기" onclick="javascript:form.action='pls'">
				</td>
			</tr>
		</table>
	</form>



</body>
</html>