<%@page import="com.hzyc.wms.entity.Payorders"%>
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
  </script>
</head>
<body>
           
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend>
  
  <%
 	String type = (String)request.getAttribute("type");
 if(type.equals("1")){
		out.print("未审核");
	}
 if(type.equals("2")){
		out.print("已通过");
	}
 if(type.equals("3")){
		out.print("已驳回");
	}
 %> 
  订单</legend>
</fieldset>

<div class="layui-form" style="width:95%;margin:0 auto">
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
        <th>用户姓名</th>
        <th>电话	</th>
        <th>收货地址</th>
        <th>下单时间</th>
        <th>订单状态</th>
        <th>操作</th>
      </tr> 
    </thead>
    <tbody>
    	<%
	    	List<Payorders> pList = (List<Payorders>)request.getAttribute("pList");
	    	if(pList != null && pList.size() > 0 ){
	    		for(int i = 0 ; i < pList.size() ; i++){
	    			Payorders orders = pList.get(i);
    	%>
		      <tr>
		      	<input type="hidden" name="id" value="<%=orders.getId()%>" />
		      	<input type="hidden" name="id" value="<%=orders.getUserid()%>" />
		        <td><%=i+1%></td>
		        <td><%=orders.getName()%></td>
		        <td><%=orders.getTel()%></td>
		        <td><%=orders.getAddress()%></td>
		        <td><%=orders.getTime()%></td>
		        <td><%
		        	if(orders.getState().equals("1")){
		        		out.print("未审核");
		        	}
			        if(orders.getState().equals("2")){
		        		out.print("已通过");
		        	}
			        if(orders.getState().equals("3")){
		        		out.print("已驳回");
		        	}
		        %></td>
		        <td>
		        	<!-- 如果当前的单是未审核  那么添加审核按钮  否则不显示 -->
		        	<%
		        		if(type.equals("1")){
		        	%>
		        		<button class="layui-btn" onclick="confirm1('<%=orders.getId()%>','2','<%=type%>','<%=orders.getUserid()%>')">通过</button>
		        		<button class="layui-btn" onclick="confirm1('<%=orders.getId()%>','3','<%=type%>','<%=orders.getUserid()%>')">驳回</button>
		        	<%
		        		}
		        	 %>
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