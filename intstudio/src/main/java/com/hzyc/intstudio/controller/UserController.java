package com.hzyc.intstudio.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hzyc.intstudio.entity.PageEntity;
import com.hzyc.intstudio.entity.Result;
import com.hzyc.intstudio.entity.UserPo;
import com.hzyc.intstudio.entity.UserVo;
import com.hzyc.intstudio.service.IUserService;

@RequestMapping("/system/users")
@Controller
public class UserController {

	@Resource
	private IUserService userService;
	
	@RequestMapping("/add")
	@ResponseBody
	public Result<Integer> adduser(UserPo u){
		Result<Integer> res = new Result<Integer>();
		int rows = userService.add(u);
		res.setData(rows);
		return res;
	}
	
	@RequestMapping("/query")
	@ResponseBody
	public Result<UserPo> query(UserVo u, PageEntity pageEntity){
		PageHelper.startPage(pageEntity.getPage(), pageEntity.getRows());
		List<UserPo> list = userService.query(u, pageEntity.getOrderStr());
		PageInfo<UserPo> pageInfo = new PageInfo<>(list);
		
		Result<UserPo> res = new Result<UserPo>();
		res.setRows(list);
		res.setTotal(pageInfo.getTotal());
		return res;
	}
	
	@RequestMapping("/get")
	@ResponseBody
	public Result<UserPo> get(int id){
		Result<UserPo> res = new Result<UserPo>();
		UserPo user = userService.get(id);
		res.setData(user);
		return res;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Result<Integer> update(UserPo u){
		Result<Integer> res = new Result<Integer>();
		int rows = userService.update(u);
		res.setData(rows);
		return res;
	}
}
