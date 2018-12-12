package com.hzyc.intstudio.entity;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

/**
 * 码表Vo
 * 
 * @author SCY
 *
 * @createDate 2013-12-3下午01:16:35
 * 
 * @version 1.0
 */
@Alias("dict")
public class DictEntity implements Serializable {

	private static final long serialVersionUID = -8608394613804551461L;
	private int id;
	private String dictType = "";// 码表值
	private String dictCode = "";
	private String dictName = "";// 码表类型

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDictType() {
		return dictType;
	}

	public void setDictType(String dictType) {
		this.dictType = dictType;
	}

	public String getDictCode() {
		return dictCode;
	}

	public void setDictCode(String dictCode) {
		this.dictCode = dictCode;
	}

	public String getDictName() {
		return dictName;
	}

	public void setDictName(String dictName) {
		this.dictName = dictName;
	}

}
