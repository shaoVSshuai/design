jQuery.extend( {
	/**
	 * 将JSON格式的数据填充到Form
	 * 
	 * @param {Object}
	 *            data：需要填充的数据，JSON格式；例如：{key1 : value1, key2 : value2, key3 : value3}；
	 * 
	 * @param {Object}
	 *            form：需要填充的form id；
	 */
	json2form : function(data, form,splitTag) {
		// 填充Form；
		jQuery("#" + form).find("input,select,textarea,label").each(function() {
			var obj = jQuery(this);
			switch (this.tagName.toLowerCase()) {
			case "input":
				var a = this.type;
				switch (this.type.toLowerCase()) {
				case "radio":
					var eleName = obj.attr("name");
					if(data[eleName]!=undefined&&(obj.val()==data[eleName])){
						obj.attr("checked", true);
					} else{
						obj.attr("checked", false);
					}
					break;
				case "checkbox":
					var eleName = obj.attr("name");
					if(data[eleName]!=undefined){
						var arr = data[eleName].split(splitTag?splitTag:',');
						for (var i = 0; i < arr.length; i++) {
							if (obj.val() == arr[i]) {
								obj.attr("checked", "checked");
							}
						}
					} else{
						obj.attr("checked", false);
					}
					break;
				case "text":
					if ((jQuery(this).attr("class"))&&(jQuery(this).attr("class").indexOf('combobox-f') > -1) && jQuery(this).attr("comboname")) {
						var eleName = obj.attr("comboname");
						var values="";
						if(data[eleName]!=undefined){
							values = String(data[eleName]).split(",");
							var comboId=jQuery(this).attr("id");
							$('#' + jQuery(this).attr("id")).combobox('setValues', values);
						}
						/** 2014-03-31 scy 级联元素管理 add **/
						var cid = $('#' + this.id).combobox("options").cid;
						var reloadURL = $('#' + this.id).combobox("options").reloadURL;
						if(cid){
							var codeType = $('#' + this.id).combobox("options").codeType;
							$('#' + cid).combobox('reload', basePath + '/codeByType.action?codeType='+codeType+"_"+values);
						}
						/** 2014-03-31 scy 级联元素管理 end **/	
						break;
					}
					else if((jQuery(this).attr("class"))&&(jQuery(this).attr("class").indexOf('easyui-combotree') > -1) && jQuery(this).attr("comboname")){
						var eleName = obj.attr("comboname");
						var values = "";
						if(data[eleName]!=undefined){
							values = String(data[eleName]).split(",");
						}
						$('#' + this.id).combotree('setValues', values);
						break;
					}
				case "hidden":
					
					var cssClass = jQuery(this).attr("class");
					if (!(cssClass&&(cssClass.indexOf('combo-text')>-1))){//为非combo-text的hidden或text赋值
						if(this.id != '' && data[this.id]!=undefined){
							var value = data[this.id];
							obj.val(value);
						}
						break;
					} 
					break;
				}
				break;
			case "select":
				var id = obj.attr("id");
				if(data[id]!=undefined){
					var arr = data[id].split(',');
					obj.children().each(function() {
						for (var i = 0; i < arr.length; i++) {
							if (jQuery(this).val() == arr[i]) {
								this.selected = true;
							}
						}
					});
				}
				break;
			case "textarea":
				var id = obj.attr("id");
				if(data[id]!=undefined){
					obj.text(data[id]);
				}
				break;
			case "label":
				var id = obj.attr("id");
				if(data[id]!=undefined){
					obj.html(data[id]);
				}
				break;
			}
		});
	},
	
	hiddeNullElE : function(form) {
		// 填充Form
		jQuery("#" + form).find("input,select,textarea").each(function() {
			var obj = jQuery(this);
			var eleType = obj.attr("type");
			if(eleType!="hidden"){
				var eleVal = obj.val();
				if(eleVal==""||eleVal==null){
					obj.parent().parent().hide();
				}
			}
			
				
		});
	},
	
	/**
	 * 将Form中的element封装为JSON格式，返回格式为{data : '{key1 : value1, key2 : value2, key3 : value3}'}
	 * 
	 * @param {Object}
	 *            form：提交数据的form id；
	 * 
	 * @param {Object}
	 *            data：需补充的数据，JSON格式；
	 * 
	 * @param {Object}
	 *            symbol：多选下拉框、checkBox分隔符；
	 *            
	 * @param {Object}
	 *            blacklist：黑名单，不被组装的element；        
	 */
	form2json : function(form, jsondata, symbol, blacklist) {
		var obj = new Object();
		if (isEmpty(symbol)) {
			symbol = "";
		}
		if (isNotEmpty(form)) {
			var formEle = new Map();
			// 将表单元素 构建为map<String,Array> key eleName, value eleValue数组
			var elements = null;
			if(form instanceof Object){
				elements = jQuery(form).formToArray();
			}else{
				elements = jQuery("#" + form).formToArray();
			}
			for (var i = 0; i < elements.length; i++) {
				if (formEle.containsKey(elements[i].name)) {
					formEle.get(elements[i].name).push(elements[i].value);
				} else if (!inArray(blacklist,elements[i].name)) {
					var dataArray = new Array();
					dataArray[0] = elements[i].value;
					formEle.put(elements[i].name, dataArray);
				}
			}
			
			jQuery(".easyui-combotree").each(function() {
				var selOption = jQuery("#"+this.id).combotree('tree').tree('getSelected');
				if(selOption==null || selOption.id == ""){
					var allchild = jQuery("#"+this.id).combotree('tree').tree('getChildren');
					var value = new Array();
					for(var i = 0,j = 0; i < allchild.length; i++){
						if(allchild[i].id != null && allchild[i].id != ""){
							value[j] = allchild[i].id;
							j++;
						}
					}
					formEle.put(jQuery(this).attr("comboname"), value);
				}
			});
			
			// 构造json格式字符串
			for (var i = 0; i < formEle.array.length; i++) {
				var ele = formEle.array[i];
				var eleName = ele.key;
				var eleValue = "";
				if(ele.value.length == 1){
					eleValue += ele.value[0] + ",";
				} else{
					for (var j = 0; j < ele.value.length; j++) {
						eleValue += symbol + ele.value[j] + symbol + ",";
					}
				}
				if (eleValue.length > 0) {
					eleValue = eleValue.substring(0, eleValue.length - 1);// replace(/a/g,b)
				}
				//formString += '"' + eleName + '":"' + eleValue + '",';
				eval("obj."+eleName+"=\""+eleValue+"\"");
			}

		}

		if (isNotEmpty(jsondata)) {
			for(var param in jsondata){
				eval("obj."+param+"=\""+jsondata[param]+"\"");
			}
		}
		return {data:obj};

	},

	/**
	 * AJAX请求
	 * 
	 * @param {String}
	 *            url：表单提交的url；
	 *            
	 * @param {Object}
	 *            reqdata：表单提交的数据；json格式，第一层为json字符串，例如：{data : '{key1 : value1, key2 : value2, key3 : value3}'}；
	 *            
	 * @param {Object}
	 *            sucesscallback：成功的回调函数；
	 *            
	 * @param {Object}
	 *            completecallback：完成的回调函数；
	 *            
	 * @param {Object}
	 *            dataType：从服务器端返回的数据类型；
	 *            
	 * @param {Object}
	 *            timeout：超时时间；毫秒；
	 *            
	 * @param {Object}
	 *            async：是否同步；缺省为异步；
	 *            
	 * @param {Object}
	 *            errorcallback：失败的回调函数；
	 *            
	 * @param {Object}
	 *            requestType：request请求方式；缺省为：POST；
	 */
	tgajax : function(url, reqdata, sucesscallback, completecallback, dataType, timeout, async, errorcallback, requestType) {
		jQuery.ajax( {
			url : url,
			data : reqdata,
			dataType : isNotEmpty(dataType) ? dataType : 'json',
			timeout : timeout,
			async : isNotEmpty(async) ? async : true,
			type : isNotEmpty(requestType) ? requestType : 'POST',
			success : sucesscallback,
			error : errorcallback
					|| function(XMLHttpRequest, textStatus, errorThrown) {
						// 根据返回的数据格式，统一提示错误信息
						showMessage(XMLHttpRequest.responseText);
					},
			complete : completecallback
		});
	},
	
	/**
	 * GRID请求
	 * 
	 * @param {String}
	 *            gridID：gridID,目标tableID；
	 * 
	 * @param {String}
	 *            url：获取数据url；
	 * 
	 * @param {Array}
	 *            columns：字段数组；
	 * 
	 * @param {Object}
	 *            queryParams：查询参数;
	 * 
	 * @param {int}
	 *            pageSize：分页单位，默认15;
	 * 
	 * @param {Object}
	 *            otherParam：其他Grid参数；
	 */
	tgrid : function(gridID, url, columns, queryParams, pageSize, otherParam) {
		var gridParam = {
			rownumbers:true,
			loadMsg : "数据加载中",
			pagination : true,
			multiSort : true,
		    'pageSize' : isNotEmpty(pageSize) ? pageSize : 15,
			pageList : [ isNotEmpty(pageSize) ? pageSize : 15, 20, 30, 50, 100],
			striped : true,
			columns : columns,
			queryParams : queryParams,
			url:url
		};
		if(url){
			gridParam.url = basePath+url;
		}
		if (otherParam) {
			for (var key in otherParam) {
				eval("gridParam." + key + " = otherParam." + key);
			}
		}
		$('#' + gridID).datagrid(gridParam);
		$('#' + gridID).datagrid("getPager").pagination( {
			"pageSize" : isNotEmpty(pageSize) ? pageSize : 15,
			displayMsg : '当前数据范围 {from} 到 {to} ，共 {total} 条记录',
			beforePageText : '当前',
			afterPageText : '&nbsp; ,共 {pages}页'
		});
	},
	
	/**
	 * 重新加载Grid数据
	 * 
	 * @param {String} 
	 *            gridID：gridID,目标tableID;
	 * 
	 * @param {String}
	 *            url：获取数据url;
	 * 
	 * @param {String}
	 *            queryParams：查询参数;
	 */
	tgridLoad : function(gridID, url, queryParams) {
		$('#'+gridID).datagrid("options").url=basePath+url;
		$('#'+gridID).datagrid('load',queryParams);
	}
	
});
