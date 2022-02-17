<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${userid=='admin'}">
 <div id="content" style="margin:30px 0px 40px 0px;">
 <table width="1100" align="center">
   <caption> <h3> 회원 리스트 </h3></caption>
    <tr>
      <td colspan="8">
       <form method="post" align="center" action="member_list">
         <select name="field">
           <option value="userid"> 아이디 </option>
           <option value="name"> 이름 </option>
           <option value="email"> 이메일 </option>
           <option value="phone"> 전화번호 </option>
         </select>
           <input type="text" name="word" value="${word}">
           <input type="submit" value="검색">
           <a href="member_list"> <input type="button" value="목록"> </a>
       </form>
      </td> 
    </tr>
    <tr height="20"></tr>
    <tr>
      <td> 회원번호 </td>
      <td> 아이디 </td>
      <td> 이름 </td>
      <td> 전화번호 </td>
      <td> 이메일 </td>
      <td> 주소 </td>
      <td> 포인트 </td>
      <td> 가입일 </td>
    </tr>       
   <c:forEach items="${member_list}" var="mdto"> 
    <tr>
      <td> <a style="color:black" href="member_content?mid=${mdto.mid}">${mdto.mid}</a></td>
      <td> <a style="color:black" href="member_content?mid=${mdto.mid}">${mdto.userid}</a></td>
      <td> <a style="color:black" href="member_content?mid=${mdto.mid}">${mdto.name}</a></td>
      <td> ${mdto.phone}</td>
      <td> ${mdto.email}</td>
      <td> (${mdto.juso1}) ${mdto.juso2},&nbsp;${mdto.juso3}</td>
      <td> ${mdto.point}</td>
      <td> ${mdto.mday}</td>
    </tr>
    </c:forEach>
    <tr>
	  <td colspan="8" align="center">
	  
	  
		<!-- 현재페이지 기준으로 이전 10페이지 이동 -->
		<c:if test="${pstart != 1}">
		  <a href="member_list?page=${pstart-10}"> (<) </a>
		</c:if>
		<c:if test="${pstart == 1}">
			(<)
		</c:if>
		<!-- 현재페이지 기준으로 이전 1페이지 이동 -->
		<c:if test="${page != 1}">
		  <a href="member_list?page=${page-1}"> < </a>
		</c:if>
		<c:if test="${page == 1}">
		  <
		</c:if>
		
		<!-- 현재페이지 기준으로 이동할 수 있는 페이지 -->
		<c:forEach var="i" begin="${pstart}" end="${pend}" >
		<!-- 현재페이지 색은 다르게 => 빨강 -->
		<c:if test="${page != i}">
		  <a href="member_list?page=${i}"> ${i}</a>
		</c:if>
		<c:if test="${page == i}">
		  <a href="member_list?page=${i}" style="color:red"> ${i}</a>
		</c:if>
		</c:forEach>
		
		<!-- 현재페이지 기준으로 다음 1페이지 이동 -->
		<c:if test="${page != page_cnt}">
		  <a href="member_list?page=${page+1}"> > </a>
		</c:if>
		<c:if test="${page == page_cnt}">
		  >
		</c:if>
		<!-- 현재페이지 기준으로 이전 10페이지 이동 -->
		<c:if test="${page_cnt != pend}">
		  <a href="member_list?page=${pend+1}"> (>) </a>
		</c:if>
		<c:if test="${page_cnt == pend}">
		  (>)
		</c:if>
	  </td>
	</tr>
   
  </table>
  </div>
</c:if>
</body>
</html>