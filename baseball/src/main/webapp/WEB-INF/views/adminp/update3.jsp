<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function check1() 
{	  
    var f=document.fu;
 	var avg=parseFloat(fu.avg.value);
    if(isNaN(avg))  
    {
        alert("타율에 숫자를 입력하세요");
        fu.avg.focus();
        return false; 
    }
    var g=parseFloat(fu.g.value);
    if(isNaN(g))  
    {
        alert("경기수에 숫자를 입력하세요");
        fu.g.focus();
        return false; 
    }
    var h=parseFloat(fu.h.value);
    if(isNaN(h))  
    {
        alert("안타수에 숫자를 입력하세요");
        fu.h.focus();
        return false; 
    }
    var b2=parseFloat(fu.b2.value);
    if(isNaN(b2))  
    {
        alert("2루타수에 숫자를 입력하세요");
        fu.b2.focus();
        return false; 
    }
    var b3=parseFloat(fu.b3.value);
    if(isNaN(b3))  
    {
        alert("3루타수에 숫자를 입력하세요");
        fu.b3.focus();
        return false; 
    }
    var hr=parseFloat(fu.hr.value);
    if(isNaN(hr))  
    {
        alert("홈런에 숫자를 입력하세요");
        fu.hr.focus();
        return false; 
    }
    var bb=parseFloat(fu.bb.value);
    if(isNaN(bb))  
    {
        alert("볼넷에 숫자를 입력하세요");
        fu.bb.focus();
        return false; 
    }
    var obp=parseFloat(fu.obp.value);
    if(isNaN(obp))  
    {
        alert("출루율에 숫자를 입력하세요");
        fu.obp.focus();
        return false; 
    }
    var slg=parseFloat(fu.slg.value);
    if(isNaN(slg))  
    {
        alert("장타율에 숫자를 입력하세요");
        fu.slg.focus();
        return false; 
    }
    var so=parseFloat(fu.so.value);
    if(isNaN(so))  
    {
        alert("삼진수에 숫자를 입력하세요");
        fu.so.focus();
        return false; 
    }
    var era=parseFloat(fu.era.value);
    if(isNaN(era))  
    {
        alert("평균자책점에 숫자를 입력하세요");
        fu.era.focus();
        return false; 
    }
    var hbp=parseFloat(fu.hbp.value);
    if(isNaN(hbp))  
    {
        alert("사구수에 숫자를 입력하세요");
        fu.hbp.focus();
        return false; 
    }
    var r=parseFloat(fu.r.value);
    if(isNaN(r))  
    {
        alert("실점에 숫자를 입력하세요");
        fu.r.focus();
        return false; 
    }
    else
    {
    	alert("등록이 정상적으로 처리되었습니다.")
    }
 }
</script>
</head>
<body>
<c:if test="${userid=='admin'}">
     <form method="post" name="fu" action="update_ok3" align="center" onsubmit="return check1()">
    <input type="hidden" name="gid" value="${mdto.gid}">
	선수이름 <input type="text" name="pname" value="${mdto.pname}"> <p>
	연도 <input type="text" name="year" value="${mdto.year}"> <p>
         팀이름 <input type="text" name="tname" value="${mdto.tname}"> <p>
	타율 <input type="text" name="avg" value="${mdto.avg}"> <p>
	경기수 <input type="text" name="g" value="${mdto.g}"> <p>
         안타 <input type="text" name="h" value="${mdto.h}"> <p>
    2루타 <input type="text" name="b2" value="${mdto.b2}"> <p>
    3루타 <input type="text" name="b3" value="${mdto.b3}"> <p>
         홈런 <input type="text" name="hr" value="${mdto.hr}"> <p>
         볼넷 <input type="text" name="bb" value="${mdto.bb}"> <p>
         출루율 <input type="text" name="obp" value="${mdto.obp}"> <p>
         장타율 <input type="text" name="slg" value="${mdto.slg}"> <p>
         삼진 <input type="text" name="so" value="${mdto.so}"> <p>
         평균자책점 <input type="text" name="era" value="${mdto.era}"> <p>
         이닝 <input type="text" name="ip" value="${mdto.ip}"> <p>
         사구 <input type="text" name="hbp" value="${mdto.hbp}"> <p>
         실점 <input type="text" name="r" value="${mdto.r}"> <p>
<input type="submit" value="수정"> 
<input type="button" value="취소" onclick="location.href='playersprf32?gid=${mdto.gid}'">
  </form>
</c:if>
</body>
</html>