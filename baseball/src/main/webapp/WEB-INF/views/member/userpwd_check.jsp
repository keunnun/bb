<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function check_pwd()
{   // pwd라는 비밀번호, pwd2라는 비밀번호 입력칸을 비교하여 같은지 틀린지를 알려준다.
	var pwd=document.userpwd.pwd.value;
    var pwd2=document.userpwd.pwd2.value;

    if(pwd==pwd2)
    {
   	 document.getElementById("pchk").innerHTML="<br><b style='color:blue;font-size:12px'>비밀번호가 같습니다.</b>"; 
    }	 
    else
    {
   	 document.getElementById("pchk").innerHTML="<br><b style='color:red;font-size:12px'>비밀번호가 다릅니다.</b>"; 
    }

}

</script>
</head>
<body>
<div id="content" style="margin:50px 0px 40px 0px;">
   <form name="userpwd" method="post" action="userpwd_check_ok">
     <table width="400" align="center">
     <tr>
      <td width="150"> 아이디 </td>
      <td> <input type="text" name="userid"> </td>
     </tr>
     <tr>
      <td width="150"> 이름 </td>
      <td> <input type="text" name="name"> </td>
     </tr>
     <tr>
      <td> 이메일 </td>
      <td> <input type="text" name="email"> </td>
     </tr>
     <tr>
      <td> 새로운 비밀번호 </td>
      <td> <input type="password" name="pwd"> </td>
     </tr>
     <tr>
      <td> 새로운 비밀번호 확인 </td>
      <td> <input type="password" name="pwd2" onkeyup="check_pwd()"> 
      <span id="pchk"></span></td>
     </tr>
     <tr>
      <td colspan="2" align="center">
      <input type="submit" value="비밀번호변경"></td>
     </tr>
     </table>
   </form>
 </div>  
</body>
</html>