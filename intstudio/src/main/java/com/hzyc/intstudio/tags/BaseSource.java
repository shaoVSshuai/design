package com.hzyc.intstudio.tags;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;


public class BaseSource extends TagSupport {

	private static final long serialVersionUID = 3997694429516547317L;

	@Override
	public int doEndTag() throws JspException {
		
		try {
			String basePath = ((HttpServletRequest)this.pageContext.getRequest()).getContextPath();
			JspWriter out=this.pageContext.getOut();
			out.print("<script type=\"text/javascript\">var basePath = '"+basePath+"';</script>\r\n");			
			out.print("<meta http-equiv=\"pragma\" content=\"no-cache\" />\r\n");
			out.print("<meta http-equiv=\"cache-control\" content=\"no-cache\" />\r\n");
			out.print("<meta http-equiv=\"expires\" content=\"0\" />\r\n");
			out.print("<link type=\"text/css\" href=\"" + basePath + "/common/jquery/easyui/css/metro-gray/easyui.css\"  rel=\"stylesheet\" charset='UTF-8'>\r\n");
			out.print("<link type=\"text/css\" href=\"" + basePath + "/common/jquery/easyui/css/icon.css\" rel=\"stylesheet\" charset='UTF-8'>\r\n");
			out.print("<link type=\"text/css\" href=\"" + basePath + "/common/css/bfw-css.css\" rel=\"stylesheet\" charset='UTF-8'>\r\n");
			out.print("<script language=\"javascript\" src=\"" + basePath + "/common/jquery/core/jquery-1.11.1.js\"></script>\r\n");
			out.print("<script language=\"javascript\" src=\"" + basePath + "/common/jquery/core/jquery.form.js\"></script>\r\n");
			out.print("<script language=\"javascript\" src=\"" + basePath + "/common/jquery/easyui/js/jquery.easyui.min.js\"></script>\r\n");
			out.print("<script language=\"javascript\" src=\"" + basePath + "/common/tangram/js/common/json2.js\"></script>\r\n");
			out.print("<script language=\"javascript\" src=\"" + basePath + "/common/tangram/js/common/ajax.js\"></script>\r\n");
			out.print("<script language=\"javascript\" src=\"" + basePath + "/common/tangram/js/common/code.js\"></script>\r\n");
			out.print("<script language=\"javascript\" src=\"" + basePath + "/common/tangram/js/common/element.js\"></script>\r\n");
			out.print("<script language=\"javascript\" src=\"" + basePath + "/common/tangram/js/common/util.js\"></script>\r\n");
			out.print("<script language=\"javascript\" src=\"" + basePath + "/common/tangram/js/common/validate.js\"></script>\r\n");
			out.print("<script language=\"javascript\" src=\"" + basePath + "/common/tangram/js/common/collection.js\"></script>\r\n");
			out.print("<script language=\"javascript\" src=\"" + basePath + "/common/calendar/WdatePicker.js\"></script>\r\n");
			out.print("<script language=\"javascript\" src=\"" + basePath + "/common/js/common.js\"></script>\r\n");
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} 
        
		return EVAL_PAGE;
	}
}
