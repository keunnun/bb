<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function del_chk()
{
	if(confirm("삭제하면 복구할 수 없습니다 \n정말로 이 회원을 탈퇴시키겠습니까????")==true)  //확인
	{
		location.href="member_delete?mid="+${mdto.mid};

	}	
	else //취소
	{
		return false;
	}
}

</script>
</head>
<body>
<c:if test="${userid=='admin'}">
 <div id="content" style="margin:30px 0px 40px 0px;">
  <table width="700" align="center">
  <caption><h3>회원 상세정보</h3></caption>
    <tr>
      <td> 회원번호 </td>
      <td> ${mdto.mid} </td>
    </tr>
    <tr>
      <td> 이름 </td>
      <td> ${mdto.name} </td>
    </tr>
    <tr>
      <td> 전화번호 </td>
      <td> ${mdto.phone} </td>
    </tr>
    <tr>
      <td> 이메일 </td>
      <td> ${mdto.email} </td>
    </tr>
    <tr>
      <td> 주소 </td>
      <td> (${mdto.juso1}) ${mdto.juso2},&nbsp;${mdto.juso3} </td>
    </tr>
    <tr>
      <td> 포인트 </td>
      <td> ${mdto.point} </td>
    </tr>
    <tr>
      <td> 가입일 </td>
      <td> ${mdto.mday} </td>
    </tr>
    <tr>
      <td colspan="2" align="center"> 
       <a href="member_list"> <input type="button" value="목록"> </a>
       <a href="member_update?mid=${mdto.mid}"> <input type="button" value="수정"> </a>
       <button type="button" onclick="del_chk()">삭제</button>
      </td>
    </tr>
  </table>
 </div>
</c:if>
</body>
</html>