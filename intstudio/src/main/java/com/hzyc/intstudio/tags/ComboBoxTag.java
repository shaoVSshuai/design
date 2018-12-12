package com.hzyc.intstudio.tags;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;

import org.springframework.util.StringUtils;


/**
 * Program Name：下拉框
 * Description：码表标签下拉框
 * @author SCY
 * Written Date: @2014-2-25下午01:26:52
 * version 1.0
 * Modified By：SCY 增加过滤列表
 * Modified Date：@2014-3-31上午10:05:00
 */
public class ComboBoxTag extends AbstractTag  {

	private static final long serialVersionUID = 7369790216465789110L;
	private boolean multiple;
	private String headerKey;
	private String headerValue;
	private String valueField = "dictCode";
	private String textField = "dictName";
	private String cid;
	private String width = "200"; 
	private boolean editable = true;
	private String validate;
	private String inputName;
	
	public int doEndTag() throws JspException {
		try {
			JspWriter out=this.pageContext.getOut();
			HttpServletRequest request = (HttpServletRequest)this.pageContext.getRequest();
			String url = request.getContextPath()+"/dict/getDict?dictType="+this.getCodeType();
			if(headerKey!=null&&headerValue!=null){
				url += "&headerKey=" + headerKey + "&headerValue=" + headerValue;
				super.getDynAttributes().put("headerKey", headerKey);
				super.getDynAttributes().put("headerValue", headerValue);
			}
			if(!StringUtils.isEmpty(super.getBlackList())){
				url += "&blackList=" + super.getBlackList();
			}
			if(!StringUtils.isEmpty(super.getWhiteList())){
				url += "&whiteList=" + super.getWhiteList();
			}
			StringBuffer sb = new StringBuffer();
			sb.append("<input class=\"easyui-combobox\" id=\"").append(this.getId()).append("\" name=\"").append(super.getName())
			.append("\"").append(StringUtils.isEmpty(validate)?"":" validate = \""+validate+"\"")
			.append(StringUtils.isEmpty(inputName)?"":" inputName = \""+inputName+"\"")
			.append(" type=\"text\" data-options=\"url:'").append(url).append("', method:'post', valueField:'").append(valueField)
			.append("', textField:'").append(textField).append("', codeType:'").append(this.getCodeType()).append("'");
			if(multiple){
				sb.append(", multiple:true");
			}
			if(!StringUtils.isEmpty(cid)){
				sb.append(", cid:'").append(cid).append("', onSelect:parentChange");
			}
			if(super.getDefaultVal()!=null){
				sb.append(", value:").append(super.getDefaultVal());
			}
			if(editable){//可以输入添加校验方法
				//sb.append(", onChange : validateCodeInput");
			} else {//不可输入设置editable属性
				sb.append(", editable:false");
			}
			sb.append(super.getBaseParamJSON());
			sb.append(", width:'").append(width).append("'\" />");
			out.print(sb.toString());
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}

	public boolean isMultiple() {
		return multiple;
	}

	public void setMultiple(boolean multiple) {
		this.multiple = multiple;
	}

	public String getHeaderKey() {
		return headerKey;
	}

	public void setHeaderKey(String headerKey) {
		this.headerKey = headerKey;
	}

	public String getHeaderValue() {
		return headerValue;
	}

	public void setHeaderValue(String headerValue) {
		this.headerValue = headerValue;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public boolean getEditable() {
		return editable;
	}

	public void setEditable(boolean editable) {
		this.editable = editable;
	}

	public String getValueField() {
		return valueField;
	}

	public void setValueField(String valueField) {
		this.valueField = valueField;
	}

	public String getTextField() {
		return textField;
	}

	public void setTextField(String textField) {
		this.textField = textField;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getValidate() {
		return validate;
	}

	public void setValidate(String validate) {
		this.validate = validate;
	}

	public String getInputName() {
		return inputName;
	}

	public void setInputName(String inputName) {
		this.inputName = inputName;
	}
	
}
