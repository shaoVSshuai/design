/*******************************************************************************
 * 有效性校验
 ******************************************************************************/
/**
 * 检查一组form中的元素；如未指定form，则检查所有form中的元素；
 * 
 * forms : 一组form id，使用,分隔；例如：form1,form2,form3
 */
function checkForms(forms) {
	setFromsDefault(forms);
	
	var isSuccess = true;
	if (isEmpty(forms)) {
		forms = 'form';
	} else {
		forms = '#' + forms.replace(/,/g,',#');
	}
	var f = jQuery(forms);
	jQuery(forms).find('*').each(function() {
		if (this.type != "hidden" && this.type != "button" && jQuery(this).attr("validate") != null) {
			if (!check(this)) {
				isSuccess = false;
				// break
				return false;
			}
		}
	});
	
	return isSuccess;
}


/**
 * 电话号码：可以数字、*、#、+
 */
function isPhone2(s, element) {  
	if (s.length == 0) {
		return true;
	}
	
	var patrn=/^(\d|\*|\#|\-|\+){1,22}$/; 
	if (patrn.exec(s)) {
		return true;
	} else {
		writeValidateInfo('请输入有效的电话号码！', element);
		return false;
	}
}

/**
 * 数字或大写字母
 */
function isNumberOrCaps(s, element) {
	if (s.length == 0) {
		return true;
	}
	
	var patrn = /^[A-Z0-9]$/; 
	if (patrn.exec(s)) {
		return true;
	}else{
		writeValidateInfo('请输入有效的数字或大写字母！', element);
		return false;
	}		
}


/**
 * 检查指定元素
 */
function check(element) {
	var value = jQuery(element).val();
	var validate = jQuery(element).attr("validate");
	var validateTemp = validate.split(';');

	for (var i = 0; i < validateTemp.length; i++) {
		if (validateTemp[i].length == 0) {
			continue;
		}
		s = replaceSingleQuote(value);
		//try{
			var scriptCode = "javascript:" + validateTemp[i]; 
			if(validateTemp[i].indexOf("(") < 0 || validateTemp[i].indexOf(")") < 0) {
				scriptCode = "javascript:" + validateTemp[i] + "(s, element)";
			}
			if (!eval(scriptCode)) {  
				return false;
			}
		/*} catch(e) {
			alert(i18n.check_function_exception(validateTemp[i]) + e.message);
			return false;
		}*/
	}
	
	return true;
}

/**
 * 为一组form中的元素设定缺省式样；如未指定form，则为所有form中的元素设定缺省式样；
 * 
 * forms : 一组form id，使用,分隔；例如：form1,form2,form3
 */
function setFromsDefault(forms) {
	if (isEmpty(forms)) {
		forms = 'form';
	} else {
		forms = '#' + forms.replace(/,/g,',#');
	}
	
	jQuery(forms).find('*').each(function() {
		if (this.type != "hidden" && this.type != "button" && jQuery(this).attr("validate") != null) {
			setDefaultStyle(this);
		}
	});
}

/**
 * 为指定元素设定缺省式样
 */
function setDefaultStyle(element) {
	element.style.borderStyle = "";
	element.style.borderColor = "";
	element.style.backgroundColor = "";
}

/**
 * 替换换行回车字符
 */
function replaceSingleQuote(_str) {
	var str = _str;
	str = str.replace('\\','\\u005C');
	str = str.replace('\'','\\u0027');	
	//str = str.replace('(','\\u0028');
	//str = str.replace(')','\\u0029');
	str = str.replace('\"','\\u0022');
	//str = str.replace(';','\\u0038');

	return str;
}

/**
 * 展示校验结果
 */
function writeValidateInfo(info, element) {
    var inputName = jQuery(element).attr("inputName");
	info = inputName + '的输入有误！\n' + info;

	writeValidateInfoAlert(info, element);
}

/**
 * 设置错误式样
 */
function setErrorStyle(element) {
	try{
		element.style.borderStyle="dashed";
		element.style.borderColor="rgb(255, 0, 0)";
		element.style.backgroundColor = "#dfeffc";
		element.focus();
	}catch(e){
		
	}
}

/**
 * 提示校验结果
 */
function writeValidateInfoAlert(info, element) {
	tgInfo(info, function(){setErrorStyle(element);});
}

/*******************************************************************************
 * validate
 ******************************************************************************/
/**
 * 不能为空
 */
function isNotNull(s, element) { 
	if (trim(s).length == 0){
		writeValidateInfo('不能为空或空格！', element);
		return false;
	} else {
		return true;
	}
}

/**
 * 电话号码：可以“+”开头，除数字外，可含有“-”
 */
function isPhone(s, element) {  
	if (s.length == 0) {
		return true;
	}
	
	var patrn=/^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})$/; 
	if (patrn.exec(s)) {
		return true;
	} else {
		writeValidateInfo('请输入有效的电话号码！', element);
		return false;
	}
}

/**
 * 手机号码：必须以数字开头，除数字外，可含有“-”
 */
function isMobile(s, element) {  
	if (s.length == 0) {
		return true;
	}
	
	var patrn=/^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})$/; 
	if (patrn.exec(s)) {
		return true;
	} else {
		writeValidateInfo("请输入有效的手机号码！", element);
		return false;
	}
}

/**
 * 传真号码：可以“+”开头，除数字外，可含有“-”
 */
function isFax(s, element) {  
	if (s.length == 0) {
		return true;
	}
	
	var patrn=/^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})$/; 
	if (patrn.exec(s)) {
		return true;
	} else {
		writeValidateInfo('请输入有效的传真号码！', element);
		return false;
	}
}

/**
 * 邮政编码
 */
function isZipCode(s, element) {  
	if (s.length == 0) {
		return true;
	}
	
	var patrn=/^[a-zA-Z0-9 ]{3,10}$/; 
	if (patrn.exec(s)) {
		return true;
	} else {
		writeValidateInfo('请输入有效的邮政编码！', element);
		return false;
	}
} 

/**
 * 邮箱
 */
function isEmail(s, element) {  
	if (s.length == 0) {
		return true;
	}
	
	var patrn = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;

	if (patrn.exec(s)) {
		return true;
	} else {
		writeValidateInfo ('请输入有效的邮箱！', element);
		return false;
	}
}

/**
 * 身份证(15位或者18位).
 */
function isIdCard(s, element) {
	if (s.length == 0) {
		return true;
	}
	
	var patrn = /^\d{15}(\d{2}[A-Za-z0-9])?$/;
	if (patrn.exec(s)) {
		return true;
	} else {
		writeValidateInfo('请输入有效的身份证！', element);
		return false;
	}
}

/**
 * IP
 */
function isIP(s, element) {
	if (s.length == 0) {
		return true;
	}
	
	var patrn=/^[0-9.]{1,20}$/; 
	if (patrn.exec(s)){
		return true;
	} else {
		writeValidateInfo('请输入有效的IP地址！', element);
		return false;
	}
}

/**
 * 密码
 */
function isPassword(s, element) {
	if (s.length == 0) {
		return true;
	}
	
	var patrn = /^[a-zA-Z0-9]{6,24}$/; 
	if (patrn.exec(s)) {
		return true;
	}else{
		writeValidateInfo('请输入有效的密码！', element);
		return false;
	}		
}

/**
 * 整数
 */
function isInteger(s, element) { 
	if (s.length == 0) {
		return true;
	}
	
	var patrn = /^\d+$/;
	if (patrn.exec(s)) {			
		return true;
	} else {
		writeValidateInfo ('请输入有效的整数！', element);
		return false;
	}
}

/**
 * 数字
 */
function isNumber(s, element) {
	if (s.length == 0) {
		return true;
	}
	
	var patrn = /^\d+(\.\d+)?$/; 
	if (patrn.exec(s)) {			
		return true;
	} else {
		writeValidateInfo ('请输入有效的数字！', element);
		return false;
	}
}

/**
 * 数字或字母
 */
function isNumberOrLetter(s, element) {
	if (s.length == 0) {
		return true;
	}
	
	var patrn = /^(\d|[a-zA-Z])+$/;  
	if (patrn.exec(s)) {
		return true;
	}else{
		writeValidateInfo('请输入有效的数字或字母！', element);
		return false;
	}		
}

/**
 * 全部中文
 */
function isChinese(s, element) { 
	if (s.length == 0) {
		return true;
	}
	
	var patrn = /^[\u4E00-\u9FA5]+$/; 
	if (patrn.exec(s)) {
		return true;
	} else {
		writeValidateInfo('请输入中文！', element);
		return false; 
	}
}

/**
 * 不含中文
 */
function notContainChinese(s, element) {  
	if (s.length == 0) {
		return true;
	}
	
	var patrn = /[\u4E00-\u9FA5]|[\uFE30-\uFFA0]/gi; 
	if (patrn.exec(s)) {
		writeValidateInfo('不能包含中文！', element);
		return false; 
	} else { 
		return true; 
	}
}

/**
 * 不含非法字符（含中文）
 */
function isValidString(s, element) {
	if (s.length == 0) {
		return true;
	}
	var patrn = /^(\d|[０-９a-zA-Zａ-ｚＡ-Ｚ]|[\u4E00-\u9FA5]|[= 　~`!@#$%^&*()_+|{}:\"<>?\-\\\[\];\',.\/｀＄＾＊＿＂＜＞［］＇．／～·！＠＃￥％……＆×（）——＋｜｛｝“”：《》？－＝＼】【；‘’、。，])+$/;
	if(patrn.exec(s)){
		return true;
	}else{
		writeValidateInfo('不能包含非法字符！', element);
        return false;
	}
   /* var patrn = /^[^`~!@#$%^&*|\\\][\]\{\}'\<>?]*$/;
    if (patrn.exec(s)) {
    	return true;
    } else {
    	writeValidateInfo(i18n.can_not_contain_illegal_characters, element);
        return false;
    }*/
}

/**
 * 不含非法字符(不含中文)
 */
function isValidStringEN(s, element) {
	if (s.length == 0) {
		return true;
	}
	var patrn = /^(\d|[０-９a-zA-Zａ-ｚＡ-Ｚ]|[= 　~`!@#$%^&*()_+|{}:\"<>?\-\\\[\];\',.\/｀＄＾＊＿＂＜＞［］＇．／～·！＠＃￥％……＆×（）——＋｜｛｝“”：《》？－＝＼】【；‘’、。，])+$/;
	if(patrn.exec(s)){
		return true;
	}else{
		writeValidateInfo('不能包含非法字符！', element);
        return false;
	}
}	

/**
 * 长度校验
 */
function checkMaxLength(s, element) {
	var len = s.length;
	if (len == 0) {
		return true;
	}
	
	var inputlen = 0;
	for (var i = 0; i < len; i++) {
		if (s.charCodeAt(i) > 255){
			inputlen += 3;
		}else{
			inputlen++;
		}
	}
	
	var maxLength = element.getAttribute("mostLength");
	if (inputlen > maxLength) {
		writeValidateInfo('最多可输入' + maxLength + '个字符，中文按3个计算！', element);
		return false;
	}
	
	return true;
}

/**
 * 长度校验，长度等于x
 */
function checkEquLength(s, element) {
	var len = s.length;
	if (len == 0) {
		return true;
	}
	
	var inputlen = 0;
	for (var i = 0; i < len; i++) {
		if (s.charCodeAt(i) > 255){
			inputlen += 3;
		}else{
			inputlen++;
		}
	}
	
	var maxLength = element.getAttribute("mostLength");
	if (inputlen != maxLength) {
		writeValidateInfo('必须输入' + maxLength + '个字符，中文按3个计算！', element);
		return false;
	}
	
	return true;
}

/**
 * 长度校验X到Y为之间
 */
function checkBetweenLength(s, element){
	var len = s.length;	
	if (len == 0) {
		return true;
	}

	var inputlen = 0;
	for (var i = 0; i < len; i++) {
		if (s.charCodeAt(i) > 255){
			inputlen += 3;
		}else{
			inputlen++;
		}
	}
	
	var maxLength = element.getAttribute("xmax");
	var minLength = element.getAttribute("ymin");
	if (maxLength < inputlen || inputlen < minLength) {
		writeValidateInfo('输入内容应在' + minLength + '-' + maxLength + '个字符之间，中文按3个计算！', element);
		return false;
	}
	
	return true;
} 

/**
 * 普通字符(非html标记)
 */
function isNormalStrOnWeb(s, element) {
	var len = s.length;
	
	if (len == 0) {
		return true;
	}
	
	var firstChar = s.substring(0,1);
	if (firstChar == "<" || firstChar == "\>" || firstChar == " ") {
		writeValidateInfo('不能以<、\>、空格开头！', element);
		return false;
	}

	var isHoldCode = false;
	for (var i = 0; i < len; i++){
		if (s.charCodeAt(i) == 8212 || s.charCodeAt(i) == 183){
			isHoldCode = true;
			break;
		}
	}
	if (isHoldCode){
		writeValidateInfo('不能输入全角字符！', element);
		return false;
	}
	
	if (len > 0){
		if (s.indexOf("\"") > -1){
			writeValidateInfo( '不能输入双引号！', element);
			return false;
		}
		if (s.indexOf("\'") > -1){
			writeValidateInfo('不能输入单引号！', element);
			return false;
		}
		if (s.indexOf("\\") > -1){
			writeValidateInfo('不能输入"\\"！', element);
			return false;
		}
	}
	
	return true;
}

/**
 * 普通字符(非html标记，可以全角)
 */
function isNormalStrOnWeb2(s, element) {
	var len = s.length;
	if (len == 0) {
		return true;
	}
	var firstChar = s.substring(0,1);
	if (firstChar == "<" || firstChar == ">" || firstChar == " ") {
		writeValidateInfo('不能以<、>、空格开头,不能包含\"、\'、\\！！', element);
		return false;
	}
	if(s.search(/"|'|\\/)>-1){
		writeValidateInfo('不能以<、>、空格开头,不能包含\"、\'、\\！！', element);
		return false;
	}
	return true;
}

/**
 * 检查是否输入全角
 * @param str
 * @return
 */
function chkHalf(str,element){
	for(var i=0;i<str.length;i++){
		strCode = str.charCodeAt(i);
		if((strCode>65248)||(strCode==12288)||(strCode==12289)||(strCode==12290)||(strCode==8220)||(strCode==8221)){
			writeValidateInfo("不能输入全角字符", element);
			return false;
		}
	}
	return true;
}

/**
 * 只能上送数字，英文字符，包括"/","-","?",":","(",")",".",",","'","+","{","}"," "，首字符不能出现“：”或“-”，不能出现全角字符。    
 */
function bankFullName(s, element) {
	if (s.length == 0) {
		return true;
	}
	var patrn = /^([0-9a-zA-Z\/?\(\)\.\,\'\+\{\}\ ][0-9a-zA-Z\/\?\(\)\.\,\'\+\{\}\ \-\:]*)$/
	if(patrn.exec(s)){
		return true;
	}else{
		writeValidateInfo("只能输入数字或英文字符，包括/-?:().,'+{}，首字符不能出现“：”或“-”，不能出现全角字符。", element);
        return false;
	}
}	

/**
 * 只能上送数字，英文字符，包括"/","-","?",":","(",")",".",",","'","+","{","}"," "不能出现全角字符。    
 */
function postCode(s, element) {
	if (s.length == 0) {
		return true;
	}
	var patrn = /^([0-9a-zA-Z\/\?\(\)\.\,\'\+\{\}\ \-\:]*)$/
		if(patrn.exec(s)){
			return true;
		}else{
			writeValidateInfo("只能输入数字或英文字符，包括/-?:().,'+{}，不能出现全角字符。", element);
			return false;
		}
}	

/**
 * 去除输入项前后空格
 * @param element 要去除空格的元素对象
 * @return
 */
function trimK(s,element){
	/*if (s.length == 0) {
		return true;
	}
	var val = element.value;
	element.value = jQuery.trim(val);*/
}

/**
 * 全半角不能混输
 * @return
 */
function halfAndFull(s,element){
	var half = 0;
	var full = 0;
	for(var i=0;i<s.length;i++){
		if(half==1&&full==1){
			break;
		}
		strCode = s.charCodeAt(i);
		if(strCode>31&&strCode<255){
			half = 1;
		}else{
			full = 1;
		}
	}
	if(half == 1&&full == 1){
		writeValidateInfo('全半角不能混输！', element);
		return false;
	}else{
		return true;
	}
}

/**
 * 校验配置字符类型
 * @return
 */
function validateConfigString(s,element){
	var bankNO = $('#INSTITUTION').val();
	if('003' == bankNO){
		var half = 0;
		var full = 0;
		for(var i=0;i<s.length;i++){
			if(half==1&&full==1){
				break;
			}
			strCode = s.charCodeAt(i);
			if(strCode>31&&strCode<255){
				half = 1;
			}else{
				full = 1;
			}
		}
		if(half == 1&&full == 1){
			writeValidateInfo('全半角不能混输！', element);
			return false;
		}else{
			return true;
		}
	}else{
		if (s.length == 0) {
			return true;
		}
		var patrn = /^([0-9a-zA-Z\/?\(\)\.\,\'\+\{\}\ ][0-9a-zA-Z\/\?\(\)\.\,\'\+\{\}\ \-\:]*)$/
		if(patrn.exec(s)){
			return true;
		}else{
			writeValidateInfo("只能输入数字或英文字符，包括/-?:().,'+{}，首字符不能出现“：”或“-”，不能出现全角字符。", element);
	        return false;
		}
	}
}

/**
 * 校验配置数字字母类型
 * @return
 */
function validateConfigNumber(s,element){
	var bankNO = $('#INSTITUTION').val();
	if('003' == bankNO){
		var half = 0;
		var full = 0;
		for(var i=0;i<s.length;i++){
			if(half==1&&full==1){
				break;
			}
			strCode = s.charCodeAt(i);
			if(strCode>31&&strCode<255){
				half = 1;
			}else{
				full = 1;
			}
		}
		if(half == 1&&full == 1){
			writeValidateInfo('全半角不能混输！', element);
			return false;
		}else{
			return true;
		}
	}else{
		if (s.length == 0) {
			return true;
		}
		var patrn = /^([0-9a-zA-Z\/\?\(\)\.\,\'\+\{\}\ \-\:]*)$/
			if(patrn.exec(s)){
				return true;
			}else{
				writeValidateInfo("只能输入数字或英文字符，包括/-?:().,'+{}，不能出现全角字符。", element);
				return false;
			}
}
}
