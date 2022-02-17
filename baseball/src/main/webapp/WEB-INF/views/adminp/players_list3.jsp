<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
  window.onload=function()
  {    
	  document.pkc.field.value="${field}";
  } 
</script>
</head>
<body>
<c:if test="${userid=='admin'}">
<table width="1200" align="center">
    <tr>
     <td>선수번호-시즌</td>
     <td>선수명</td>
     <td>연도</td>
     <td>팀</td>
     <td>타율</td>
     <td>경기수</td>
     <td>안타</td>
     <td>2루타</td>
     <td>3루타</td>
     <td>홈런</td>
     <td>볼넷</td>
     <td>출루율</td>
     <td>장타율</td>
     <td>삼진</td>
     <td>평균자책점</td>
     <td>이닝</td>
     <td>사구</td>
     <td>실점</td>
    </tr>
  <c:forEach items="${list}" var="maindto"> 
    <tr>
     <td>${maindto.gid}</td>
     <td><a href="playersprf3?pid=${maindto.pid}">${maindto.pname}</a></td>
     <td>${maindto.year}</td>
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
     <td>${maindto.so}</td>
     <td>${maindto.era}</td>
     <td>${maindto.ip}</td>
     <td>${maindto.hbp}</td>
     <td>${maindto.r}</td>
    </tr>
    </c:forEach>

    <tr>
	    <td colspan="18" align="center">
	  
	    <c:if test="${pstart != 1}">
	    <a href="players_list3?page=${pstart-1}&field=${field}&word=${word}"> << </a>
	    </c:if>
	    <c:if test="${pstart == 1}">
	    <<
	    </c:if>
	   
	    <c:if test="${page != 1}">
	    <a href="players_list3?page=${page-1}&field=${field}&word=${word}"> < </a>
	    </c:if>
	    <c:if test="${page == 1}">
	      <
		</c:if>
	  
	      <c:forEach begin="${pstart}" end="${pend}" var="i">
	   
	       <c:if test="${page != i}">
	        <a href="players_list3?page=${i}&field=${field}&word=${word}">${i}</a>
	       </c:if>
	       <c:if test="${page == i}">
	        <a href="players_list3?page=${i}&field=${field}&word=${word}" style="color:red">${i}</a>
	       </c:if> 
	      </c:forEach>
	   
	     <c:if test="${page != page_cnt}">
	      <a href="players_list3?page=${page+1}&field=${field}&word=${word}"> > </a>
	     </c:if>
	     <c:if test="${page == page_cnt }">
	   	    >
	   	 </c:if>
	   
	   	 <c:if test="${pend != page_cnt}">
	   	  <a href="players_list3?page=${pend+1}&field=${field}&word=${word}"> >> </a>
	   	 </c:if>
	   	 <c:if test="${pend == page_cnt}">
	   	  >>
	   	 </c:if>
	    </td>
	  </tr>
	<tr>
	  <td colspan="18" align="center">
	    <form method="post" action="players_list3" name="pkc">
	     <select name="field">
	      <option value="pname">선수이름</option>
	      <option value="tname">팀이름</option>
	     </select>
	     <input type="text" name="word" value="${word}">
	     <input type="submit" value="검색">
	     <input type="button" value="등록" onclick=location.href="write3">
	     <input type="button" value="관리자페이지로" onclick=location.href="../admin/admin">
	    </form>
	  </td>
	</tr>
  </table>
</c:if>
</body>
</html>