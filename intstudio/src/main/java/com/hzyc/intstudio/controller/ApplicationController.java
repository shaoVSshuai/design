package com.hzyc.intstudio.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hzyc.intstudio.entity.Application;
import com.hzyc.intstudio.entity.Users;
import com.hzyc.intstudio.service.ApplicationService;

@Controller
public class ApplicationController {

	@Resource
	private ApplicationService appService;
	

	/**
	 * 联系我们
	 * @author BIN
	 * @param application
	 */
	@RequestMapping("/application")
	public ModelAndView application(Application application,HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		if (request.getSession(false) == null) {
			modelAndView.addObject("flag", "2");
			modelAndView.setViewName("loginorregist.jsp");
		} else {
			Users users = (Users)request.getSession().getAttribute("users");
			application.setUsersid(users.getId());
			boolean flag = appService.saveApplication(application);
			String jsp = flag ? "eucms.jsp" : "申请页";
			modelAndView.setViewName(jsp);
		}
		
		return modelAndView;
	}
	
	/**
	 * 联系我们判断一下session
	 * @author BIN
	 * @param application
	 */
	@RequestMapping("/applicationCheck")
	public ModelAndView applicationCheck(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		
		String jsp = request.getSession(false) == null ? "loginorregist.jsp" : "申请页";
		String flag = request.getSession(false) == null ? "2" : "";
		modelAndView.addObject("flag", flag);
		modelAndView.setViewName(jsp);
		
		return modelAndView;
	}
}
