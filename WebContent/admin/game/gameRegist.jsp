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
		regist();
	});
	$($("input[type=button]")[1]).click(function(){
		location.href="/admin/game/";
	});
});

function getCategory(){
	$.ajax({
		url:"/rest/admin/categories",
		type:"get",
		success:function(result){
			for(var i=0;i<result.length;i++){
				$("select").append("<option value="+result[i].category_id+">"+result[i].category_name+"</option>");
			}
		}
	});
}

function regist(){
	$("form").attr({
		method:"post",
		action:"/admin/game/regist"
	});
	$("form").submit();
}
</script>
</head>
<body>
	<h3>게임 등록</h3>
	<div class="container">
		<form enctype="multipart/form-data">
		 	<label for="lname">카테고리</label>
		 	<select name="category_id">
		 		<option>카테고리 선택</option>
		 	</select>
		 	<label for="lname">게임명</label>
			<input type="text" name="game_name" placeholder="게임명"/> 
		 	<label for="lname">제작사</label>
			<input type="text" name="game_company" placeholder="제작사"/>
		 	<label for="lname">가격</label>
			<input type="text" name="game_price" placeholder="가격"/>
		 	<label for="lname">사진 등록</label><p>
			<input type="file" name="myfile" multiple/><p>
			<p>
		 	<label for="lname">상세 설명</label>
			<textarea name="game_detail" placeholder="상세 설명" style="height: 200px"></textarea>
			<input type="button" value="등록"/>
			<input type="button" value="목록"/>
		</form>
	</div>
</body>
</html>
