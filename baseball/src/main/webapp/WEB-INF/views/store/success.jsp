<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		#content {
			width:1200px;
			padding-top:6px;
			padding-bottom:15px;
			text-align:center;
			margin:auto;
		}
	</style>
</head>
<body>
	<div id="content">
		<span> <h3>구매성공</h3> </span> 
		<span> <h4>마이페이지로 이동하시겠습니까??</h4> </span> 
		<button onclick="location.href='../member/mypage'"> YES </button> 
		<button onclick="location.href='../main/index'"> NO </button>
	</div>
</body>
</html>