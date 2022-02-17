<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		#sel {
			width: 1200px;
			height: 50px;
			text-align:center;
			margin: auto;
		}
		#sel #sel2 {
			width: 1200px;
			text-align:center;
			padding-top:6px;
			margin: auto;
		}
		#sel2 ul {
			text-align:center;
			margin:0;
   			padding:0;
		}
		#sel2 li {
			list-style-type:none;
    		display:inline-block;
    		font-size: 0.813em;
    		vertical-align: middle;
			width:200px;
		}
		
		#content {
			width: 1200px;
			height: 500px;
			text-align:center;
			margin: auto;
		}
	</style>
</head>
<body>
	<div id="sel">
		<nav id="sel2">
			<ul>
				<li>
					<a href="../fans/fans?fnum=day">일별 관중현황</a>
		 		</li>
				<li>
					<a href="../fans/fans?fnum=dayofweek">요일별 관중현황</a>
				</li>
				<li>
					<a href="../fans/fans?fnum=month">월별 관중현황</a>
				</li>
				<li>
					<a href="../fans/fans?fnum=place">구장별 관중현황</a>
				</li>
			</ul>
		</nav>
	</div>
	<div id="content">
		<img src="../resources/fans/${fnum}.png ">
	</div>
</body>
</html>