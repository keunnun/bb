<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		body {
			margin:0;
		}
		a {
			text-decoration: none;
			color: black;
		}
		#back {
			background-image:url("../resources/main/main.png");
			background-size:cover;
    		background-position:center;
    		width:100%;
    		height:700px;
    		margin:0 auto;
		}
		#first {
			width:1200px;
			height:45px;
			text-align:right;
			margin:auto;
		}
		#first ul {
			padding-right:11px;
			margin-top:0px;
		}
		
		#first li {
			list-style-type:none;
    		display:inline-block;
    		font-size:13px;
    		width:80px;
    		padding-top:6px;
    		text-align:center;
    		margin-top:10px;
		}
		
		#second {
			width: 1200px;
			height: 100px;
			text-align:center;
			margin: auto;
		}
		#second #second1 {
			width: 1200px;
			text-align:center;
			padding-top:6px;
			margin: auto;
		}
		#second ul {
			text-align:center;
			margin:0;
   			padding:0;
		}
		#second li {
			list-style-type:none;
    		display:inline-block;
    		font-size: 1.083em;
    		vertical-align: middle;
			width:110px;
		}
		#endline {
			background-image:url("../resources/main/bottom.png");
			background-size:cover;
    		background-position:center;
			width:100%;
    		height:150px;
    		text-align:center;
    		margin:auto;
		}
		
		#endicon {
			padding-top:5px;
		}
		#endfont {
			font-size:13px;
			color:white;
		}
		
		#search {
			position : relative;
			
		}
		#search2 {
			width:110px;
			top:100%;
			left:4%;
			border-radius:10px / 10px;
			position : absolute;
			visibility:hidden;
			background:white;
		}
		
		#search_botton {
			padding-bottom:3px;
			border:none;
			background:transparent;
			outline: none;
		}
		#search_img {
			padding-top:3px;
			width:20px;
		}
		
	</style>
	<script>
		var chk=0;
		function view()
		{
			chk++;
			if(chk%2!=0)
				document.getElementById("search2").style.visibility="visible";
			else
				document.getElementById("search2").style.visibility="hidden";
		}
	</script>
</head>
<body>
	<div id="back">
		<div id="first">	 
			<!-- ???????????? ????????? ?????? -->
			<c:if test="${userid==null}">
			<ul>
				<li>
					<a href="../member/member" style=color:white;>????????????</a>
				</li>
				<li>
					<a href="../member/login" style=color:white;>?????????</a>
				</li>
			</ul>
		  	</c:if>
     	  	<!-- ???????????? ?????? ?????? -->	  
    	  	<!-- ???????????? ???????????? ?????? ?????? -->
    	  	<c:if test="${userid=='admin'}">
   		   	<ul>
   		   		<span style=color:white;> ${name} ???!! ??????!! </span>  
   		   	<li>
				<a href="../admin/admin" style=color:white;>??????????????????</a>
		   	</li>
		   	<li>
				<a href="../member/logout" style=color:white;>????????????</a>
		   	</li>
   		   	</ul>
		   	</c:if>
     	  	<!-- ?????????????????? ???????????? ?????? ?????? -->
		  	<c:if test="${userid!=null and userid!='admin'}">
   		   	<ul>
   		   		<span style=color:white;> ${name} ???!! ??????!! </span>
   		   		<li>
			 		<a href="../member/mypage" style=color:white;>???????????????</a>
		   		</li>
		   		<li>
			 		<a href="../member/logout" style=color:white;>????????????</a>
		   		</li>
   		   	</ul>
		  	</c:if> 
		</div>
		<div id="second">
			<nav id="second1">
				<ul>
					<li>
						<a href="../games/games" style=color:white;>GAMES</a>
					</li>
					<li>
						<a href="../ranking/ranking" style=color:white;>RANKING</a>
					</li>
					<li>
						<a href="../players/players" style=color:white;>PLAYERS</a>
					</li>
					<li>
						<a href="../team/team" style=color:white;>TEAM</a>
					</li>
					<li>
						<a href="../main/index">
							<img src="../resources/main/logo.png" width="120" height="120">
						</a>
					</li>
					<li>
						<a href="../fans/fans" style=color:white;>FANS</a>
					</li>
					<li>
						<a href="../guess/guess" style=color:white;>GUESS</a>
					</li>
					<li>
						<a href="../store/store" style=color:white;>STORE</a>
					</li>
					<li>
						<div id="search">
							<a href="javascript:void(0);" onclick="view()" style=color:white;>??????</a>
							<div id="search2">
								<form method="post" action="search_ok">
									<input id="search_botton" type="text" name="word" placeholder="????????????" size="6">
           							<input id="search_img" type="image" src="../resources/main/search.png">
								</form>
							</div>
						</div>
					</li>
				</ul>
			</nav>
		</div>
	</div>
	<div id="endline">
		<br>
		<span id="endicon"> 
			<img src="../resources/main/icon1.png" width="25">
			<img src="../resources/main/icon2.png" width="25">
			<img src="../resources/main/icon3.png" width="25">
			<img src="../resources/main/icon4.png" width="25"> 
		</span>
		<p>
		<span id="endfont">
			????????? : (???)????????????????????? <br>
			CS Center : 070-000-0000 AM 09:00 - PM 06:00  <br>
			???????????? ????????????????????????
		</span>
	</div>	
</body>
</html>