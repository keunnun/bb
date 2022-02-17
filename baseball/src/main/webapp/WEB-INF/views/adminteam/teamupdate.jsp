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
			width:1200px;
			margin:auto;
		}
		
		table{
			width:1000px;
		}
		tr {
			text-align:center;
		}
		
	</style>
	
	<script>
		function del_chk(tid)
		{
			if(confirm("삭제하면 복구할 수 없습니다 \n정말로 삭제하시겠습니까?")==true)  //확인
			{
				location.href="teamdelete?tid="+tid;
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
		<form method="post" action="teamupdate_ok">
			<table align="center" border="1">
			<caption><h3>구단정보</h3></caption>
				<tr>
					<td>목록</td>
					<td>정보</td>
				</tr>
				
				<tr>
					<td>팀이름</td>
					<td>
						<input type="hidden" name="tid" value=${tid }>
						<input type="text" name="tname" value=${tdto.tname } size="38">
					</td>
				</tr>
				<tr>
					<td>구단사무실</td>
					<td>
						<textarea cols="40" rows="3" name="office">${tdto.office }</textarea>
					</td>
				</tr>
				<tr>
					<td>전화/팩스</td>
					<td>
						<textarea cols="40" rows="3" name="hpo">${tdto.hpo }</textarea>
					</td>
				</tr>
				<tr>
					<td>홈페이지</td>
					<td>
						<input type="text" name="home" value=${tdto.home } size="38">
					</td>
				</tr>
				<tr>
					<td>창단년도</td>
					<td>
						<input type="text" name="cyear" value=${tdto.cyear } size="38">
					</td>
				</tr>
				<tr>
					<td>연고지역</td>
					<td>
						<input type="text" name="area" value=${tdto.area } size="38">
					</td>
				</tr>
				<tr>
					<td>구단주</td>
					<td>
						<input type="text" name="owner" value=${tdto.owner } size="38">
					</td>
				</tr>
				<tr>
					<td>대표이사</td>
					<td>
						<input type="text" name="ceo" value=${tdto.ceo } size="38">
					</td>
				</tr>
				<tr>
					<td>단장</td>
					<td>
						<input type="text" name="leader" value=${tdto.leader } size="38">
					</td>
				</tr>
				<tr>
					<td>감독</td>
					<td>
						<input type="text" name="director" value=${tdto.director } size="38">
					</td>
				</tr>
				<tr>
					<td>우승횟수(연도)</td>
					<td>
						<textarea cols="40" rows="3" name="win">${tdto.win }</textarea>
					</td>
				</tr>
				<tr>
					<td>우승횟수(추가)</td>
					<td>
						<textarea cols="40" rows="3" name="winsub">${tdto.winsub }</textarea>
					</td>
				</tr>
				<tr>
					<td>이미지</td>
					<td>
						<input type="text" name="imgname" value=${tdto.imgname } size="38">
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="button" value="목록" onclick="location.href='teamlist'"> 
						<input type="submit" value="수정">
						<input type="button" value="삭제" onclick="del_chk('${tid}')"> 
					</td>
				</tr>
			</table>
		</form>
	</div>
</c:if>
</body>
</html>