package com.hzyc.intstudio.controller;


import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hzyc.intstudio.entity.Comments;
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
	@RequestMapping("/saveComments")
	public void saveComments(HttpServletResponse response,HttpServletRequest request) {
		PrintWriter writer = null;
		try {
			String content = request.getParameter("content");
			boolean flag = userService.saveComments(content,request);
			String result = "0";
			if (flag) {
				result = "1";
			}
			result = "{\"flag\":\"" + result + "\"}";
			writer = response.getWriter();
			writer.print(result);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			if(writer != null) {
			writer.flush();
			writer.close();
			}
		}
		
	}
	
	@RequestMapping("/homePage")
	public ModelAndView homePage() {
		ModelAndView modelAndView = new ModelAndView();
		
		List<Comments> cList = userService.homePageComments();
		modelAndView.addObject("cList", cList);
		modelAndView.setViewName("eucms.jsp");
		
		return modelAndView;
	}
	
	/**
	 * 注册，id时间戳
	 * @author BIN
	 * @param users
	 */
	@RequestMapping("/add")
	public ModelAndView adduser(Users users,HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		
		int rows = userService.add(users);
		String flag = rows > 0 ? "1" : "0";
		
		modelAndView.setViewName("redirect:loginorregist.jsp");
		modelAndView.addObject("flag", flag);
		
		return modelAndView;
	}
	
	/**
	 * 登录，通过tel查询
	 * @author BIN
	 * @param users
	 */
	@RequestMapping("/selectByTel")
	public ModelAndView selectByTel(Users users,HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		
		boolean flag = userService.selectByTel(users,request);
		String jsp = flag ? "redirect:homePage" : "redirect:loginorregist.jsp";
		
		if (flag) {
			try {
				HttpSession session = request.getSession();
				if (session.getAttribute("users") != null && session.getAttribute("users") != "") {
					users = (Users)session.getAttribute("users");
				}
				modelAndView.addObject("username", users.getUsername());
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		modelAndView.setViewName(jsp);
		
		return modelAndView;
	}
	
	/**
	 * 注册时手机号校验
	 * @author BIN
	 * @param users
	 * @return flag
	 */
	@RequestMapping("/telCheck")
	public void telCheck(HttpServletResponse response,HttpServletRequest request) {
		PrintWriter writer = null;
		String tel = request.getParameter("tel");
		try {
			writer = response.getWriter();
			
			boolean telFlag = userService.selectTel(tel);
			String flag = telFlag ? "1" : "0" ;
			String result = "{\"flag\":\"" + flag + "\"}";
			writer.println(result);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			writer.flush();
			writer.close();
		}
	}
	
	/**
	 * 注销
	 * @author BIN
	 * @param request
	 * @return
	 */
	@RequestMapping("/logOut")
	public ModelAndView logOut(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		
		request.getSession().removeAttribute("users");
		request.getSession().invalidate();
		
		modelAndView.setViewName("redirect:loginorregist.jsp");
		
		return modelAndView;
	}
}
