package com.hzyc.intstudio.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hzyc.intstudio.entity.DictEntity;
import com.hzyc.intstudio.service.IDictService;

/**
 * 字典Controller
 * 
 * @author suicy
 * @createTime 2018年1月6日下午1:48:44
 */
@Controller()
@RequestMapping("/dict")
public class DictController {

	@Resource
	private IDictService dictService;

	@RequestMapping("/getDict")
	@ResponseBody
	public List<DictEntity> getDict(String dictType, @RequestParam(required = false) String whiteList,
			@RequestParam(required = false) String blackList) {
		List<DictEntity> res = dictService.getDictByType(dictType, whiteList, blackList);
		return res;
	}

	@RequestMapping("/reload")
	@ResponseBody
	public boolean reload() {
		dictService.init();
		return true;
	}
}
