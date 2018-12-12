package com.hzyc.intstudio.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hzyc.intstudio.dao.DictMapper;
import com.hzyc.intstudio.entity.DictEntity;
import com.hzyc.intstudio.service.IDictService;
import com.hzyc.intstudio.tags.AbstractTag;

@Service
public class DictServiceImpl implements IDictService {

	@Resource
	private DictMapper dictMapper;

	private Map<String, List<DictEntity>> dictData = new HashMap<String, List<DictEntity>>();

	@Override
	public List<DictEntity> getDictByType(String dictType, String whiteList, String blackList) {
		List<DictEntity> data = dictData.get(dictType);
		return AbstractTag.codeFilter(data, blackList, whiteList);
	}
/*
	@PostConstruct
	public void init() {
		List<String> codeTypes = dictMapper.getCodeType();
		for (String codeType : codeTypes) {
			dictData.put(codeType, dictMapper.getCodeByType(codeType));
		}
	}*/

	@Override
	public void init() {
		// TODO Auto-generated method stub
		
	}

}
