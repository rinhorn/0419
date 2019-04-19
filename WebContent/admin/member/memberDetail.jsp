<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String member_id=request.getParameter("member_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="/admin/common/registStyle.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){ 
	getDetail();
	
	$($("input[type=button]")[0]).click(function(){
		edit();
	});
	$($("input[type=button]")[1]).click(function(){
		del();
	});
	$($("input[type=button]")[2]).click(function(){
		location.href="/admin/member/";
	});
});

function getDetail(){
	$.ajax({
		url:"/admin/member/"+<%=member_id%>,
		type:"get",
		success:function(result){
			$("input[name='member_id']").val(result.member_id);
			$("input[name='id']").val(result.id);
			$("input[name='pass']").val(result.pass);
			$("input[name='name']").val(result.name);
			$("input[name='nick']").val(result.nick);
			$("input[name='email']").val(result.email);
		}
	});
}

function edit(){
	if(!confirm("회원을 수정하시겠습니까?")){
		return;
	}
	$("form").attr({
		method:"post",
		action:"/admin/member/edit"
	});
	$("form").submit();
}

function del(){
	if(!confirm("회원을 삭제하시겠습니까?")){
		return;
	}
	$("form").attr({
		method:"post",
		action:"/admin/member/delete"
	});
	$("form").submit();
}
</script>
</head>
<body>
	<h3>회원 정보</h3>
	<div class="container">
		<form enctype="multipart/form-data">
			<input type="hidden" name="member_id"/> 
		 	<label for="lname">아이디</label>
			<input type="text" name="id" readonly/> 
		 	<label for="lname">비밀번호</label>
			<input type="text" name="pass"/>
		 	<label for="lname">이름</label>
			<input type="text" name="name" readonly/>
		 	<label for="lname">닉네임</label><p>
			<input type="text" name="nick"/>
		 	<label for="lname">이메일</label><p>
			<input type="text" name="email"/>
			
			<input type="button" value="수정"/>
			<input type="button" value="삭제"/>
			<input type="button" value="목록"/>
		</form>
	</div>
</body>
</html>
