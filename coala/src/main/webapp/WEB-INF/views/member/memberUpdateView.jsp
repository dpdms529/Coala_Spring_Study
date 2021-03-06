<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원가입</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cancel").on("click", function(){
				
				location.href = "/";
						    
			})
		
			$("#memberUpdateBtn").on("click", function(){
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
				$.ajax({
					url : "/member/passChk",
					type : "POST",
					dateType : "json",
					data : $("#updateForm").serializeArray(),
					success: function(data){
						if(data==true){
							if(confirm("회원정보를 수정하시겠습니까?")){
								$("#updateForm").submit();
							}
						}else{
							alert("패스워드가 틀렸습니다.");
							return;
						}
					}
				})
			});
			
			$("#memberDeleteBtn").on("click",function(){
				location.href="/member/memberDeleteView";
			})
			
		})
	</script>
	<body>
		<div class="container">
			<section id="container">
				<form id="updateForm" action="/member/memberUpdate" method="post">
					<div class="form-group has-feedback">
						<label class="control-label" for="userId">아이디</label>
						<input class="form-control" type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly"/>
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="userPass">패스워드</label>
						<input class="form-control" type="password" id="userPass" name="userPass" />
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="userName">성명</label>
						<input class="form-control" type="text" id="userName" name="userName" value="${member.userName}"/>
					</div>
				</form>
					<div class="form-group has-feedback">
						<button class="btn btn-success" type="button" id="memberUpdateBtn">회원정보수정</button>
						<button class="cancel btn btn-danger" type="button">취소</button>
						<button class="btn btn-warning" type="button" id="memberDeleteBtn" style="float: right;">회원탈퇴</button>
					</div>
			</section>
		</div>
		
	</body>
	
</html>