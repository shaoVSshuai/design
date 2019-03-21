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
  		  title: '添加品牌',
  		  shadeClose: true,
  		  shade: 0.8,
  		  area: ['380px', '60%'],
  		  content: 'addPinpai.jsp' //iframe的url
  		  ,
  		  end: function(){

  	  		//window.location.reload();  
  		  } //此处用于演示
  		}); 
  	}
  	function addType(){
  	  	//页面层
  	  	//iframe层

  	  		layer.open({
  	  		  type: 2,
  	  		  title: '添加品牌',
  	  		  shadeClose: true,
  	  		  shade: 0.8,
  	  		  area: ['380px', '80%'],
  	  		  content: 'addType.jsp' //iframe的url
  	  		  ,
  	  		  end: function(){

  	  	  		//window.location.reload();  
  	  		  } //此处用于演示
  	  		}); 
  	  	}
  </script>
</head>
<body>
           
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend>
  

  车型价格管理</legend>
</fieldset>

<div class="layui-form" style="width:95%;margin:0 auto">
	<button class="layui-btn" onclick="addpp()">添加品牌</button>  
	<button class="layui-btn" onclick="addType()">添加车型</button>
  <table class="layui-table">
    <colgroup>
      <col width="70">
      <col width="100">
      <col width="130">
      <col>
    </colgroup>
    <thead>
      <tr>
        <th>序号</th>
        <th>车型</th>
        <th>价格（元）	</th>
        <th>品牌</th>
        <th>识别码</th>
        <th>操作</th>
      </tr> 
    </thead>
    <tbody>
    	<%
    		JDBCTools jt = new JDBCTools();
	    	List<HashMap<String,String>> pList = jt.find("SELECT * FROM cartype child ,(SELECT id parid , pid ppid , NAME pname FROM cartype WHERE cartype.pid = 0) par "
	    			 + "WHERE child.pid = par.parid ORDER BY par.pname ");
	    	if(pList != null && pList.size() > 0 ){
	    		for(int i = 0 ; i < pList.size() ; i++){
	    			HashMap<String,String> orders = pList.get(i);
    	%>
		      <tr>
		        <td><%=i+1%></td>
		        <td><%=orders.get("name")%></td>
		        <td><%=orders.get("price")%></td>
		        <td><%=orders.get("pname")%></td>
		        <td><%=UUID.randomUUID()%></td>
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