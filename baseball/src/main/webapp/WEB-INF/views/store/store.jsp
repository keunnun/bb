<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		#pro1 {
			width:1200px;
			text-align:center;
			margin:auto;
		}
		
		#pro2 {
			width:1200px;
			text-align:center;
			margin:auto;
		}
		
		button {
			width:365px;
		}
	</style>
		
	<script>
		function log()
		{
			alert("로그인 후 구매가능합니다");
		}
		
		function point()
		{
			alert("포인트가 부족합니다");
		}
		
		function buy_chk(proname,price,imgname)
		{
			var bc=new XMLHttpRequest();
			bc.open("get","chk?proname="+proname);
			bc.send();
			
			bc.onreadystatechange=function()
			{
				if(bc.readyState==4) {
					if(bc.responseText==0) {
						location.href="purchase?proname="+proname+"&price="+price+"&imgname="+imgname;
					}
					else {
						alert("이미 구매한 쿠폰입니다");
					}
				}
			}
		}
	</script>
</head>
<body>
	<div id="pro1">
		<p>
		<img src="../resources/coupon/ticket.png" width="400"><br>
		<c:if test="${userid==null}">
			<button onclick="log()">구매</button>
		</c:if>
		<c:if test="${userid!=null and point<20}">
			<button onclick="point()">구매</button>
		</c:if>
		<c:if test="${userid!=null and point>=20}">
			<button onclick="buy_chk('예매권할인',20,'ticket')">구매</button>
		</c:if>
		<p>
	</div>
	<div id="pro2">
		<img src="../resources/coupon/cheer.png" width="400"><br>
		<c:if test="${userid==null}">
			<button onclick="log()">구매</button>
		</c:if>
		<c:if test="${userid!=null and point<20}">
			<button onclick="point()">구매</button>
		</c:if>
		<c:if test="${userid!=null and point>=20}">
			<button onclick="buy_chk('응원봉교환',20,'cheer')">구매</button>
		</c:if>
		<p>
	</div>
</body>
</html>