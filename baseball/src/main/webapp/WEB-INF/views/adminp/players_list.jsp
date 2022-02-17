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
<table width="800" align="center">
    <tr>
     <td>선수명</td>
     <td>생년원일</td>
     <td>신장/체중</td>
     <td>입단년도</td>
     <td>지명순위</td>
     <td>입단 계약금</td>
    </tr>
    
   <c:forEach items="${list}" var="maindto"> 
    <tr>
     <td><a href="playersprf?pid=${maindto.pid}">${maindto.pname}</a></td>
     <td>${maindto.birth}</td>
     <td>${maindto.spec}</td>
     <td>${maindto.pyear}</td>
     <td>${maindto.lank}</td>
     <td>${maindto.pmoney}</td>
    </tr>
    </c:forEach>
 
    <tr>
	    <td colspan="6" align="center">
	  
	    <c:if test="${pstart != 1}">
	    <a href="players_list?page=${pstart-1}&field=${field}&word=${word}"> << </a>
	    </c:if>
	    <c:if test="${pstart == 1}">
	    <<
	    </c:if>
	   
	    <c:if test="${page != 1}">
	    <a href="players_list?page=${page-1}&field=${field}&word=${word}"> < </a>
	    </c:if>
	    <c:if test="${page == 1}">
	      <
		</c:if>
	  
	      <c:forEach begin="${pstart}" end="${pend}" var="i">
	   
	       <c:if test="${page != i}">
	        <a href="players_list?page=${i}&field=${field}&word=${word}">${i}</a>
	       </c:if>
	       <c:if test="${page == i}">
	        <a href="players_list?page=${i}&field=${field}&word=${word}" style="color:red">${i}</a>
	       </c:if> 
	      </c:forEach>
	   
	     <c:if test="${page != page_cnt}">
	      <a href="players_list?page=${page+1}&field=${field}&word=${word}"> > </a>
	     </c:if>
	     <c:if test="${page == page_cnt }">
	   	    >
	   	 </c:if>
	   
	   	 <c:if test="${pend != page_cnt}">
	   	  <a href="players_list?page=${pend+1}&field=${field}&word=${word}"> >> </a>
	   	 </c:if>
	   	 <c:if test="${pend == page_cnt}">
	   	  >>
	   	 </c:if>
	    </td>
	  </tr>

	<tr>
	  <td colspan="6" align="center">
	    <form method="post" action="players_list" name="pkc">
	     <select name="field">
	      <option value="pname">선수이름</option>
	      <option value="birth">생년원일</option>
	     </select>
	     <input type="text" name="word" value="${word}">
	     <input type="submit" value="검색">
	     <input type="button" value="선수등록" onclick=location.href="write">
	     <input type="button" value="관리자페이지로" onclick=location.href="../admin/admin">
	    </form>
	  </td>
	</tr>
  </table>
</c:if>
</body>
</html>