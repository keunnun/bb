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
	
	th {
		background: #c3c3c3
	}
</style>
</head>
<body>
<br>
	<form method="post" action="pls_ok">
		<table align="center">
		<caption>
		<% String date=request.getParameter("date");
			String y,m,d;
			y=date.substring(0,4);
			m=date.substring(5,7);
			d=date.substring(8,10);
			String gtime=request.getParameter("gtime");
			String hxt=request.getParameter("hxt");
			String ext=request.getParameter("ext");%>
			<input	type="button" value="경기 리스트" onclick="location.href='adl?y=<%=y%>&m=<%=m%>'">
		<input	type="button" value="경기 달력" onclick="location.href='adc?y=<%=y%>&m=<%=m%>'">
		<br><br>
		</caption>
			<tr>
				<th>날짜</th>
				<th>시간</th>
				<th>홈팀</th>
				<th>원정팀</th>
			</tr>
			
			<tr>
			
				<td><input type="date" name="date" value="<%=date%>"></td>

				<td><input type="time" name="gtime" value="<%=gtime%>"></td>
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
			
		</table>
		<br>
		<table align="center">
			<tr>
				<th>홈팀점수</th>
				<th>원정팀점수</th>
				<th>취소사유</th>
				<th>관중숫자</th>
			</tr>
			<tr>
			<tr>
				<td><input type="text" name="hxscore"></td>
				<td><input type="text" name="exscore"></td>
				<td><input type="text" name="reason" value="-"></td>
				<td><input type="text" name="fannum" value="0"></td>
			</tr>
		</table>
		<br>
		<table align="center">
		<tr><td>
		　<input type="submit" value="등록">
		　<input type="button" onclick="location.href='pl?y=<%=y%>&m=<%=m%>&d=<%=d%>'" value="간단넣기">
		</td></tr>
		</table>
	</form>



</body>
</html>