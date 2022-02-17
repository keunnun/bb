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
				location.href="rankdelete?lid="+${lid};
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
		<form method="post" action="rankupdate_ok">
			<table align="center" border="1">
			<caption><h3>구단순위</h3></caption>
				<tr>
					<td>목록</td>
					<td>정보</td>
				</tr>
				<tr>
					<td>년도</td>
					<td>
						<input type="hidden" name="lid" value="${lid }">
						<input type="text" name="year" value=${rdto.year }>
					</td>
				</tr>
				<tr>
					<td>순위</td>
					<td>
						<input type="text" name="rank" value=${rdto.rank }>
					</td>
				</tr>
				<tr>
					<td>팀명</td>
					<td>
						<input type="text" name="tname" value=${rdto.tname }>
					</td>
				</tr>
				<tr>
					<td>경기</td>
					<td>
						<input type="text" name="games" value=${rdto.games }>
					</td>
				</tr>
				<tr>
					<td>승</td>
					<td>
						<input type="text" name="wins" value=${rdto.wins }>
					</td>
				</tr>
				<tr>
					<td>패</td>
					<td>
						<input type="text" name="loses" value=${rdto.loses }>
					</td>
				</tr>
				<tr>
					<td>무</td>
					<td>
						<input type="text" name="draws" value=${rdto.draws }>
					</td>
				</tr>
				<tr>
					<td>승률</td>
					<td>
						<input type="text" name="winrate" value=${rdto.winrate }>
					</td>
				</tr>
				<tr>
					<td>게임차</td>
					<td>
						<input type="text" name="gcs" value=${rdto.gcs }>
					</td>
				</tr>
				<tr>
					<td>최근10경기</td>
					<td>
						<input type="text" name="gten" value=${rdto.gten }>
					</td>
				</tr>
				<tr>
					<td>연속</td>
					<td>
						<input type="text" name="conw" value=${rdto.conw }>
					</td>
				</tr>
				<tr>
					<td>홈</td>
					<td>
						<input type="text" name="hxthap" value=${rdto.hxthap }>
					</td>
				</tr>
				<tr>
					<td>방문</td>
					<td>
						<input type="text" name="exthap" value=${rdto.exthap }>
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="submit" value="수정">
						<input type="button" value="취소" onclick="location.href='adminrank'"> 
						<input type="button" value="삭제" onclick="del_chk()"> 
					</td>
				</tr>
			</table>
		</form>
	</div>
</c:if>
</body>
</html>