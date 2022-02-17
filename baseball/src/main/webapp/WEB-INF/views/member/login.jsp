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
 <div id="content" style="margin:30px 0px 40px 0px;">
  <form name="pkc" method="post" action="login_ok">
   <table width="400" align="center">
    <caption> <h3> 로그인 </h3></caption>
     <tr>
      <td width="200" style="padding-left:25px"> 아이디 </td>
      <td> <input type="text" name="userid" size="25"> </td>
     </tr>
     <tr>
      <td style="padding-left:25px"> 비밀번호 </td>
      <td> <input type="password" name="pwd" size="25"> </td>
     </tr>
     <tr>
      <td colspan="2" align="center">
       <c:if test="${chk==1}">  
 		 <b style="color:red"> 아이디 혹은 비번이 잘못되었습니다 </b>
  	   </c:if>
      <td>
     </tr>  
     <tr>
      <td colspan="2" align="center">
        <input type="submit" value="로그인">
      </td>
     </tr> 
     <tr>
      <td colspan="2"> <hr>
      </td>
     </tr>  
   </table>
   <div align="center">
     <a href="userid_search"> <input type="button" value="아이디 찾기"> </a>
     <a href="userpwd_check"> <input type="button" value="비밀번호 변경"> </a>
     <a href="member"> <input type="button" value="회원가입"> </a>
   </div>
  </form>
 </div>    
</body>
</html>