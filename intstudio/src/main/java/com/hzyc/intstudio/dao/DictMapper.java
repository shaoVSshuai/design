package com.hzyc.intstudio.dao;

import java.util.List;

import com.hzyc.intstudio.entity.DictEntity;


/**
 * 字典信息Mapper
 * @author suicy
 * @createTime 2017年12月20日下午5:05:40
 */
public interface DictMapper {

	/**
	 * 根据字典类型获取字典数据信息
	 * @param codeType
	 * @return
	 */
	public List<DictEntity> getCodeByType(String codeType);
	
	/**
	 * 获取所有字典类型信息
	 * @return
	 */
	public List<String> getCodeType();
	
}
