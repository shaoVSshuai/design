package com.hzyc.intstudio.controller;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hzyc.intstudio.entity.Users;
import com.hzyc.intstudio.service.IUserService;

@RequestMapping("/system/users")
@Controller
public class UserController {

	@Resource
	private IUserService userService;
	
	/*@RequestMapping("/add")
	@ResponseBody
	public Result<Integer> adduser(UserPo u){
		Result<Integer> res = new Result<Integer>();
		int rows = userService.add(u);
		res.setData(rows);
		return res;
	}*/
	@RequestMapping("/add")
	public ModelAndView adduser(Users users){
		ModelAndView modelAndView = new ModelAndView();
		int rows = userService.add(users);
		if (rows > 0) {
			modelAndView.setViewName("../eucms.html");
		} else {
			modelAndView.setViewName("shibai.jsp");
		}
		return modelAndView;
	}
}
