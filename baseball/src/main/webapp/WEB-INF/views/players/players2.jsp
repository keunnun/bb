<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		#content {
			width:1200px;
			padding-top:6px;
			padding-bottom:25px;
			text-align:center;
			margin:auto;
		}
		#choiceb {
			border-collapse:collapse;
			border-collapse:separate;
			border:1px solid #444444;
			background:#efeff1;
		}
		#choiceb #lineb {
			border-left:1px solid #444444;
		}
		
		table{
			border-collapse:collapse;
			border-collapse:separate;
		}
		tr {
			text-align:center;
		}	
		th {
			border-top:1px solid #444444;
			border-bottom:1px solid #444444;
			background: #efeff1;
		}
		td {
			border-bottom:1px solid #cccccc;
			
		}	

	</style>

<!-- 서버에서 num값 받은값이없을때 셀렉트 초기값 1982년도 고정
	그외에 값 select에서 this.value 로 가져온 num이있을때
	그 num값을 num이란변수에 넣어주기 변수이름같게해야함
 -->
<%
	String num;
	if(request.getParameter("num")==null)
		num="2021";
	else
		num=request.getParameter("num");
	
	String ee;
	if(request.getParameter("ee")==null)
		ee="avg";
%>
<script>
	var chk=${chk};
	function move(num)
	{
		location="players2?num="+num
		// spring에선 .jsp?겟방식으로보낼대 이런식으로 .jsp적으면 동일페이지에서 접속할때404 에러
	}
// select 스프링에서 body onload 는안되서 년도값고정하는입력함수
window.onload=function() 
{
	document.getElementById("year").value="<%=num%>"
};
function orderg(g)
{  
	if(chk%2==0)
	{
		location="players2?gijun="+g+"&num=<%=num%>&gijun2=desc&chk="+chk;	           
	}
	else
	{
		location="players2?gijun="+g+"&num=<%=num%>&gijun2=asc&chk="+chk;
	}	
}
</script>
</head>
<body>
<div id="content">
 <table id="choiceb" align="center" cellspacing="0">
  <tr>
   <td><a href="players">타자순위</a></td>
   <td id="lineb"><a href="players2">투수순위</a></td>
  </tr>
 </table>
 
 <table align="center">
  <tr>
   <td>
  <select id="year" onchange="move(this.value)">
  <c:forEach var="i" begin="1982" end="2021">
     <option value=${i}> ${i} </option>
  </c:forEach>
 </select>
  </td>
  </tr>
 </table>
<p></p>
<table align="center" cellspacing="0">
    <tr>
     <th width="50px">순위</th>
     <th width="120px">선수명</th>
     <th width="120px">팀명</th>
     <th width="50px"><a href="javascript:void(0);" onclick="orderg(this.innerText)">ERA</a></th>
     <th width="50px"><a href="javascript:void(0);" onclick="orderg(this.innerText)">H</a></th>
     <th width="50px"><a  href="javascript:void(0);" onclick="orderg(this.innerText)">SO</a></th>
     <th width="100px">IP</th> 
     <th width="50px"><a href="javascript:void(0);" onclick="orderg(this.innerText)">HBP</a></th>
     <th width="50px"><a href="javascript:void(0);" onclick="orderg(this.innerText)">R</a></th>
    </tr>
    
   <c:forEach items="${list}" var="maindto" varStatus="status">
    <tr>
     <td align="center">
    <option>${status.count}</option>
     </td>  
     <td><a href="playersprf?pid=${maindto.pid}">${maindto.pname}</a></td>
     <td>${maindto.tname}</td>
     <td>${maindto.era}</td>
     <td>${maindto.h}</td>
     <td>${maindto.so}</td>
     <td>${maindto.ip}</td>
     <td>${maindto.hbp}</td>
     <td>${maindto.r}</td>
    </tr>
    </c:forEach>
  </table>
</div>
</body>
</html>