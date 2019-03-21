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
  <script src="<%=basePath%>layui/layui.js" charset="utf-8"></script>
  </head>
  
  <body>
<form class="layui-form" action="/addRole" style="margin-top:40px;">
  <div class="layui-form-item">
    <label class="layui-form-label">礼品选择</label>
    <div class="layui-input-inline">
      <select name="type">
   ·	<%
		JDBCTools jt = new JDBCTools();
   		List<HashMap<String ,String>> list = jt.find("select * from gift ");
   		if(list != null & list.size() > 0){
   			for(HashMap<String,String> map : list){
 		%>
 		
 			 <option value="<%=map.get("id")%>"><%=map.get("name")%></option>
 		<%
 		   }
   		}
		   %>
      </select>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">所需积分</label>
    <div class="layui-input-inline">
      <input type="number" name="price" lay-verify="required" autocomplete="off" placeholder="请输入" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">备注</label>
    <div class="layui-input-inline">
      <input type="text" name="remark" autocomplete="off" placeholder="请输入" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
  </form>
  <script>
  layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  
  //日期
  laydate.render({
    elem: '#date'
  });
  laydate.render({
    elem: '#date1'
  });
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
 
  //自定义验证规则
  form.verify({
    title: function(value){
      if(value.length < 5){
        return '标题至少得5个字符啊';
      }
    }
    ,pass: [
      /^[\S]{6,12}$/
      ,'密码必须6到12位，且不能出现空格'
    ]
    ,content: function(value){
      layedit.sync(editIndex);
    }
  });
  
  //监听指定开关
  form.on('switch(switchTest)', function(data){
    layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
      offset: '6px'
    });
    layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
  });
  
  //监听提交
  form.on('submit(demo1)', function(data){
	  var type = (data.field.type);
	  var remark = (data.field.remark);
	  var price = (data.field.price);
	  //开始请求后台
      var req = new XMLHttpRequest();
      req.open("post" ,"/addRole" , true);
      req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
      req.send("type="+type+"&remark="+remark+"&price="+price+"&remark="+remark);
      req.onreadystatechange = function(){
      	if(req.readyState == 4){
      		if(req.responseText == 'true'){
      			parent.layer.closeAll(); 
      			window.parent.location.reload();
      		}else{
      			alert('添加失败，该商品可能已经设置了兑换规则!');
      		}
      	}	
      }
    /* layer.alert(JSON.stringify(data.field), {
      title: '最终的提交信息'
    }) */
    return false;
  });
 
  //表单初始赋值
  form.val('example', {
    "username": "贤心" // "name": "value"
    ,"password": "123456"
    ,"interest": 1
    ,"like[write]": true //复选框选中状态
    ,"close": true //开关状态
    ,"sex": "女"
    ,"desc": "我爱 layui"
  })
  
  
});
</script>
  </body>
  </html>
  