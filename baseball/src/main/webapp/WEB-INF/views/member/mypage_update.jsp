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
                document.upd.juso1.value=data.zonecode; // 우편번호
                document.upd.juso2.value=addr; // 주소	            
	         }
	   }).open();
    }

	function check_pwd()
	{  // pwd라는 비밀번호, pwd2라는 비밀번호 입력칸을 비교하여 같은지 틀린지를 알려준다.
		var pwd=document.upd.pwd.value;
	    var pwd2=document.upd.pwd2.value;
	    if(pwd==pwd2)
	    {
	   	 document.getElementById("pchk").innerHTML="<br><b style='color:blue;font-size:12px'>비밀번호가 같습니다.</b>"; 
	    }	 
	    else
	    {
	   	 document.getElementById("pchk").innerHTML="<br><b style='color:red;font-size:12px'>위에 적은 비밀번호와 다릅니다.</b>"; 
	    }
	}
</script>
</head>
<body>
<form name="upd" method="post" action="mypage_update_ok">
   <table width="500" align="center">
    <caption> <h3> 회원 정보 수정 </h3></caption>
     <input type="hidden" name="mid" value="${mdto.mid}">
    <tr>
      <td> 아이디 </td>
      <td> ${mdto.userid}</td>
    </tr>
    <tr>
      <td> 이름 </td>
      <td> <input type="text" name="name" value="${mdto.name}" size="30"></td>
    </tr>
    <tr>
      <td> 비밀번호 </td>
      <td> <input type="password" name="pwd" size="30"></td>
    </tr>
    <tr>
      <td> 비밀번호확인 </td>
      <td> <input type="password" name="pwd2" onkeyup="check_pwd()" size="30"> 
       <span id="pchk"></span>
      </td>
    </tr>
    <tr>
      <td> 전화번호 </td>
      <td> <input type="text" name="phone" value="${mdto.phone}"  size="30"></td>
    </tr>
    <tr>
      <td> 이메일 </td>
      <td> <input type="text" name="email" value="${mdto.email}"  size="30"></td>
    </tr>
    <tr>
      <td> 주소 </td>
      <td> <input type="text" name="juso1" value="${mdto.juso1}"  size="30">
      	   <input type="button" onclick="juso_search()" value="주소찾기" >
      </td>
    </tr>
    <tr>
      <td>  </td>
      <td> <input type="text" name="juso2" value="${mdto.juso2}"  size="30"></td>
    </tr>
    <tr>
      <td>  </td>
      <td> <input type="text" name="juso3" value="${mdto.juso3}"  size="30">
      
      </td>
    </tr>
    <tr>
      <td colspan="2" align="center">
        <input type="submit" value="수정">
      </td>
    </tr>
   </table>
  </form>

</body>
</html>