package com.hzyc.intstudio.tags;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.springframework.web.util.UrlPathHelper;

/**
 * 取绝对路径的标签
 * 
 */
public class LocaleResourceTag extends TagSupport {
	private static final long serialVersionUID = 9062516200891119980L;

	private static final String PATH_DELIMITER = "/";

	private String uri;

	private UrlPathHelper urlPathHelper;

	public LocaleResourceTag() {
		this.urlPathHelper = new UrlPathHelper();
		this.init();
	}

	/**
	 * 取绝对路径，并规范路径格式
	 */
	public int doStartTag() throws JspException {
		try {
			String realuri = this.uri;
			String contextPath = this.getContextPath();
			if (!realuri.startsWith(PATH_DELIMITER)) {
				realuri = PATH_DELIMITER + realuri;
			}
			if (contextPath.endsWith(PATH_DELIMITER)) {
				contextPath = contextPath.substring(0, contextPath.length() - 1);
			}
			super.pageContext.getOut().print(contextPath + realuri);

		} catch (IOException e) {
			throw new JspException(e);
		}

		return SKIP_BODY;
	}

	

	protected String getContextPath() {
		HttpServletRequest request = (HttpServletRequest) super.pageContext.getRequest();
		return this.urlPathHelper.getContextPath(request);
	}

	private void init() {
		this.uri = null;
	}

	public void release() {
		super.release();
		this.init();
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

}
