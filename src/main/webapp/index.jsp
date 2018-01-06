<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>Project004</title>
<style>
body {
	text-align: center;
	
}
table{
	align-content: center;
}
</style>

</head>
<body>
	<h1>Hello Gallery</h1>

	<img src="/img/img_01.jpg" style="width: 300px; height: 300px;" />
	<div >
	<form style="text-align: center;" >
		아 이 디	:<input type="text" name="user_id" value="user_id"><br>
		비밀번호	:<input type="text"  name="user_pwd"  value="user_pwd"><br>
		<input type="button" value="로그인">	<a href="#this" class="btn" id="form" >회원가입</a>
		
		</form>
	</div>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#form").on("click", function(e) { //회원가입 버튼
				e.preventDefault();
				fn_joinForm();
			});
		});

		function fn_joinForm() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/login/openJoinForm.do' />");
			comSubmit.submit();
		}
	</script>
</body>
</html>
		