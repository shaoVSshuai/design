package com.hzyc.intstudio.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hzyc.intstudio.entity.Users;
import com.hzyc.intstudio.service.IUserService;

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
	/**
	 * 注册，id时间戳
	 * @param users
	 * @return
	 */
	@RequestMapping(value="/add")
	public ModelAndView adduser(Users users){
		ModelAndView modelAndView = new ModelAndView();
		
		int rows = userService.add(users);
		if (rows > 0) {
			modelAndView.setViewName("eucms.html");
		} else {
			modelAndView.setViewName("shibai.jsp");
		}
		
		return modelAndView;
	}
	
	/**
	 * 登录，通过tel查询
	 * @param users
	 * @return
	 */
	@RequestMapping(value="/selectByTel")
	public ModelAndView selectByTel(Users users,HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		
		boolean flag = userService.selectByTel(users,request);
		String jsp = flag ? "eucms.jsp" : "loginorregist.jsp";
		
		if (flag) {
			HttpSession session = request.getSession();
			users = (Users)session.getAttribute("users");
			modelAndView.addObject("users", users);
		}
		modelAndView.setViewName(jsp);
		
		return modelAndView;
	}
}
