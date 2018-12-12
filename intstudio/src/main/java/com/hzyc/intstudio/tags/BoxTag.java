package com.hzyc.intstudio.tags;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;

import com.hzyc.intstudio.entity.DictEntity;

/**
 * 单选按钮
 * 
 * @author SCY
 * @2014-2-8下午04:30:22 version 1.0
 */
public class BoxTag extends AbstractTag {

	private static final long serialVersionUID = 3792081606095839541L;

	private String type;

	@Override
	public int doEndTag() throws JspException {
		try {
			JspWriter out = this.pageContext.getOut();
			StringBuffer sb = new StringBuffer();
			List<DictEntity> codeData = super.getCodeData();
			if (codeData != null) {
				List<DictEntity> newData = new ArrayList<DictEntity>();
				newData.addAll(codeData);
				newData = super.codeFilter(newData, super.getBlackList(), super.getWhiteList());
				Iterator<DictEntity> it = newData.iterator();
				for (int i = 0; it.hasNext(); i++) {
					DictEntity codeVo = it.next();
					String labelId = "label" + super.getName() + i;
					if (isDefaultVal(codeVo.getDictCode())) {
						sb.append("<label><input id=\"" + labelId + "\" checked=\"checked\" type=\"" + type + "\""
								+ super.getBaseParam() + " value=\"" + codeVo.getDictCode() + "\"  />"
								+ codeVo.getDictName() + "</label> &nbsp;");
					} else {
						sb.append("<label><input id=\"" + labelId + "\" type=\"" + type + "\"" + super.getBaseParam()
								+ " value=\"" + codeVo.getDictCode() + "\"  />" + codeVo.getDictName()
								+ "</label> &nbsp;");
					}
				}
			}
			out.print(sb.toString());
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
