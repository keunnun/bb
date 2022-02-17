<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#content {
		width:1200px;
		padding-top:6px;
		padding-bottom:25px;
		margin:auto;
	}
	
	th {
		background:#d8bfd8;
	}
	td {
		background-color:#f8f8ff;
		padding-left:12px;
	}
	
	#coupont {
		border-collapse:collapse;
		border-collapse:separate;
		border:1px solid #444444;
		width:250px;
	}
	
	#coupon #cname {
		border-bottom:1px solid #444444;
	}
</style>
<script>
function del_chk()
{
	if(confirm("탈퇴하면 복구할 수 없습니다 \n정말로 탈퇴하시겠습니까?")==true)  //확인
	{
		location.href="mypage_delete?mid="+${mdto.mid};
	}	
	else //취소
	{
		location.href="mypage";
		return false;
	}
}
</script>
</head>
<body>
 <div id="content">
  <table width="500" align="center">
  <caption> <h3> 마이페이지 </h3></caption>
	<tr>
	  <th> 아이디 </th>
	  <td> ${mdto.userid} </td>
	</tr>       
	<tr>
	  <th> 이름 </th>
	  <td> ${mdto.name} </td>
	</tr> 
	<tr>
	  <th> 전화번호 </th>
	  <td> ${mdto.phone} </td>
	</tr> 
	<tr>
	  <th> 이메일 </th>
	  <td> ${mdto.email} </td>
	</tr>
	<tr>
	  <th> 주소 </th>
	  <td> ${"("}${mdto.juso1}${") "}${mdto.juso2}${", "}${mdto.juso3} </td>
	</tr>
	<tr>
	  <th> 가입날짜 </th>
	  <td> ${mdto.mday} </td>
	</tr> 
	<tr>
	  <th> 포인트 </th>
	  <td> ${mdto.point} </td>
	</tr> 	
	<tr>
	  <th> 나의 쿠폰 </th>
	  <td>
	  	<table id="coupont" cellspacing="0">
	  		<tr>
	  			<td>쿠폰명</td>
	  			<td>쿠폰번호</td>
	  		</tr>
	  		<c:forEach items="${list }" var="pdto">
	  		<tr>
	  			<td>${pdto.proname }</td>
	  			<td>${pdto.coupon }</td>
	  		</tr>
	  		</c:forEach>
	  	</table> 
	  </td>
	</tr>
	<tr>
	  <td colspan="2" align="center" bgcolor="white">
	   <a href="mypage_update?mid=${mdto.mid}"> <input type="button" value="수정"> </a>
	   <a> <input type="button" value="탈퇴" onclick="del_chk()"> </a> 
	  </td>
	</tr>	 		 		
  </table>
 </div>
</body>
</html>