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
		function del_chk()
		{
			if(confirm("삭제하면 복구할 수 없습니다 \n정말로 삭제하시겠습니까?")==true)  //확인
			{
				location.href="delete?tid="+${tid}+"&fid="+${tfdto.fid};
			}	
			else //취소
			{
				return false;
			}
		}
	</script>
</head>
<body>
	<c:if test="${userid==tfdto.userid}">
	<div id="content">
		<table align="center" border="1">
		<caption><h3>${tfdto.userid }님의 응원글</h3></caption>
			<tr>
				<td>제목</td>
				<td>${tfdto.title }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${tfdto.content }</td>
			</tr>
			<tr>
				<td>추천수</td>
				<td>${tfdto.chu }</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${tfdto.writeday }</td>
			</tr>
			<tr>
				<td colspan="2">
					<a href="list?tid=${tid}">목록</a>
					<a href="update?tid=${tid}&fid=${tfdto.fid}">수정</a>
					<a href="javascript:void(0);" onclick="del_chk()">삭제</a>
				</td>
			</tr>
		</table>
	</div>
	</c:if>
</body>
</html>