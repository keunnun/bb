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
		location="players?num="+num
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
			location="players?gijun="+g+"&num=<%=num%>&gijun2=desc&chk="+chk;
			                    // 변수 빼고는 문자열안으로 한방에눈다  꺽새%=%꺽새 도포함 
		}
		else
		{
			location="players?gijun="+g+"&num=<%=num%>&gijun2=asc&chk="+chk;
		}	
	//문자라" " 넣어줘야함
  // http://localhost/baseball/players/players?ee=G&num=num//
  // innertext값을 ee라는변수에 받아주고 연도값은num으로 자바에떠있는값을 주소변경할때 준다
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
     <th width="50px">순위</td>
     <th width="120px">선수명</td>
     <th width="120px">팀명</td>
     <th width="50px"><a href="javascript:void(0);" onclick="orderg(this.innerText)">AVG</a></th>
     <th width="50px"><a href="javascript:void(0);" onclick="orderg(this.innerText)">G</a></th>
     <th width="50px"><a href="javascript:void(0);" onclick="orderg(this.innerText)">H</a></th>
     <th width="50px"><a href="javascript:void(0);" onclick="orderg(this.innerText)">B2</a></th>
     <th width="50px"><a href="javascript:void(0);" onclick="orderg(this.innerText)">B3</a></th>
     <th width="50px"><a href="javascript:void(0);" onclick="orderg(this.innerText)">HR</a></th>
     <th width="50px"><a href="javascript:void(0);" onclick="orderg(this.innerText)">BB</a></th>
     <th width="50px"><a href="javascript:void(0);" onclick="orderg(this.innerText)">OBP</a></th>
     <th width="50px"><a href="javascript:void(0);" onclick="orderg(this.innerText)">SLG</a></th>
     <!-- this.value가 아니고 this.innerText로 쓴다 -->
    </tr>
    
   <c:forEach items="${list}" var="maindto" varStatus="status"> 
    <tr>
     <td align="center">
    <option>${status.count}</option>
     </td>  
     <td><a href="playersprf?pid=${maindto.pid}">${maindto.pname}</a></td>
     <!-- "?pid="${maindto.pid} 하면 안나옴 ""안에넣고 값넣기  -->
     <td>${maindto.tname}</td>
     <td>${maindto.avg}</td>
     <td>${maindto.g}</td>
     <td>${maindto.h}</td>
     <td>${maindto.b2}</td>
     <td>${maindto.b3}</td>
     <td>${maindto.hr}</td>
     <td>${maindto.bb}</td>
     <td>${maindto.obp}</td>
     <td>${maindto.slg}</td>
    </tr>
    </c:forEach>
  </table>
</div>
</body>
</html>