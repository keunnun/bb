<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>경기 달력</title>
<style>
	table {
		text-align: center;
	}
	th{
		background:#c3c3c3
	}
	#blank{
		background:#999999
	}
	sc{
		font-size: 13px
	}
	hxt{
		font-size:15px;
	}
	ext{
		font-size:15px;
	}
	td:nth-child(even) {
		background-color: #e2e2e2;
	}
	
	td:nth-child(odd) {
		background-color: #d4d4d4;
	}
</style>
</head>
<body>
<%@page import="java.time.LocalDate"%>
	<%
		int y, m;
		if (request.getParameter("y") == null) {
			LocalDate today = LocalDate.now();
			y = today.getYear();
			m = today.getMonthValue();
		} else {
			y = Integer.parseInt(request.getParameter("y"));
			m = Integer.parseInt(request.getParameter("m"));
		}

		LocalDate xday = LocalDate.of(y, m, 1);

		int yoil = xday.getDayOfWeek().getValue();
		if (yoil == 7)
			yoil = 0;
		int chong = xday.lengthOfMonth();
		int ju = (int) Math.ceil((chong + yoil) / 7.0);
	%>
	<br>
	<table width="1050" align="center">
		<caption>
			<a href="../games/adc?y=<%=y - 1%>&m=<%=m%>"> &lt&lt </a>
			<%
				if (m == 1) {
			%>
			<a href="../games/adc?y=<%=y - 1%>&m=12"> <b>&lt</b> </a>
			<%
				} else {
			%>
			<a href="../games/adc?y=<%=y%>&m=<%=m - 1%>"> <b>&lt</b> </a>
			<%
				}
			%>
			<select name="y" onchange="location.href=this.value">
			<%for (int i=2012;i<=2022;i++){ %>
				<option value="../games/adc?y=<%=i%>&m=<%=m%>" 
				<%if (i==y) {%>
				selected<%} %>
				><%=i%> 년</option>
			<%} %>
			</select>
			
			<select name="m" onchange="location.href=this.value">
			<%for (int j=1;j<13;j++){ %>
				<option value="../games/adc?y=<%=y%>&m=<%=j%>"
				<%if (j==m) {%>
				selected<%} %>><%=j %> 월</option>
			<%} %>
			</select>

			<%
				if (m == 12) {
			%>
			<a href="../games/adc?y=<%=y + 1%>&m=1"> <b>&gt</b> </a>
			<%
				} else {
			%>
			<a href="../games/adc?y=<%=y%>&m=<%=m + 1%>"> <b>&gt</b> </a>
			<%
				}
			%>
			<a href="../games/adc?y=<%=y + 1%>&m=<%=m%>"> &gt&gt </a>
			<hr>
			<a href="../games/adl?y=<%=y%>&m=<%=m%>"">리스트로 관리</a>
			<br><br>
		</caption>

		<tr height="20" align="center">
			<th style="color: red">일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th style="color: blue">토</td>
		</tr>
		
		<%
			int day = 1;

			for (int i = 1; i <= ju; i++) {
		%>
		<tr>
			<%
				for (int j = 0; j < 7; j++) {
						if ((j < yoil && i == 1) || (chong < day)) {
			%>
			<td width="150" id="blank">&nbsp;</td>
			<%@page import="kr.co.baseball.dao.CDao"%>
			<%@page import="kr.co.baseball.dto.CDto"%>
			<%@page import="java.util.ArrayList" %>
			<%
				} else {
					CDao cdao=new CDao();
					ArrayList<CDto> dl=cdao.dl(y,m,day);
			%>
			<td width="150" style="vertical-align:top;text-align:center;" height="130">
			
			<b style="cursor:pointer" onclick="location.href='../games/pl?y=<%=y%>&m=<%if (m<10){%>0<%}%><%=m%>&d=<%if (day<10){%>0<%}%><%=day%>'"><%=day%></b> <br>
			
			<%
			for(int k=0;k<dl.size();k++) {
			%>
			<span onclick="location.href='../games/upd?gnum=<%=dl.get(k).getGnum()%>'" style="cursor:pointer">
			<hxt><%=dl.get(k).getHxt()%></hxt>  <sc><%=dl.get(k).getHxscore()%> : <%=dl.get(k).getExscore()%></sc>  <ext><%=dl.get(k).getExt()%></ext>
			<br></span>
			<%}%>
			</td><%	day++;
						}
				}
			%>

		</tr>
		<%
			}
		%>
	</table>
	
</body>
</html>
