package com.hzyc.intstudio.service;

import java.util.List;

import com.hzyc.intstudio.entity.DictEntity;

public interface IDictService {

	/**
	 * 根据字段类型获取字典数据
	 * 
	 * @param codeType
	 * @return
	 */
	public List<DictEntity> getDictByType(String dictType, String whiteList, String blackList);

	/**
	 * 字典数据初始化
	 */
	public void init();
}
