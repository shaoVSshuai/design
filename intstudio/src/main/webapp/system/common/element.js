jQuery(function() {
	// 禁用键盘
	document.onkeydown = function(event) {
		var event = (event) ? event : ((window.event) ? window.event : "");
		var key = event.keyCode ? event.keyCode : event.which;
		var srcElement = event.srcElement ? event.srcElement : event.target;

		if (// disable Backspace
			((key == 8) && ((srcElement.type != "text" && srcElement.type != "textarea" && srcElement.type != "password" && srcElement.type != "file") || srcElement.readOnly == true))
			// disable ALT+<-,ALT+->
			|| ((event.altKey) && (key == 37 || key == 39))
			// disable Ctrl+N,Ctrl+R,Ctrl+F4
			|| ((event.ctrlKey) && ((key == 78) || (key == 82) || (key == 115)))
			// disable shift+F10
			|| ((event.shiftKey) && (key == 121))
			// disable F5
			|| (key == 116)
			// disable F11
			|| (key == 122)) {
			event.keyCode = 0;
			event.returnValue = false;
		}
	};
});

/**
 * 展示信息
 * 
 * @param message
 */
function showMessage(message) {
	getDialog("/common/tangram/jsp/common/blank.jsp", "0", message);
};

/**
 * 将所有页面元素设置为只读
 * 
 * @param whiteList：
 *            一组不设置的元素；元素name之间逗号分隔；
 */
function readOnlyAll(whiteList) {
	window.focus();
	jQuery("input,select,textarea,img").each(function() {
		var element = jQuery(this);
		var id = element.attr('id');
		var name = element.attr('name');
		if (element.is('input')) {
			if ((isNotEmpty(element.attr("class")) && element.attr("class").indexOf('easyui-combobox') > -1) && this.comboname && !isContain(whiteList, this.comboname)) {
				$('#' + this.comboname).combobox('readonly', true);
				return;
			}
			if((isNotEmpty(element.attr("class")) && element.attr("class").indexOf('easyui-combotree') > -1) && this.comboname && !isContain(whiteList, this.comboname)){
				$('#' + this.comboname).combotree('readonly', true);
				return;
			}
			
			switch (element.attr("type").toLowerCase()) {
			case "radio":
				
			case "checkbox":
				if (!isContain(whiteList, name)) {
					element.attr('disabled', 'true');
				}
				break;
			default:
				if (!isContain(whiteList, id)) {
					element.attr('readonly', 'true');
					element.attr('onclick', '');
				}
			}
			
			return;
		}
		
		if (element.is('textarea')) {
			if (!isContain(whiteList, id)) {
				element.attr('readonly', 'true');
			}
			return;
		}
		
		if (element.is('img')) {
			if (!isContain(whiteList, id)) {
				element.attr('onclick', "");
			}
			return;
		}
		
		if (element.is('select')) {
			if((isNotEmpty(element.attr("class")) && element.attr("class").indexOf('easyui-combotree') > -1) && this.comboname && !isContain(whiteList, this.comboname)){
				$('#' + this.comboname).combotree('readonly', true);
				return;
			}
		}
		
		if (!isContain(whiteList, id)) {
			element.attr('readonly', 'true');
		}
		
	});
};


function readOnlyByNames(nameList) {
	var nameArray = nameList.split(",");
	for(var i = 0; i < nameArray.length; i++){
		$("input[name='"+nameArray[i]+"']").attr("readonly", 'true');
		$("select[name='"+nameArray[i]+"']").attr("readonly", 'true');
		$("textarea[name='"+nameArray[i]+"']").attr("readonly", 'true');
		var comboEle = $('#' + this.comboname);
		if(comboEle){
			comboEle.combobox('readonly', true);
		}
	}
};


/**
 * 屏幕锁定
 * 
 * @param message
 */
function lockScreen(message) {
	if (isEmpty(message)) {
		message = "加载";
	}
	var info = '';
	var p = document.createElement("DIV");
	if (!info)
		info = '';
	p.id = "CoverDiv";
	p.style.position = "absolute";
	p.style.width = document.body.scrollWidth;
	p.style.height = (document.body.offsetHeight > document.body.scrollHeight) ? '100%'
			: document.body.scrollHeight + 20;
	p.style.zIndex = '998';
	p.style.top = '0px';
	p.style.left = '0%';
	p.style.backgroundColor = "gray";
	p.style.opacity = '0.5';
	p.style.filter = "alpha(opacity=0)";

	var ifrm = document.createElement("iframe");
	ifrm.src = "javascript:false";
	ifrm.height = "100%";
	ifrm.width = "100%";
	ifrm.style.cssText = "border:1px red;position:absolute;visibility:inherit;top:0px;left:0px;z-index:-1;filter:'progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=80)'";
	p.appendChild(ifrm);

	document.body.appendChild(p);
	var p1 = document.createElement("DIV");
	var top = parseInt(parseInt(screen.height) * 0.15) + document.body.scrollTop;
	p1.style.position = "absolute";
	p1.style.width = "300px";
	p1.id = "CoverDiv1";
	var left = Math.ceil(((document.body.scrollWidth) - parseInt(p1.style.width.replace('px', ''))) / 2)
			+ document.body.scrollLeft;
	p1.style.height = "200px";
	p1.style.zIndex = '999';
	p1.style.top = top + 'px';
	p1.style.left = left + 'px';
	p1.style.border = "0px solid red";
	var html = "";
	html += "<center>"
	html += "<div  style='width:210px; height:70px;background-color:#ededed;filter: Alpha(Opacity=80);z-index:20;border-left: 1px solid #b7b7b7;border-right: 1px solid #b7b7b7;border-bottom: 1px solid #b7b7b7;border-top: 1px solid #b7b7b7;'>";
	html += "<table width='100%' height='100%'><tr><td align='center' valign='middle' >";
	html += "<font style='FONT-SIZE: 12px; COLOR: #333'>" + message
			+ "</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src='" + basePath + "/common/cms/image/loading.gif'/>";
	html += "</td></tr></table>";
	html += "</div>"
	html += "</center>"

	document.body.appendChild(p1);
	p1.innerHTML = html;
};

/**
 * 屏幕解锁
 * 
 * @param message
 */
function unlockScreen() {
	if (null != document.getElementById('CoverDiv')) {
		document.body.removeChild(document.getElementById('CoverDiv'));
	}
	if (null != document.getElementById('CoverDiv1')) {
		document.body.removeChild(document.getElementById('CoverDiv1'));
	}
};

/**
 * 根据name获取被选中的复选框的个数
 * 
 * @param name
 * @returns
 */
function getCheckBoxSizeByName(name) {
	return (jQuery(":checked[name='" + name + "']")).size();
};

/**
 * 根据name获取被选中的复选框的值，值之间以","相隔
 * 
 * @param name
 * @param symbol
 * @returns
 */
function getCheckBoxValByName(name, symbol) {
	if (symbol == undefined)
		symbol = '';

	var elementCheckbox = "";
	jQuery(":checked[name='" + name + "']").each(function() {
		elementCheckbox += "," + symbol + jQuery(this).val() + symbol;
	});
	elementCheckbox = elementCheckbox.substring(1);
	
	return isEmpty(elementCheckbox) ? symbol + symbol : elementCheckbox;
};

/**
 * 根据name为复选框复制，值之间以","相隔
 * 
 * @param name
 * @param value
 * @param symbol
 * @returns
 */
function setCheckBoxValByName(name, value, symbol) {
	if (isNotEmpty(symbol)){
		value = value.replace(eval('/' + symbol + '/g'), '');
	}
	
	var values = value.split(',');
	for (var i = 0; i < values.length; i++) {
		jQuery("[name='" + name + "']").each(function() {
			if (this.value == values[i]) {
				this.checked = "checked";
				return false;
			}
		});
	}
};

/**
 * 根据name获取被选中的单选框的个数
 * 
 * @param name
 * @returns
 */
function getRadioSizeByName(name) {
	return (jQuery(":checked[name='" + name + "']")).size();
};

/**
 * 根据name获取被选中的单选框的值
 * 
 * @param name
 * @param symbol
 * @returns
 */
function getRadioValByName(name, symbol) {
	if (symbol == undefined)
		symbol = '';

	var elementRadio = jQuery(":checked[name='" + name + "']").val();
	
	return isEmpty(elementRadio) ? (symbol + symbol) : (symbol + elementRadio + symbol);
};

/**
 * 根据name为单选框赋值
 * 
 * @param name
 * @param value
 * @param symbol
 * @returns
 */
function setRadioValByName(name, value, symbol) {
	if (isNotEmpty(symbol)){
		value = value.replace(eval('/' + symbol + '/g'), '');
	}
	jQuery("[name='" + name + "']").each(function() {
		if (this.value == value) {
			this.checked = "checked";
		}else{
			this.checked = "";
		}
	});
};

/**
 * 禁用所有按钮
 * 
 * @param whiteList：
 *            一组不禁用的按钮；按钮id之间逗号分隔；
 */
function disableAllButton(whiteList) {
	jQuery("input").each(function() {
		if (isContain(whiteList, this.id)) return;
		
		var type = this.type.toLowerCase();
		if (type == 'button' || type == 'reset') {
			if (this.disabled == true) {
				this.isdisabled = false;
			} else {
				this.isdisabled = true;
				this.disabled = true;
			}
		}
	});
	
	jQuery("a").each(function() {
		if (isContain(whiteList, this.id)) return;
		
		if (jQuery(this).attr("class").indexOf("easyui-linkbutton") > -1) {
			if ($('#' + this.id).linkbutton('options').disabled == true) {
				this.isdisabled = false;
			} else {
				this.isdisabled = true;
				$('#' + this.id).linkbutton('disable');
			}
		}
	});
};

/**
 * 启用disableAllButton方法所禁用的所有按钮
 * 
 * @param whiteList：
 *            一组不启用的按钮；按钮id之间逗号分隔；
 */
function enableAllButton(whiteList) {
	jQuery("input").each(function() {
		if (isContain(whiteList, this.id)) return;
		
		var type = this.type.toLowerCase();
		if (type == 'button' || type == 'reset') {
			if (this.isdisabled ==  true) {
				this.disabled = false;
			}
		}
	});
	
	jQuery("a").each(function() {
		if (isContain(whiteList, this.id)) return;
		
		if (jQuery(this).attr("class")&&jQuery(this).attr("class").indexOf("easyui-linkbutton") > -1) {
			if (this.isdisabled == true) {
				$('#' + this.id).linkbutton('enable');
			}
		}
	});
};

//把某个div合起来或展开
function hideshow(which,img,path,isClosed) {
	if(path == undefined) {
		path = "../../";
	}
	if (!document.getElementById|document.all) {
		return;
	}
	else {
		if (document.getElementById) {
			oWhich = eval ("document.getElementById('" + which + "')");
		} else {
			oWhich = eval ("document.all." + which);
		}
	}

	window.focus();
	if(oWhich != null) {
		if (isClosed || oWhich.style.display=="none") {
			oWhich.style.display="";
			if(img!=undefined)
				img.src=path + "/images/icon/07-0.gif";
		}
		else {
			oWhich.style.display="none";
			if(img!=undefined)img.src=path + "/images/icon/07.gif";
		}		
	}
}


//把所有div合起来或展开
function hideshowAll()
{
	var div_s = document.getElementsByTagName("DIV"); 
	var flag;
	flag = true;
	var isClosed; // 是否是关闭的
	for(var i=0;i<div_s.length;i++)
	{
		var sId = div_s[i].id;
		if(sId.indexOf("ccParent") != -1 )
		{
			var sChildId = "ccChild" + sId.substr("ccParent".length);
			var imgs = div_s[i].getElementsByTagName("IMG"); 
			if(imgs.length !=1) continue;
			var img_src = imgs[0].src;
			if(flag) // 检查第一个的状态
			{
				isClosed = (img_src.indexOf("07-0.gif") == -1);
				flag = !flag;
			}
			hideshow(sChildId,imgs[0],isClosed);
		}
	}
}


/**
 * Message
 * 
 * @param msg
 * @return
 */
function tgMessage(msg) {
	$.messager.alert("消息", msg);
};

/**
 * Info
 * 
 * @param msg
 * @return
 */
function tgInfo(msg, fn) {
	$.messager.alert("信息", msg, 'info', fn);
};

/**
 * Warning
 * 
 * @param msg
 * @return
 */
function tgWarning(msg, fn) {
	$.messager.alert("警告", msg, 'warning', fn);
};

/**
 * Error
 * 
 * @param msg
 * @return
 */
function tgError(msg, fn) {
	$.messager.alert("错误", msg, 'error', fn);
};

/**
 * Question
 * 
 * @param msg
 * @return
 */
function tgQuestion(msg, fn) {
	$.messager.alert("问题", msg, 'question', fn);
};

/**
 * Confirm
 * 
 * @param msg
 * @param fun
 * @return
 */
function tgConfirm(msg, fn) {
	jQuery.messager.confirm("请选择", msg, function(r){
		fn(r);
	});
};

/**
 * 设置Table单双行样式
 * 
 * @param tableId
 */
function initTableStyle(tableId) {
	jQuery("#" + tableId + " tr").each(function(index) {
		if (index%2 == 0) {
			jQuery(this).addClass('even');
		} else {
			jQuery(this).addClass('odd');
		}
	});
};


/**
 * 计算列宽度
 * 
 * @param percent 占整个宽度的百分比
 * @return
 */
function getColumnWidth(percent) {
	return (document.body.clientWidth * 0.95) * percent;
}


function fixScreen(flag){
	var width = $("#ccParent1").width();
	var tables = ($("#ccChild1").find("table"));
	var table = tables[tables.length-2];
	if(flag == 0){
		$(table).datagrid("resize",{
			width:width+168
		});
	}else{
		$(table).datagrid("resize",{
			width:width-200
		});
	}
}