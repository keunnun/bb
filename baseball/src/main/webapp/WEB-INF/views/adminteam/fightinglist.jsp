<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		#content {
			padding-top:6px;
			padding-bottom:15px;
		}
		table{
			width:1000px;
		}
		tr {
			text-align:center;
		}
	</style>
	<script>
		function del_chk(fid)
		{
			if(confirm("삭제하면 복구할 수 없습니다 \n정말로 삭제하시겠습니까?")==true)  //확인
			{
				location.href="delete?fid="+fid;
			}	
			else //취소
			{
				return false;
			}
		}
	</script>
</head>
<body>
<c:if test="${userid=='admin'}">
	<div id="content">
		<table align="center" border="1">
		<caption><h3>게시글관리</h3></caption>
			<tr>
				<td colspan="7">
					<form method="post" action="fightinglist">
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
				<td>id</td>
				<td>제목</td>
				<td>팀명</td>
				<td>내용</td>
				<td>추천수</td>
				<td>작성일</td>
				<td>삭제</td>
			</tr>
			<c:forEach items="${list }" var="tfdto">
			<tr>
				<td>${tfdto.userid }</td>
				<td>${tfdto.title }</td>
				<td>${tfdto.tname }</td>
				<td>${tfdto.content }</td>
				<td>${tfdto.chu }</td>
				<td>${tfdto.writeday }</td>
				<td>
					<input type="button" value="삭제" onclick="del_chk(${tfdto.fid})">
				</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="7">
					<!-- 현재페이지 기준으로 이전 10페이지 이동 -->
					<c:if test="${pstart!=1 }">
						<a href="fightinglist?page=${pstart-10 }"> (<) </a>
					</c:if>
					<c:if test="${pstart==1 }">
						(<)
					</c:if>
					<!-- 현재페이지 기준으로 이전 1페이지 이동 -->
					<c:if test="${page!=1 }">
						<a href="fightinglist?page=${page-1 }"> < </a>
					</c:if>
					<c:if test="${page==1 }">
						<
					</c:if>
					
					<!-- 현재페이지 기준으로 이동할 수 있는 페이지 -->
					<c:forEach var="i" begin="${pstart }" end="${pend }" >
						<!-- 현재페이지 색은 다르게 => 빨강 -->
						<c:if test="${page!=i }">
							<a href="fightinglist?page=${i }"> ${i }</a>
						</c:if>
						<c:if test="${page==i }">
							<a href="fightinglist?page=${i }" style="color:red"> ${i }</a>
						</c:if>
					</c:forEach>
					
					<!-- 현재페이지 기준으로 다음 1페이지 이동 -->
					<c:if test="${page!=page_cnt }">
						<a href="fightinglist?page=${page+1 }"> > </a>
					</c:if>
					<c:if test="${page==page_cnt }">
						>
					</c:if>
					<!-- 현재페이지 기준으로 이전 10페이지 이동 -->
					<c:if test="${page_cnt!=pend }">
						<a href="fightinglist?page=${pend+1 }"> (>) </a>
					</c:if>
					<c:if test="${page_cnt==pend }">
						(>)
					</c:if>
				</td>
			</tr>
		</table>
	</div>
</c:if>
</body>
</html>