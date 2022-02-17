<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>

function check()
{// 아이디의 중복체크와 비밀번호의 체크
 // 아이디 체크를 위해 ajax를 통해 서버에 접근

var chk=new XMLHttpRequest();
var pid=document.mem.pid.value;
chk.open("get","check?pid="+pid); //전송하는 문서의 정보및 전달할 값
	chk.send(); // submit         
	chk.onreadystatechange=function()
{
	if(chk.readyState==4) // 완료된 상태
	{
		//alert(chk.responseText); 1이면 아이디가 존재, 0이면 아이디 없다
	if(chk.responseText==1)
	{
			//사용불가능 
		document.getElementById("idchk").innerHTML="<br><b style='color:red;font-size:12px'>사용불가능선수번호 </b>";
			//document.getElementById("userid").value="";
		document.mem.pr.value=0;
	}
		else
	 {
				//사용가능
		document.getElementById("idchk").innerHTML="<br><b style='color:blue;font-size:12px'>사용가능선수번호 </b>";
		document.mem.pr.value=1;
 }
} // 
}  //  chk상태
} //function 종료

function check1()
{
	 var f=document.mem; 
	 if(f.pr.value==0)
     {
     	alert("선수번호 중복확인하세요");
     	return false;
     }
}
</script>
</head>
<body>
<c:if test="${userid=='admin'}">
	<form name="mem" method="post" action="write_ok" align="center" onsubmit="return check1()">
	 <input type="hidden" name="pr" value="0"> 
	 선수번호<input id="pid" type="text" name="pid" onblur="check()"> <p>
   		  <input type="button" value="선수번호조회" onclick="check()">
   		  <span id="idchk"></span> 
	선수이름 <input type="text" name="pname"> <p>
	생년원일 <input type="text" name="birth"> <p>
       신장/체중 <input type="text" name="spec"> <p>
	입단년도 <input type="text" name="pyear"> <p>
	지명순위 <input type="text" name="lank"> <p>
     입단 계약금 <input type="text" name="pmoney"> <p>
	<input type="submit" value="등록">
	</form>
</c:if>
</body>
</html>