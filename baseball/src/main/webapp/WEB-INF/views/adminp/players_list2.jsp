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
  {    // 검색하고 필드값 잡기 생년원일 검색했을때 초기값으로 돌아가지않게
	  document.pkc.field.value="${field}";
  } 
</script>
</head>
<body>
<c:if test="${userid=='admin'}">
<table width="800" align="center">
    <tr>
     <td>선수번호</td>
     <td>연봉</td>
     <td>등번호</td>
     <td>포지션</td>
     <td>경력</td>
    </tr>
    
   <c:forEach items="${list}" var="maindto"> 
    <tr>
     <td><a href="playersprf2?pid=${maindto.pid}">${maindto.pid}</a></td>
     <td>${maindto.ymoney}</td>
     <td>${maindto.bnum}</td>
     <td>${maindto.position}</td>
     <td>${maindto.career}</td>
    </tr>
    </c:forEach>
  <!-- 페이징처리 -->
    <tr>
	    <td colspan="5" align="center">
	  
	    <c:if test="${pstart != 1}">
	    <a href="players_list2?page=${pstart-1}&field=${field}&word=${word}"> << </a>
	    </c:if>
	    <c:if test="${pstart == 1}">
	    <<
	    </c:if>
	   
	    <c:if test="${page != 1}">
	    <a href="players_list2?page=${page-1}&field=${field}&word=${word}"> < </a>
	    </c:if>
	    <c:if test="${page == 1}">
	      <
		</c:if>
	  
	      <c:forEach begin="${pstart}" end="${pend}" var="i">
	   
	       <c:if test="${page != i}">
	        <a href="players_list2?page=${i}&field=${field}&word=${word}">${i}</a>
	       </c:if>
	       <c:if test="${page == i}">
	        <a href="players_list2?page=${i}&field=${field}&word=${word}" style="color:red">${i}</a>
	       </c:if> <!-- 겟방식으로 page,field,word값3개를 보내주어서 처리한다. -->
	      </c:forEach>
	   
	     <c:if test="${page != page_cnt}">
	      <a href="players_list2?page=${page+1}&field=${field}&word=${word}"> > </a>
	     </c:if>
	     <c:if test="${page == page_cnt }">
	   	    >
	   	 </c:if>
	   
	   	 <c:if test="${pend != page_cnt}">
	   	  <a href="players_list2?page=${pend+1}&field=${field}&word=${word}"> >> </a>
	   	 </c:if>
	   	 <c:if test="${pend == page_cnt}">
	   	  >>
	   	 </c:if>
	    </td>
	  </tr>
	<!-- 검색부분 밑에 -->
	<tr>
	  <td colspan="5" align="center">
	    <form method="post" action="players_list2" name="pkc">
	    <select name="field">
	      <option value="pid">선수번호</option>
	      <option value="ymoney">연봉</option>
	    </select>
	     <input type="text" name="word" value="${word}">
	     <input type="submit" value="검색">
	     <input type="button" value="선수등록" onclick=location.href="write2">
	     <input type="button" value="관리자페이지로" onclick=location.href="../admin/admin">
	    </form>
	  </td>
	</tr>
  </table>
</c:if>
</body>
</html>
<!-- 쿼리를 페이징,검색 한방에 처리하기위해 xml에서 쿼리문을한방에합쳤고
jsp에선 get방식으로 보내주는 값이 field word index로 총3가지로 구성 -->