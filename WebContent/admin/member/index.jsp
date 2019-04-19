<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="/admin/common/bar.jsp"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ include file="/admin/common/tableStyle.jsp"%>
</head>
<style>
#member {
	background-color: #4CAF50;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	getPager();
});

function getPager(){
	$.ajax({
		url:"/admin/pagers",
		type:"get",
		success:function(result){
			var str="";
			str+="<tr>";
			str+="<td colspan='5'>";
			
			for(var i=result.firstPage; i<result.lastPage; i++){
				if(i>result.totalPage) break;
				str+="<a href='/admin/member/index.jsp?currentPage="+i+"'>["+i+"]</a>&nbsp&nbsp";
			}
			
			str+="</td>";
			str+="</tr>";
			$("tfoot").append(str);
			
			getMember(result);
		}
	});
}

function getMember(pager){
	$.ajax({
		url:"/admin/members",
		type:"get",
		success:function(result){
			var str="";
			for(var i=1;i<=pager.pageSize;i++){
				if(pager.num<1) break;
				pager.num=pager.num-1;
				pager.curPos=pager.curPos+1;
				str+="<tr class='member-list'>";
				str+="<td><a href='/admin/member/memberDetail.jsp?member_id="+result[pager.curPos].member_id+"'>"+result[pager.curPos].id+"</a></td>";
				str+="<td>"+result[pager.curPos].pass+"</td>";
				str+="<td>"+result[pager.curPos].name+"</td>";
				str+="<td>"+result[pager.curPos].nick+"</td>";
				str+="<td>"+result[pager.curPos].email+"</td>";
				str+="</tr>";
			}
			$("table").append(str);
		}
	});
}
$(function(){
	$(".searchbt").click(function(){
		search();
	});
});
function search(){
	$.ajax({
		url:"/admin/membersearch",
		type:"get",
		data:{
			id:$("input[name='search']").val()
		},
		success:function(result){
			
			var re=$("input[type='text']").val();
			
			if($("input[type='text']").val()==result.id){
				alert("있");
				var str="";
				$(".member-list").html("");
				str+="<tr>";
				str+="<td>"+result.id+"</td>";
				str+="<td>"+result.pass+"</td>";
				str+="<td>"+result.name+"</td>";
				str+="<td>"+result.nick+"</td>";
				str+="<td>"+result.email+"</td>";
				str+="</tr>";

				$("table").append(str);
			}else{
				alert("없");
				return;
			}
		}
	});
}

</script>
<body>
	<div>
		<h2>회원 관리</h2>
	</div>
	<div>
		<form>
			<input type="text" placeholder="Search.." name="search">
			<button type="button" class="searchbt"><i class="fa fa-search"></i></button>
		</form>
	</div>

	<table>
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>닉네임</th>
			<th>이메일</th>
		</tr>
		<tfoot>
		</tfoot>
	</table>
</body>
</html>