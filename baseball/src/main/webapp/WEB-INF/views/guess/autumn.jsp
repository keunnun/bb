<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style>
   .nav ul {
     text-align:center;
   }
   .nav li {
     list-style-type:none;
     display:inline-block;
     font-size:25px;
     width:300px;
     text-align:center;
     color:black;
   }
   .cel ul {
     text-align:center;
   }
   .cel li {
     list-style-type:none;
     display:inline-block;
     text-align:center;
     width:120px;
     font-size:18px;
   }
   .content {
     width:1200px;
     height:750px;
     text-align:center;
     margin:auto;
   } 
 </style>
</head>
<body>
  <div class="nav">
    <ul>
      <li><a href="../guess/guess"> 가을야구 </a></li>
      <li><a href="../guess/fa"> 2022FA </a></li>
    </ul>
  </div>

  <div class="cel">
    <ul>
      <li>
        <a href="../guess/guess"> 역대 순위 </a>
      </li>
	  <li>
	    <a href="../guess/autumn?name=gr2">장타</a>
	  </li>
	  <li>
		<a href="../guess/autumn?name=gr3">출루</a>
	  </li>
	  <li>
		<a href="../guess/autumn?name=gr5">홈런</a>
	  </li>
	  <li>
		<a href="../guess/autumn?name=gr7">안타</a>
	  </li>
	  <li>
		<a href="../guess/autumn?name=gr8">OPS</a>
	  </li>
	  <li>
		<a href="../guess/autumn?name=gr9">실책</a>
	  </li>
	  </ul>
  </div>
  <div class="content">
    <img src="../resources/guess/${name}.png ">
  </div>
</body>
</html>