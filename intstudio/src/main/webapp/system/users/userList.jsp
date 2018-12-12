<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tlds/framework.tld" prefix="f"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
	/**
	 * 设置按钮
	 */
	var otherParam = {
		collapsible : true,
		idField : "id", // 支持跨页选择
		fitColumns : true,
		onClickRow : function(rowIndex, rowData) {
			if (rowData.fionStuName) {
				tgInfo(rowData.fionStuName);
			}
		},
		toolbar: [{
			iconCls: 'icon-add',
			text: '新增',
			handler: function(){add()}
		},'-',{
			iconCls: 'icon-edit',
			text: '修改',
			handler: function(){update()}
		}]


	};

	var sexDict = getDict("sex");

	/**
	 * 初始化页面
	 */
	jQuery(function() {
		jQuery.tgrid("userList", "/system/users/query", getColumns(), {}, null,otherParam);
	});

	/**
	 * 设置列
	 * 
	 * @return
	 */
	
	function getColumns() {
		return [ [ {
			field : 'id',
			title : '编号',
			checkbox : true
		}, {
			field : 'userName',
			title : '用户名',
			halign : 'center',
			align : 'center',
			sortable : true,
			width : '30%'
		}, {
			field : 'sex',
			title : '性别',
			halign : 'center',
			align : 'center',
			sortable : true,
			width : '20%',
			formatter : function(value, row, index) {
				var dict = sexDict.get(value);
				if (dict) {
					return dict.dictName;
				} else {
					return value;
				}
			}
		}, {
			field : 'birthday',
			title : '出生日期',
			halign : 'center',
			align : 'center',
			sortable : true
		} ] ];
	}

	/**
	 * 查询数据
	 */
	function queryDaily() {
		var queryParam = jQuery.form2json("queryForm", null, "'", null).data;
		jQuery.tgridLoad("userList", "/system/users/query", queryParam);
	}

	/** 
	 *数据审核 
	 */
	function update() {
		var select = $('#userList').datagrid('getSelections');
		if (select.length == 0) {
			tgInfo("请选择要修改的数据");
		} else if(select.length >1){
			tgInfo("只能选择一条数据");
		} else {
			var ids = getCheckBoxValByName("id");
			window.open(basePath + "/system/users/userEdit.jsp?id=" + ids, "content");
		}
	}

	function add() {
		window.open(basePath + "/system/users/userAdd.jsp", "content");
	}
</script>
<title>日报查询</title>
</head>
<body>
	<div class="easyui-panel" title="用户信息查询" style="width: 96%">
		<form id="queryForm" method="post">
			<table width="100%">
				<colgroup>
					<col width="10%" />
					<col width="20%" />
					<col width="10%" />
					<col width="20%" />
					<col width="40%" />
				</colgroup>
				<tbody>
					<tr>
						<th>出生日期开始时间</th>
						<td><input type="text" name="startDate" id="startDate"
							class="Wdate"
							onclick="WdatePicker({el:this,startDate:'%y-%M-01',dateFmt:'yyyy-MM-dd'})" />
						</td>
						<th>出生日期结束时间:</th>
						<td><input type="text" name="endDate" id="endDate"
							class="Wdate"
							onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" /></td>
					</tr>
					<tr>
						<th>姓名</th>
						<td><input type="text" name="userName" /></td>
						<th>性别</th>
						<td><f:comboBox id="sex" name="sex" codeType="sex" multiple="true" /></td>
					</tr>
				</tbody>
			</table>
		</form>
		<div style="text-align: center; padding: 5px">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="queryDaily()" data-options="iconCls:'icon-search'">查询</a>
		</div>
	</div>
	<br />
	<div class="easyui-panel" title="查询结果" style="width: 96%">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			onclick="add()" data-options="iconCls:'icon-add'">新增</a> 
			
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="update()"
			data-options="iconCls:'icon-edit'">修改</a>
		<table width="100%" id="userList">
		</table>
	</div>
</body>
</html>
