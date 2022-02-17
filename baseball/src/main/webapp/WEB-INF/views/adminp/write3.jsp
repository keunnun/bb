<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function check2() {// 아이디의 중복체크와 비밀번호의 체크
		// 아이디 체크를 위해 ajax를 통해 서버에 접근

		var chk = new XMLHttpRequest();
		var gid = document.fu.gid.value;
		chk.open("get", "check2?gid="+gid); //전송하는 문서의 정보및 전달할 값
		chk.send(); // submit         
		chk.onreadystatechange = function() {
			if (chk.readyState == 4) // 완료된 상태
			{
				//alert(chk.responseText); 1이면 아이디가 존재, 0이면 아이디 없다
				if (chk.responseText == 1) {
					//사용불가능 
					document.getElementById("idchk").innerHTML = "<br><b style='color:red;font-size:12px'>사용불가능선수번호 </b>";
					//document.getElementById("userid").value="";
					document.fu.pr.value = 0;
				} else {
					//사용가능
					document.getElementById("idchk").innerHTML = "<br><b style='color:blue;font-size:12px'>사용가능선수번호 </b>";
					document.fu.pr.value = 1;
				}
			} // 
		} //  chk상태
	} //function 종료

	function check1() {
		var f = document.fu;
		var avg = parseFloat(fu.avg.value);
		if (isNaN(avg)) {
			alert("타율에 숫자를 입력하세요");
			fu.avg.focus();
			return false;
		}
		var g = parseFloat(fu.g.value);
		if (isNaN(g)) {
			alert("경기수에 숫자를 입력하세요");
			fu.g.focus();
			return false;
		}
		var h = parseFloat(fu.h.value);
		if (isNaN(h)) {
			alert("안타수에 숫자를 입력하세요");
			fu.h.focus();
			return false;
		}
		var b2 = parseFloat(fu.b2.value);
		if (isNaN(b2)) {
			alert("2루타수에 숫자를 입력하세요");
			fu.b2.focus();
			return false;
		}
		var b3 = parseFloat(fu.b3.value);
		if (isNaN(b3)) {
			alert("3루타수에 숫자를 입력하세요");
			fu.b3.focus();
			return false;
		}
		var hr = parseFloat(fu.hr.value);
		if (isNaN(hr)) {
			alert("홈런에 숫자를 입력하세요");
			fu.hr.focus();
			return false;
		}
		var bb = parseFloat(fu.bb.value);
		if (isNaN(bb)) {
			alert("볼넷에 숫자를 입력하세요");
			fu.bb.focus();
			return false;
		}
		var obp = parseFloat(fu.obp.value);
		if (isNaN(obp)) {
			alert("출루율에 숫자를 입력하세요");
			fu.obp.focus();
			return false;
		}
		var slg = parseFloat(fu.slg.value);
		if (isNaN(slg)) {
			alert("장타율에 숫자를 입력하세요");
			fu.slg.focus();
			return false;
		}
		var so = parseFloat(fu.so.value);
		if (isNaN(so)) {
			alert("삼진수에 숫자를 입력하세요");
			fu.so.focus();
			return false;
		}
		var era = parseFloat(fu.era.value);
		if (isNaN(era)) {
			alert("평균자책점에 숫자를 입력하세요");
			fu.era.focus();
			return false;
		}
		var hbp = parseFloat(fu.hbp.value);
		if (isNaN(hbp)) {
			alert("사구수에 숫자를 입력하세요");
			fu.hbp.focus();
			return false;
		}
		var r = parseFloat(fu.r.value);
		if (isNaN(r)) {
			alert("실점에 숫자를 입력하세요");
			fu.r.focus();
			return false;
		} 

		var f = document.fu;
		if (f.pr.value == 0) {
			alert("선수번호 중복확인하세요");
			return false;
		}
	}
</script>
</head>
<body>
<c:if test="${userid=='admin'}">
	<form method="post" align="center" action="write_ok3"
		onsubmit="return check1()" name="fu">

		<input type="hidden" name="pr" value="0"> 선수번호-시즌<input
			id="gid" type="text" name="gid" onblur="check2()">
			<input type="button" value="선수번호시즌조회" onclick="check2()"> 
			<div id="idchk"></div> 
			선수이름 <input type="text" name="pname">
		<p>
			연도 <input type="text" name="year">
		<p>
			팀이름 <input type="text" name="tname">
		<p>
			타율 <input type="text" name="avg">
		<p>
			경기수 <input type="text" name="g">
		<p>
			안타 <input type="text" name="h">
		<p>
			2루타 <input type="text" name="b2">
		<p>
			3루타 <input type="text" name="b3">
		<p>
			홈런<input type="text" name="hr">
		<p>
			볼넷 <input type="text" name="bb">
		<p>
			출루율 <input type="text" name="obp">
		<p>
			장타율 <input type="text" name="slg">
		<p>
			삼진 <input type="text" name="so">
		<p>
			평균자책점 <input type="text" name="era">
		<p>
			이닝 <input type="text" name="ip">
		<p>
			사구 <input type="text" name="hbp">
		<p>
			실점 <input type="text" name="r">
		<p>
			선수번호<input type="text" name="pid">
		<p>
			<input type="submit" value="등록">
	</form>
</c:if>
</body>
</html>





