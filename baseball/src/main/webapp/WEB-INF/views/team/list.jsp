<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		#info {
			width:1200px;
			margin:auto;
		}
		
		#word {
			width:1200px;
			text-align:center;
			padding-bottom:12px;
			margin:auto;
		}
		
		#content {
			width:1200px;
			padding-bottom:25px;
			margin:auto;
		}
		
		table{
			width:1000px;
			border-collapse:collapse;
			border-collapse:separate;
		}
		tr {
			text-align:center;
		}
		th {
			border-top:1px solid #222222;
			border-bottom:1px solid #222222;
			background: #efeff1;
		}
		td {
			border-bottom:1px solid #c0c0c0;
			
		}

	</style>
	<script>
		function log()
		{
			alert("로그인시 이용가능합니다");
		}
		
		function log_chk()
		{
			alert("본인글은 추천할 수 없습니다");
		}
		
		function get_chu(fid,userid,n)
		{
			var gc=new XMLHttpRequest();  // 아작스를 변수로 받음
			gc.open("get","chu?fid="+fid+"&userid="+userid); // 아작스로 요청
			gc.send();
			
			gc.onreadystatechange=function()
			{
				if(gc.readyState==4)
				{
					if(gc.responseText!=-1) {
						document.getElementsByClassName("like")[n].innerText=gc.responseText;
					}
					else {
						alert("이미 추천한 글입니다");	
					}
				}
			}
		}

	</script>
</head>
<body>
	<div id="info">
		<table align="center" cellspacing="0">
		<caption><h3>${tdto.tname}</h3></caption>
			<tr>
				<th>목록</th>
				<th>정보</th>
			</tr>
			<tr>
				<td>팀명</td>
				<td align="left">${tdto.tname}</td>
			</tr>
			<tr>
				<td>구단사무실</td>
				<td align="left">${tdto.office}</td>
			</tr>
			<tr>
				<td>전화/팩스</td>
				<td align="left">${tdto.hpo}</td>
			</tr>
			<tr>
				<td>홈페이지</td>
				<td align="left"><a href="http://${tdto.home}">${tdto.home}</a></td>
			</tr>
			<tr>
				<td>창단년도</td>
				<td align="left">${tdto.cyear}</td>
			</tr>
			<tr>
				<td>연고지역</td>
				<td align="left">${tdto.area}</td>
			</tr>
			<tr>
				<td>구단주</td>
				<td align="left">${tdto.owner}</td>
			</tr>
			<tr>
				<td>대표이사</td>
				<td align="left">${tdto.ceo}</td>
			</tr>
			<tr>
				<td>단장</td>
				<td align="left">${tdto.leader}</td>
			</tr>
			<tr>
				<td>감독</td>
				<td align="left">${tdto.director}</td>
			</tr>
		</table>
	</div>
	
	<div id="word">
		<img src="../resources/word/${tid }.png">
	</div>
	
	<div id="content">
		<table align="center" cellspacing="0">
			<tr>
				<td colspan="5">
					<form method="post" action="list?tid=${tid }">
						<select name="field">
							<option value="userid">아이디</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
						<input type="text" name="word" value="${word }">
						<input type="submit" value="검색">
					</form>	
				</td>
			</tr>
			<tr>
				<th>id</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성일</th>
				<th>추천</th>
			</tr>
			<c:set var="aa" value="0"/>
			<c:forEach items="${list2 }" var="tfdto">
			<tr>
				<td>${tfdto.userid }</td>
				<td>
					<c:if test="${userid==null or userid!=tfdto.userid}">
					${tfdto.title }
					</c:if>
					<c:if test="${userid!=null and userid==tfdto.userid}">
					<a href="content?tid=${tid }&fid=${tfdto.fid }">${tfdto.title }</a>
					</c:if>
				</td>
				<td>${tfdto.content }</td>
				<td>${tfdto.writeday }</td>
				<td>
					<span class="like"> ${tfdto.chu } </span>
					<c:if test="${userid==null}">
					<button onclick="log()">like</button>
					</c:if>
					<c:if test="${userid==tfdto.userid}">
					<button onclick="log_chk()">like</button>
					</c:if>
					<c:if test="${userid!=null and userid!=tfdto.userid}">
					<button onclick="get_chu(${tfdto.fid}, '${tfdto.userid}' ,${aa})">like</button>
					</c:if>
					<c:set var="aa" value="${aa+1}"/>
				</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="5">
					<c:if test="${userid==null}">	
					<a href="javascript:void(0);" onclick="log()">글쓰기</a>
					</c:if>
					<c:if test="${userid!=null}">	
					<a href="write?tid=${tid }">글쓰기</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="5">
					<!-- 현재페이지 기준으로 이전 10페이지 이동 -->
					<c:if test="${pstart!=1 }">
						<a href="list?tid=${tid}&page=${pstart-10 }"> (<) </a>
					</c:if>
					<c:if test="${pstart==1 }">
						(<)
					</c:if>
					<!-- 현재페이지 기준으로 이전 1페이지 이동 -->
					<c:if test="${page!=1 }">
						<a href="list?tid=${tid}&page=${page-1 }"> < </a>
					</c:if>
					<c:if test="${page==1 }">
						<
					</c:if>
					
					<!-- 현재페이지 기준으로 이동할 수 있는 페이지 -->
					<c:forEach var="i" begin="${pstart }" end="${pend }" >
						<!-- 현재페이지 색은 다르게 => 빨강 -->
						<c:if test="${page!=i }">
							<a href="list?tid=${tid}&page=${i }"> ${i }</a>
						</c:if>
						<c:if test="${page==i }">
							<a href="list?tid=${tid}&page=${i }" style="color:red"> ${i }</a>
						</c:if>
					</c:forEach>
					
					<!-- 현재페이지 기준으로 다음 1페이지 이동 -->
					<c:if test="${page!=page_cnt }">
						<a href="list?tid=${tid}&page=${page+1 }"> > </a>
					</c:if>
					<c:if test="${page==page_cnt }">
						>
					</c:if>
					<!-- 현재페이지 기준으로 이전 10페이지 이동 -->
					<c:if test="${page_cnt!=pend }">
						<a href="list?tid=${tid}&page=${pend+1 }"> (>) </a>
					</c:if>
					<c:if test="${page_cnt==pend }">
						(>)
					</c:if>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>