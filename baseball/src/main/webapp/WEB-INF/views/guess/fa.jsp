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
     color:black;
   }
   .content {
     background-image:url("../resources/guess/g1.png");
     background-size:cover;
     width:799px;
     height:570px;
     padding-top:20px;
     margin:auto;
   } 

 </style>
 <script>
/*    function link()
   {
	   window.open('../resources/guess/손아섭.png','',
			   'width=500,height=500,scrollbars=yes,resizable=no');
	   return false;
   } */

 </script>
</head>
<body>
  <div class="nav">
    <ul>
      <li><a href="../guess/guess"> 가을야구 </a></li>
      <li><a href="../guess/fa"> 2022FA </a></li>
    </ul>
  </div>
  
  <div class="content">
    <!-- <img src="../resources/guess/g1.png" border="0" usemap="#map">
    <map name="map">
    <area shape="circle" coords="362,275,15" href="#" onclick="link()" onfocus='this.blur()'>
    </map> -->

    <img class="mainlink" src="../resources/guess/g3.png" usemap=#link>
    <map name=link>
    <area shape=circle coords="359,131,15" href="../resources/guess/손아섭.png" onclick="window.open(this.href, '_blank', 'left=700,top=290,width=500, height=500'); return false;">
    <area shape=circle coords="360,199,15" href="../resources/guess/박해민황재균.png" onclick="window.open(this.href, '_blank', 'left=470,top=290,width=1000, height=500'); return false;">
    <area shape=circle coords="433,196,15" href="../resources/guess/정훈.png" onclick="window.open(this.href, '_blank', 'left=700,top=290,width=500, height=500'); return false;">
    <area shape=circle coords="486,186,15" href="../resources/guess/강민호.png" onclick="window.open(this.href, '_blank', 'left=700,top=290,width=500, height=500'); return false;">
    <area shape=circle coords="418,231,15" href="../resources/guess/김현수.png" onclick="window.open(this.href, '_blank', 'left=700,top=290,width=500, height=500'); return false;">
    <area shape=circle coords="389,268,15" href="../resources/guess/최재훈.png" onclick="window.open(this.href, '_blank', 'left=700,top=290,width=500, height=500'); return false;">
    <area shape=circle coords="227,337,15" href="../resources/guess/서건창.png" onclick="window.open(this.href, '_blank', 'left=700,top=290,width=500, height=500'); return false;">
    <area shape=circle coords="246,426,15" href="../resources/guess/장성우.png" onclick="window.open(this.href, '_blank', 'left=700,top=290,width=500, height=500'); return false;">
    <area shape=circle coords="355,410,15" href="../resources/guess/박병호.png" onclick="window.open(this.href, '_blank', 'left=700,top=290,width=500, height=500'); return false;">
    <area shape=circle coords="499,246,15" href="../resources/guess/나성범.png" onclick="window.open(this.href, '_blank', 'left=700,top=290,width=500, height=500'); return false;">
    <area shape=circle coords="530,265,15" href="../resources/guess/김재환.png" onclick="window.open(this.href, '_blank', 'left=700,top=290,width=500, height=500'); return false;">
    
    </map>
  </div>

</body>
</html>