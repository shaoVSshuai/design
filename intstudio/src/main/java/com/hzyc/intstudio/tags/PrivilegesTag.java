package com.hzyc.intstudio.tags;
/*package com.hzyc.intstudio.tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.springframework.web.context.support.WebApplicationContextUtils;


public class PrivilegesTag extends BodyTagSupport{

	private static final long serialVersionUID = 8585060170916517880L;
	
	private int pid;

	public int  doEndTag()throws JspException {
		pageContext.getSession();
		
		try{
			PrivilegesService ps= WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext()).getBean(PrivilegesService.class);
			MastersPO masterPo=(MastersPO)pageContext.getSession().getAttribute("user");
			JspWriter jw = pageContext.getOut();
			boolean res =ps.validatePrivilege(pid, masterPo.getUserid());
			if(masterPo!=null&&res){
				jw.write(getBodyContent().getString());
			}else{
				jw.write("");
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}
	 
	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}
	
}
*/