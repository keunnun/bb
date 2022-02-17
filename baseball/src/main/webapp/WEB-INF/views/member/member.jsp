<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

 <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <!-- 외부에 만들어진 자바스크림트 내용을 현재 문서에 적용시키기 위한거 -->
 <script>
    function juso_search()
    {
	     new daum.Postcode({
	         oncomplete: function(data) {
	             if (data.userSelectedType === 'R') 
	             { // 사용자가 도로명 주소를 선택했을 경우
	                 addr = data.roadAddress;
	             } 
	             else 
	             { // 사용자가 지번 주소를 선택했을 경우(J)
	                 addr = data.jibunAddress;
	             }
                // 폼에 값을 전달
                document.mem.juso1.value=data.zonecode; // 우편번호
                document.mem.juso2.value=addr; // 주소	            
	         }
	   }).open();
    }

    function check()
    {// 아이디의 중복체크와 비밀번호의 체크
	 // 아이디 체크를 위해 ajax를 통해 서버에 접근
  
		var chk=new XMLHttpRequest();
    	var userid=document.mem.userid.value;
    	chk.open("get","check?userid="+userid); //전송하는 문서의 정보및 전달할 값
   		chk.send(); // submit         
  		chk.onreadystatechange=function()
    	{
    		if(chk.readyState==4) // 완료된 상태
    		{
    			//alert(chk.responseText); 1이면 아이디가 존재, 0이면 아이디 없다
    			if(chk.responseText==1)
    			{
    				//사용불가능 
    				document.getElementById("idchk").innerHTML="<br><b style='color:red;font-size:12px'>사용불가능아이디 </b>";
    				//document.getElementById("userid").value="";
    				document.mem.pr.value=0;
    			}
    			else if(userid.length<4)
    			{
    				//사용불가능
    	    		document.getElementById("idchk").innerHTML="<br><b style='color:orange;font-size:12px'>아이디는 4자 이상 </b>";
    	    		document.getElementById("userid").value=null;
    	    		dodument.mem.pr.value=0;
    			}
    			else
    	  		{
    				//사용가능
    				document.getElementById("idchk").innerHTML="<br><b style='color:blue;font-size:12px'>사용가능아이디 </b>";
    				document.mem.pr.value=1;
    	    	}
   			} // 
   		}  //  chk상태

    } //function 종료
 

    function check1() 
    {	 
        var f=document.mem; 
        if (f.userid.value.length<4)
        {
            alert("아이디를 4자 이상 입력해주십시오");
            f.userid.focus();
            return false;
        }
        if(f.pr.value==0)
        {
        	alert("아이디 중복확인하세요");
        	return false;
        }
        if (f.name.value=="")
        {
            alert("이름을 입력해주세요");
            f.name.focus();
            return false;
        }
        if (f.pwd.value=="") 
        {
            alert("비밀번호를 입력해주세요");
            f.pwd.focus();            
            return false;
        }
        if (f.email.value=="") 
        {
            alert("이메일을 입력해주세요");
            f.email.focus();            
            return false;
        }
        if (f.er.value==0)
        {
            alert("이메일 중복확인하세요");
            return false;
        }
        if (f.phone.value=="") 
        {
            alert("전화번호를 입력해주세요");
            f.phone.focus();            
            return false;
        }
        else
        {
        	alert("회원가입이 정상적으로 처리되었습니다.")
        }
     }
    
    
    function check2()
    {// email의 중복체크
	 // email 체크를 위해 ajax를 통해 서버에 접근
	 var chk1=new XMLHttpRequest();
     var email=document.mem.email.value;
     chk1.open("get","check2?email="+email); //전송하는 문서의 정보및 전달할 값
     chk1.send(); // submit         
     chk1.onreadystatechange=function()
     {
    	 if(chk1.readyState==4) // 완료된 상태
    	 {
    		 //alert(chk.responseText); 1이면 아이디가 존재, 0이면 아이디 없다
    		 if(chk1.responseText==1)
    		 {
    			 //사용불가능; 
    			 document.getElementById("emailchk").innerHTML="<br><b style='color:red;font-size:12px'>사용불가능email </b>";
    			 document.getElementById("email").value="";
    			 //document.mem.er.value=0;
    		 }
    		 else if(email.length<11)
    		 {
    			 document.getElementById("emailchk").innerHTML="<br><b style='color:orange;font-size:12px'>email을 입력해주세요</b>";
    			 document.getElementById("email").value="";
    			 document.mem.er.value=0;
    		 }
    		 else
    	     {
    			 //사용가능;
    			 document.getElementById("emailchk").innerHTML="<br><b style='color:blue;font-size:12px'>사용가능email </b>";
    			 document.mem.er.value=1;
    	     }
    	 }
     } 
     
    }
    
	 function check_pwd()
	 {  // pwd라는 비밀번호, pwd2라는 비밀번호 입력칸을 비교하여 같은지 틀린지를 알려준다.
		 var pwd=document.mem.pwd.value;
	     var pwd2=document.mem.pwd2.value;
	     if(pwd==pwd2)
	     {
	    	 document.getElementById("pchk").innerHTML="<br><b style='color:blue;font-size:12px'>비밀번호가 같습니다.</b>"; 
	     }	 
	     else
	     {
	    	 document.getElementById("pchk").innerHTML="<br><b style='color:red;font-size:12px'>비밀번호가 틀립니다.</b>"; 
	    	 document.getElementById("pwd").value=null;
	    	 document.getElementById("pwdchk").value=null;
	     }
	 }
	 
	 


 

</script>
</head>
<body>
 <div id="content" style="margin:20px 0px 40px 0px;">
  <form name="mem" method="post" action="member_ok" onsubmit="return check1()">
  
  <input type="hidden" name="pr" value="0"> 
  <input type="hidden" name="er" value="0"> 
   <table width="500" align="center">
    <caption> <h3> 회원 가입 </h3></caption>
    <input type="hidden" name="userid_check" value="1">
    <tr>
     <td> * 아이디 </td>
     <td> <input id="userid" type="text" name="userid" onblur="check()">
   		  <input type="button" value="아이디 조회" onclick="check()">
   		  <span id="idchk"></span> 
   	 </td>
    </tr> 
    <tr>
     <td> * 이 름 </td>
     <td> <input type="text" name="name"> </td>
    </tr>
    <tr>
     <td> * 비밀번호 </td>
     <td> <input id="pwd" type="password" name="pwd"> </td>
    </tr>
    <tr>
     <td> &nbsp;&nbsp;비밀번호확인 </td>
     <td> <input id="pwdchk" type="password" name="pwd2" onblur="check_pwd()"> 
       <span id="pchk"></span>
     </td>
    </tr>
    <tr>
     <td> * email </td>
     <td> <input id="email" type="email" name="email" onblur="check2()">
          <input type="button" value="email 조회" onclick="check2()">
   		  <span id="emailchk"></span> 
     </td>
    </tr>
    <tr>
     <td> * 전화번호 </td>
     <td> <input type="text" name="phone"> </td>
    </tr>
    <tr>
     <td> &nbsp;&nbsp;주 소  </td>
     <td> <input type="text" name="juso1" size="10">
       	  <input type="button" onclick="juso_search()" value="주소찾기" >
     </td>
    </tr>
    <tr>
     <td colspan="2">
      <input type="text" name="juso2" size="41">
     </td> 
    </tr>
    <tr>
     <td colspan="2">
      <input type="text" name="juso3" size="41" placeholder="나머지주소 입력" >
      <input type="submit" value="가입하기" >
     </td> 
    </tr>
    <tr>
  </table>
 </form>
</div> 
</body>
</html>