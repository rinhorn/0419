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
	$($("input[type=button]")[0]).click(function(){
		edit();
	});
	$($("input[type=button]")[1]).click(function(){
		del();
	});
	$($("input[type=button]")[2]).click(function(){
		location.href="/admin/event/";
	});
});
</script>
</head>
<body>
	<h3>이벤트 정보</h3>
	<div class="container">
		<form>
		 	<label for="lname">이벤트명</label>
			<input type="text" name="event_name"/> 
		 	<label for="lname">사진 등록</label><p>
			<input type="file" name="event_img"/><p>
			<p>
		 	<label for="lname">아이콘 등록</label><p>
			<input type="file" name="event_icon"/><p>
			<p>
		 	<label for="lname">이벤트로 등록할 게임</label>
		 	<select name="event_game">
		 		<option>게임 선택</option>
		 	</select>
		 	<label for="lname">할인율</label>
		 	<select name="event_discount">
		 		<option>할인율 선택</option>
		 	</select>
			<input type="button" value="수정"/>
			<input type="button" value="삭제"/>
			<input type="button" value="목록"/>
		</form>
	</div>
</body>
</html>
