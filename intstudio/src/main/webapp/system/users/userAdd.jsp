<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tlds/framework.tld" prefix="f"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String updateId = request.getParameter("id");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="chrome=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" type="text/css" href="../common/easyui/themes/gray/easyui.css" />
<link rel="stylesheet" type="text/css" href="../common/easyui/themes/icon.css" />
<script type="text/javascript" src="../common/jquery.min.js"></script>
<script type="text/javascript" src="../common/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../common/jquery.form.js"></script>
<script type="text/javascript" src="../common/collection.js"></script>
<script type="text/javascript" src="../common/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../common/element.js"></script>
<script type="text/javascript" src="../common/util.js"></script>
<script type="text/javascript" src="../common/validate.js"></script>
<script type="text/javascript" src="../common/ajax.js"></script>
<script type="text/javascript">
var basePath = "<%=path%>";


function formSave(){
	if(checkForms()){
		var updateParam = jQuery.form2json("updateForm", null, "'", null).data;
		$.ajax({
			url: basePath+"/system/users/add",
			type : "POST",
			dataType : "json",
			data : updateParam, //将Json对象序列化成Json字符串，toJSON()需要引用jquery.json.min.js
			success : function(res) {
				if(res.data==1){
					tgInfo("添加成功", function (){
						window.open(basePath + "/system/users/userList.jsp", "content");
					});
				}else{
					tgError("添加失败",function(){
						window.open(basePath + "/system/users/userList.jsp", "content");
					});
				}
				
			},
			error : function(res) {
				document.write(res.responseText);
			}
		});
	}
}
</script>
<title>新增用户信息</title>
</head>
<body>
	<div class="easyui-panel" title="新增用户信息" style="width: 96%">
		<form id="updateForm" method="post">
			<table width="100%">
				<colgroup>
					<col width="30%" />
					<col width="70%" />
				</colgroup>
				<tbody>
					<tr>
						<th>用户名</th>
						<td>
							<input type="text" name="userName" id="userName" />
						</td>
					</tr>
					<tr>
						<th>密码</th>
						<td>
							<input type="password" name="pwd" id="pwd" />
						</td>
					</tr>
					<tr>
						<th>确认密码</th>
						<td>
							<input type="password" name="qrpwd" id="qrpwd" />
						</td>
					</tr>
					<tr>
						<th>出生日期</th>
						<td>
							<input type="text" name="birthday" id="birthday" class="Wdate"
							onclick="WdatePicker({el:this,startDate:'%y-%M-01',dateFmt:'yyyy-MM-dd'})" />
						</td>
					</tr>
					<tr>
						<th>性别</th>
						<td><f:box codeType="sex" id="sex" name="sex" type="radio"/></td>
					</tr>
					<tr>
						<th colspan="2"><input type="button" value="新增" onclick="formSave()"/></th>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>
