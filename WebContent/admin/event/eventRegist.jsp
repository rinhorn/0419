<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="/admin/common/registStyle.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){ 
	getGame();
	
	$($("input[type=button]")[0]).click(function(){
		regist();
	});
	$($("input[type=button]")[1]).click(function(){
		location.href="/admin/event/";
	});
});

function getGame(){
	$.ajax({
		url:"/rest/admin/games",
		type:"get",
		success:function(result){
			for(var i=0;i<result.length;i++){
				$("select[name='game_id']").append("<option value="+result[i].game_id+">"+result[i].game_name+"</option>");
			}
		}
	});
}

function regist(){
	$("form").attr({
		method:"post",
		action:"/admin/event/regist"
	});
	$("form").submit();
}
</script>
</head>
<body>
	<h3>이벤트 등록</h3>
	<div class="container">
		<form enctype="multipart/form-data">
		 	<label for="lname">이벤트명</label>
			<input type="text" name="event_name" placeholder="이벤트명"/> 
		 	<label for="lname">사진 등록</label><p>
			<input type="file" name="myFile_img"/><p>
			<p>
		 	<label for="lname">아이콘 등록</label><p>
			<input type="file" name="myFile_icon"/><p>
			<p>
		 	<label for="lname">이벤트로 등록할 게임</label>
		 	<select name="game_id">
		 		<option>게임 선택</option>
		 	</select>
		 	<label for="lname">할인율</label>
		 	<select name="event_discount">
		 		<option>할인율 선택</option>
		 		<option value="10">10%</option>
		 		<option value="20">20%</option>
		 		<option value="30">30%</option>
		 		<option value="40">40%</option> 
		 		<option value="50">50%</option> 
		 	</select>
			<input type="button" value="등록"/>
			<input type="button" value="목록"/>
		</form>
	</div>
</body>
</html>
