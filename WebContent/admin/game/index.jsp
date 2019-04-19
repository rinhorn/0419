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
#game {
   background-color: #4CAF50;
}
</style>
<script>
$(function(){
   getList();
   $("button").click(function(){
      location.href="/admin/game/gameRegist.jsp";
   });
});

function getList(){
   $.ajax({
      url:"/rest/admin/games",
      type:"get",
      success:function(result){
         var str="";
         str+="<tr>";
         str+="<th>이름</th>";
         str+="<th>가격</th>";
         str+="<th>제작사</th>";
         str+="<th>등록일</th>";
         str+="</tr>";
         for(var i=0; i<result.length; i++){ 
            str+="<tr>";
            str+="<td><a href='/admin/game/gameDetail.jsp'>";
            str+=result[i].game_name;
            str+="</a></td>";
            str+="<td>"+result[i].game_price+"</td>";
            str+="<td>"+result[i].game_company+"</td>";
            str+="<td>"+result[i].game_date+"</td>";
            str+="</tr>";
         }
         str+="<tr>";
         str+="<td colspan='4'>";
         for(var i=1; i<=10; i++){ 
            str+="["+i+"]"; 
         }
         str+="</td>";
         str+="<tr>";
         str+="<td colspan='4'>";
         str+="<button>등록</button>";
         str+="</td>";
         str+="</tr>";
         $("table").append(str);
      }
   });
}
</script>
<body>
   <div>
      <h2>상품 관리</h2>
   </div>
   <div>
      <form>
         <input type="text" placeholder="Search.." name="search">
         <button type="submit">
            <i class="fa fa-search"></i>
         </button>
      </form>
   </div>
   <table>
   </table>
</body>
</html>