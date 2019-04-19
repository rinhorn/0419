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
	getCategory();
	
	$($("input[type=button]")[0]).click(function(){
		edit();
	});
	$($("input[type=button]")[1]).click(function(){
		del();
	});
	$($("input[type=button]")[2]).click(function(){
		location.href="/admin/game/";
	});
});

function getCategory(){
	$.ajax({
		url:"/admin/categories",
		type:"get",
		success:function(result){
			for(var i=0;i<result.length;i++){
				$("select").append("<option value="+result[i].category_id+">"+result[i].category_name+"</option>");
			}
		}
	});
}
</script>
</head>
<body>
	<h3>게임 정보</h3>
	<div class="container">
		<form>
		 	<label for="lname">카테고리</label>
		 	<select name="category_id">
		 		<option>카테고리 선택</option>
		 	</select>
		 	<label for="lname">게임명</label>
			<input type="text" name="game_name"/> 
		 	<label for="lname">제작사</label>
			<input type="text" name="game_company"/>
		 	<label for="lname">가격</label>
			<input type="text" name="game_price"/>
		 	<label for="lname">할인율</label>
			<input type="text" name="game_sale"/>
		 	<label for="lname">사진 등록</label><p>
			<input type="file" name="img_filename" multiple/><p>
			<p>
		 	<label for="lname">상세 설명</label>
			<textarea name="game_detail" style="height: 200px"></textarea>
			
			<input type="button" value="수정"/>
			<input type="button" value="삭제"/>
			<input type="button" value="목록"/>
		</form>
	</div>
</body>
</html>
