package com.hzyc.intstudio.tags;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.DynamicAttributes;
import javax.servlet.jsp.tagext.TagSupport;

import org.springframework.util.StringUtils;

import com.hzyc.intstudio.entity.DictEntity;
import com.hzyc.intstudio.service.IDictService;
import com.hzyc.intstudio.util.SpringContextUtils;

/**
 * Program Name：标签根类 Description： 码表标签根类
 * 
 * @author SCY Written Date: @2014-2-25下午01:25:51 version 1.0 Modified By：
 *         Modified Date：
 */
@SuppressWarnings("serial")
public class AbstractTag extends TagSupport implements DynamicAttributes {

	private String id;
	private String name;
	private String defaultVal;
	private String codeType;
	private Map<String, Object> dynAttributes = new HashMap<String, Object>();
	private String blackList;
	private String whiteList;
	private String onSelect;
	private String onChange;

	public String getBaseParam() {
		StringBuffer sb = new StringBuffer();
		if (!StringUtils.isEmpty(id)) {
			sb.append(" id = \"").append(id).append("\"");
		}
		if (!StringUtils.isEmpty(name)) {
			sb.append(" name = \"").append(name).append("\"");
		}
		if (dynAttributes.size() > 0) {
			Iterator<Entry<String, Object>> it = dynAttributes.entrySet().iterator();
			while (it.hasNext()) {
				Entry<String, Object> entry = it.next();
				sb.append(" ").append(entry.getKey()).append(" =\"").append(entry.getValue()).append("\"");
			}
		}
		return sb.toString();
	}

	public String getBaseParamJSON() {
		StringBuffer sb = new StringBuffer();
		if (dynAttributes.size() > 0) {
			Iterator<Entry<String, Object>> it = dynAttributes.entrySet().iterator();
			while (it.hasNext()) {
				Entry<String, Object> entry = it.next();
				sb.append(", ").append(entry.getKey()).append(":\'").append(entry.getValue()).append("'");
			}
		}
		if (!StringUtils.isEmpty(onSelect)) {
			sb.append(", onSelect:").append(onSelect);
		}
		if (!StringUtils.isEmpty(onChange)) {
			sb.append(", onChange:").append(onChange);
		}
		return sb.toString();
	}

	/**
	 * 码表过滤,按照黑白名单过滤码表元素，如果某元素即包含在黑名单又包含在白名单中，则将被过滤掉
	 * 
	 * @param srcList
	 *            码表源列表
	 * @param blackList
	 *            黑名单
	 * @param whiteList
	 *            白名单
	 * @return
	 */
	public static List<DictEntity> codeFilter(List<DictEntity> srcList, String blackList, String whiteList) {
		if (srcList != null) {
			boolean includeList = false;// 是否包含黑白名单
			boolean isIn = true;// 是否是白名单
			List<String> nameList = null;
			if (!StringUtils.isEmpty(blackList)) {
				isIn = false;
				includeList = true;
				nameList = Arrays.asList(blackList.split(","));// nameList存储黑名单数据
			}
			if (!StringUtils.isEmpty(whiteList)) {
				isIn = true;
				includeList = true;
				nameList = Arrays.asList(whiteList.split(","));// nameList存储白名单数据
			}
			if (includeList) {
				List<DictEntity> dictData = new ArrayList<>();
				for (DictEntity dictBean : srcList) {
					if (nameList.contains(dictBean.getDictCode()) == isIn) {
						dictData.add(dictBean);
					}
				}
				return dictData;
			}
		}
		return srcList;
	}

	public List<DictEntity> getCodeData() {
		return SpringContextUtils.getBean(IDictService.class).getDictByType(codeType, whiteList, blackList);
	}

	public Map<String, Object> getDynAttributes() {
		return dynAttributes;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDefaultVal() {
		return defaultVal;
	}

	public void setDefaultVal(String defaultVal) {
		this.defaultVal = defaultVal;
	}

	public String getCodeType() {
		return codeType;
	}

	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}

	public boolean isDefaultVal(String codeValue) {
		if (!StringUtils.isEmpty(defaultVal)) {
			if (defaultVal.indexOf(",") != -1) {
				String[] vals = defaultVal.split(",");
				if (vals != null) {
					for (int i = 0; i < vals.length; i++) {
						if (codeValue.equals(vals[i])) {
							return true;
						}
					}
				}
			} else {
				return defaultVal.equals(codeValue);
			}
		}
		return false;
	}

	public String getBlackList() {
		return blackList;
	}

	public void setBlackList(String blackList) {
		this.blackList = blackList;
	}

	public String getWhiteList() {
		return whiteList;
	}

	public void setWhiteList(String whiteList) {
		this.whiteList = whiteList;
	}

	public void setDynamicAttribute(String uri, String localName, Object value) throws JspException {
		dynAttributes.put(localName, value);
	}

	public String getOnSelect() {
		return onSelect;
	}

	public void setOnSelect(String onSelect) {
		this.onSelect = onSelect;
	}

	public String getOnChange() {
		return onChange;
	}

	public void setOnChange(String onChange) {
		this.onChange = onChange;
	}

}
