<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <form name="mem" method="post" action="member_ok" onsubmit="return form_check()">
   <table width="500" align="center">
    <caption> <h3> 회원 가입 </h3></caption>
    <input type="hidden" name="userid_check" value="1">
    <tr>
     <td> 아이디 </td>
     <td> <input type="text" name="userid">
   		  <input type="button" value="아이디 조회" onclick="check()">
   		  <span id="idchk"></span> 
   	 </td>
    </tr> 
    <tr>
     <td> 이 름 </td>
     <td> <input type="text" name="name"> </td>
    </tr>
    <tr>
     <td> 비밀번호 </td>
     <td> <input type="password" name="pwd"> </td>
    </tr>
    <tr>
     <td> 비밀번호확인 </td>
     <td> <input type="password" name="pwd2" onkeyup="check_pwd()"> 
       <span id="pchk"></span>
     </td>
    </tr>
    <tr>
     <td> email </td>
     <td> <input type="email" name="email"> </td>
    </tr>
    <tr>
     <td> 전화번호 </td>
     <td> <input type="text" name="phone"> </td>
    </tr>
    <tr>
     <td> 주소 </td>
     <td> <input type="text" name="juso"> </td> 
    </tr>
    <!-- 
    <tr>
     <td>주 소 <input type="text" name="juso1" size="4"> </td>
     <td> <input type="button" onclick="juso_search()" value="우편번호찾기" disabled="readonly">
    </tr>
    <tr>
     <td colspan="2">
      <input type="text" name="juso2" size="41" disabled="readonly">
     </td> 
    </tr>
    <tr>
     <td colspan="2">
      <input type="text" name="juso3" size="41" placeholder="나머지주소 입력" disabled="readonly">
     </td> 
    </tr>
     -->
    <tr>
     <td> 추천인 아이디  </td>
     <td> <input type="text" name="chuid">
          <input type="submit" value="가입하기"></td>
    </tr> 
    
  </table>
 </form>
</body>
</html>