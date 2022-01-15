<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리 스터디 상세보기</title>
<style>
textarea {
	border: none;
}
</style>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script>
window.onload=function(){
	
	<%//로그인된 아이디가 있는지 확인
String name = (String) session.getAttribute("namekey");%>

	let btnCom=document.querySelector("#btnCom");
	btnCom.addEventListener("click",move);
	
	//로그인 안했으면 댓글 작성 못함
	if("<%=name%>"==="null"){
		document.querySelector("#content").value="로그인 후 이용해주세요.";
		document.querySelector("#content").setAttribute("disabled",true);
		document.querySelector("#userName").value="";
		
	}
	
	if(document.querySelector("#userName").value==frm.userName.value){
		
	}else{
		document.querySelector(".deletecom").innerText="";
	}
}

	function move(){
		if("<%=name%>" === "null") {
			let result = confirm("로그인이 필요한 서비스입니다. \n로그인 하시겠습니까?");
			if (result) {
				//로그인 페이지 이동
				document.log.submit();
				return;
			} else {
				//현재 페이지 머물기
				return;
			}
		}

		//댓글 추가시 내용을 빈값으로 넣었을때 알림창 띄우기
		if (document.querySelector("#content").value === "") {
			alert("내용을 입력하세요.");
			return;
		}
		
		

		frm.submit()
	}
</script>
</head>
<body>

	<p
		style="border-left: 10px solid #688FF4; padding: 0.5em; border-bottom: 2px solid #688FF4;">우리
		스터디 게시판</p>

	<table class="table table-hover">
		<tr>

			<td>작성자 : ${name }</td>
			<td>작성일 : ${pdata.postTime}</td>
			<td>조회수 : ${pdata.views }</td>
		</tr>
		<tr>
			<td colspan="3">제목 : ${pdata.title }</td>
		</tr>
		<tr>
			<td colspan="3"><textarea rows="10" style="width: 99%"
					style="border=none" readonly="readonly">내용 : ${pdata.content }</textarea></td>
		</tr>
	</table>
	<br>
	<br>
	<br>

	<!-- 로그인 안되어있을때 로그인 페이지로 이동하기 위함 -->
	<form action="login" method="get" name="log"></form>

	<!-- 목록 버튼 -->
	<button onclick="location.href='studyboard?userNo=${userNo}&studyNo=${studyNo }&page=1'">목록</button>
	
	
	

	<!-- 댓글 추가기능 -->
	<form action="insertcom" method="post" name="frm"
		class="row gx-3 gy-2 align-items-center">
		<!-- 게시글 상세보기 페이지로 돌아가기 위해 게시글번호 받기-->
		<input type="hidden" name="postNo" value="${postNo }">
		<input type="hidden" name="studyNo" value="${studyNo }">
		<input type="hidden" name="userNo" value="${userNo }">

		<table class="table table-hover">
			<tr>
				<!-- session 닉네임 불러오기!! -->
				<td><input type="text" name="userName" id="userName"
					value="<%=name%>"
					style="border: none; text-align: right; width: 100px;" disabled>
				</td>
				<td><input type="text" name="content" id="content"
					style="width: 500px;"></td>
				<td><input type="button" class="btn btn-outline-primary"
					id="btnCom" value="＋댓글 남기기"></td>
			</tr>
		</table>
	</form>

	<br>


	<!-- 댓글 목록!! -->
	<table class="table table-hover">
		<c:forEach items="${cdata }" var="c">
			<tr>
				<td width="30">${c.commentNo }</td>
				<td width="100">${c.userName }</td>
				<td width="500">${c.content }</td>
				<c:choose>
					<c:when test="${c.userName ==namekey }">
						<td width="35" class="deletecom"><a
							href="deletecom?commentNo=${c.commentNo }&postNo=${c.postNo }&studyNo=${studyNo }&userNo=${userNo }">삭제</a></td>
					</c:when>
					<c:otherwise>
						<td width="35"></td>
					</c:otherwise>
				</c:choose>
				<td width="70">${c.time }</td>

			</tr>
		</c:forEach>


		<tr style="text-align: center;">
			<td colspan="6"><c:forEach var="cpsu" begin="1"
					end="${cpageSu }">
					<c:if test="${cpsu == cpage }">
						<b><u>${cpsu }</u></b>
					</c:if>
					<c:if test="${cpsu != cpage }">
						<a href="postDetail?postNo=${postNo }&cpage=${cpsu}&studyNo=${studyNo }&userNo=${userNo }">${cpsu}</a>
					</c:if>
				</c:forEach></td>
		</tr>
	</table>



</body>
</html>