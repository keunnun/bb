<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	
%>    
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
   .cel ul {
     text-align:center;
   }
   .cel li {
     list-style-type:none;
     display:inline-block;
     text-align:center;
     width:120px;
     font-size:18px;
     margin:auto;
   }
   .content {
     width:70%;
     height:400px;
     margin:auto;
   } 
 </style>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	<script>
	window.onload=function()
	{
	    var localLineChart = document.getElementById('Chart-Local').getContext('2d');
	    var localChart = new Chart(localLineChart, {
	        type: 'line',  //
	        data: {
	            labels:['2016','2017','2018','2019','2020','2021'],
	            datasets:[
	                {
	                   
	                	data:[${data}],
	                    label:'두산 역대순위',
	                    fill:false,
	                    backgroundColor:"rgba(25,25,112,0.1)",
	                    borderWidth:1,
	                    borderColor:"blue"
	                },
	                 {
	                    data:[${data3}],
	                    label:'키움 역대순위',
	                    fill:false,
	                    backgroundColor:"rgba(0,0,0,0.2)",
	                    borderWidth:1,
	                    borderColor:"black"
	                }, 
	                {
	                    data:[${data4}],
	                    label:'SSG 역대순위',
	                    fill:false,
	                    backgroundColor:"rgba(255,0,0,0.3)",
	                    borderWidth:1,
	                    borderColor:"red"
	                },
	                {
	                    data:[${data5}],
	                    label:'NC 역대순위',
	                    fill:false,
	                    backgroundColor:"rgba(75,192,192,0.3)",
	                    borderWidth:1,
	                    borderColor:"green"
	                }
	
	            ]
	        },
	        options:{
	            responsive:false,
	            scales:{
	            	xAxes: [{
	            		  gridLines: {
	            		    display:false,
	            		  },
	            		}],
	            	yAxes:[{
	                    ticks:{
	                        beginAtZero:true,
	                        reverse:true,
	                    },
	                    
	                }]
	            }
	        }
	     });
    	};
	  </script>
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
  <canvas id="Chart-Local" style="height:40vh; width:70vw; margin: 40px 0"></canvas>
  </div>

  

</body>
</html>


