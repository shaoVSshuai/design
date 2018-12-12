/*******************************************************************************
 * 基础函数列表
 ******************************************************************************/
/**
 * 删除首尾空格
 */
function trim(s) {
	return s.replace(/(^\s*)|(\s*$)/g, "");
}

/**
 * 为空
 */
function isEmpty(s) {
	if (s == undefined || s == null || s=='null') {
		return true;
	}

	if (typeof (s) == 'string' && trim(s).length == 0) {
		return true;
	}

	return false;
}

/**
 * 不为空
 */
function isNotEmpty(s) {
	return !isEmpty(s);
}

/**
 * 是否包含
 */
function isContain(srcStr, containStr) {
	if (isEmpty(srcStr)) return false;
	
	var srcVal = srcStr.split(",");
	for(var i = 0; i < srcVal.length; i++){
		if(srcVal[i]==containStr){
			return true;
		}
	}
	
	return false;
}

/**
 * 复制对象
 */
function clone(srcObj) {
	if (typeof(srcObj) != 'object') {
		return srcObj;
	} else {
		var newObj = new Object();
		for (key in srcObj) {
			eval("newObj." + key + " = srcObj." + key);
		}
		
		return newObj;
	}
}

function getSysParam(paramKey){
	var paramValue = "";
	jQuery.tgajax("sysParam.do?cmd=loadSysParamForRAM&paramKey=" + paramKey, null, 
		function(rtndata, textStatus) {
		    paramValue = rtndata.data.paramValue;
	    },null,null,null,false
    );
	return paramValue;
}

function getDict(paramKey){
	var dict = null;
	jQuery.tgajax(basePath+"/dict/getDict?dictType=" + paramKey, null, 
		function(rtndata, textStatus) {
			dict = arrayToMap(rtndata,function(obj){return obj.dictCode}, function(obj){return obj});;
	    },null,null,null,false
    );
	return dict;
}

function getColumnsByFilter(columns,filter){
	var newColumn = new Array();
	if(filter){
		for(var i = 0; i < columns.length; i++){
			var rowColumn = new Array();
			for(var j = 0; j < columns[i].length; j++){
				if(filter(columns[i][j])){
					rowColumn.push(columns[i][j]);
				}
			}
			newColumn[i]=rowColumn;
		}
		return newColumn;
	}
	return columns;
}

function inArray(arrayData,val){
	if(arrayData){
		for(var i = 0; i < arrayData.length; i++){
			if(arrayData[i]==val){
				return true;
			}
		}
	}
	return false;
}

/**
 * 根据对象属性名拷贝值
 * @param fromObj 源对象
 * @param toObj 目标对象
 * @return
 */
function copyValByAttr(fromObj,toObj){
	for(key in fromObj){
		if(fromObj[key]!=undefined&&(toObj[key]!=fromObj[key])){
			toObj[key] = fromObj[key];
		}
	}
}

$.fn.serializeObject = function() {
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		var name = this.name;
		var proper = name.split(".");
		var obj = o;
		for(var i=0;i<proper.length-1;i++){
			if(!obj[proper[i]]){
				obj[proper[i]]= {};
				obj=obj[proper[i]];
			}
		}
		var lastName = proper[proper.length-1];
		if (obj[lastName]) {
			var a = obj[lastName].push;
	        if (!obj[lastName].push) {
	        	obj[lastName] = [obj[lastName]];
	        }
	        obj[lastName].push(this.value || '');  
	    } else {    
	    	obj[lastName] = this.value || '';
	    }
		var x = o;
	});
	return o;
}