<%@page import="java.util.UUID"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.hzyc.intstudio.util.JDBCTools"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>layui</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="<%=basePath%>layui/css/layui.css"  media="all">
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
  <script>
  	function confirm1(id,state,type,userid){
  		var operinfo = "";
  		if(state == '2'){
  			operinfo = "通过"
  		}else if(state == '3'){
  			operinfo = "驳回";
  		}
  	//询问框
		//type  就是获取当前页面查询数据的类型 是已处理  还是未处理
  		layer.confirm('确认'+ operinfo +'吗？', {
  		  btn: ['确认','取消'] //按钮
  		}, function(){
  		  layer.msg('审核中...请稍候', {icon: 1});
  		  window.location.href="/admin/auditing?id="+id+"&state="+state+"&type="+type+"&userid="+userid;
  		}, function(){
  		  layer.msg('已取消', {
  		    time: 1000//20s后自动关闭
  		  });
  		});s
  	}
  	
  	
  	function addpp(){
  	//页面层
  	//iframe层

  		layer.open({
  		  type: 2,
  		  title: '添加兑换规则',
  		  shadeClose: true,
  		  shade: 0.8,
  		  area: ['480px', '60%'],
  		  content: 'addRole.jsp' //iframe的url
  		  ,
  		  end: function(){

  	  		//window.location.reload();  
  		  } //此处用于演示
  		}); 
  	}
  	function addGift(){
  	  	//页面层
  	  	//iframe层

  	  		layer.open({
  	  		  type: 2,
  	  		  title: '添加礼品',
  	  		  shadeClose: true,
  	  		  shade: 0.8,
  	  		  area: ['580px', '80%'],
  	  		  content: 'addGift.jsp' //iframe的url
  	  		  ,
  	  		  end: function(){

  	  	  		//window.location.reload();  
  	  		  } //此处用于演示
  	  		}); 
  	  	}
  	
  	
  		function del(id){
  			
  			 var req = new XMLHttpRequest();
             req.open("post" ,"/delete" , true);
             req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
             req.send("id="+id+"&table=grade_gift");
             req.onreadystatechange = function(){
             	if(req.readyState == 4){
             		if(req.responseText == 'true'){
             			alert("操作成功...");
             			window.location.reload();
             		}else{
             			alert('删除失败...');
             		}
             	}	
             }
             
  		}
  </script>
</head>
<body>
           
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend>
  

  积分礼品管理</legend>
</fieldset>

<div class="layui-form" style="width:95%;margin:0 auto">
	<button class="layui-btn" onclick="addpp()">添加兑换规则</button>  
	<button class="layui-btn" onclick="addGift()">添加兑换礼品</button>
  <table class="layui-table">
    <colgroup>
      <col width="70">
      <col width="150">
      <col width="170">
      <col>
    </colgroup>
    <thead>
      <tr>
        <th>序号</th>
        <th>所需积分</th>
        <th>礼品名称	</th>
        <th>操作人</th>
        <th>操作时间</th>
        <th>状态</th>
        <th>操作</th>
      </tr> 
    </thead>
    <tbody>
    	<%
    		JDBCTools jt = new JDBCTools();
	    	List<HashMap<String,String>> pList = jt.find("SELECT g.*,gift.name FROM grade_gift g,gift gift WHERE g.gift = gift.id ");
	    	if(pList != null && pList.size() > 0 ){
	    		for(int i = 0 ; i < pList.size() ; i++){
	    			HashMap<String,String> orders = pList.get(i);
    	%>
		      <tr>
		        <td><%=i+1%></td>
		        <td><%=orders.get("grade")%></td>
		        <td><%=orders.get("name")%></td>
		        <td><%=orders.get("userid")%></td>
		        <td><%=orders.get("times")%></td>
		        <td><%=orders.get("flag").equals("1") ? "正常" : "暂停" %></td>
		        <td>
		        <!-- 	<button class="layui-btn" onclick="">修改</button> -->
		        		<button class="layui-btn" onclick="del('<%=orders.get("id")%>')">删除</button>
		        	
		        </td>
		      </tr>
      	<%
	    		}
	    	}
	    %>
      
    </tbody>
  </table>
</div>      
          
<script src="<%=basePath%>layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
 
<script>
layui.use('table', function(){
  var table = layui.table;
  
});
</script>

</body>

</html>