package com.hzyc.intstudio.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.hzyc.intstudio.entity.Comments;
import com.hzyc.intstudio.entity.Users;

public interface IUserService {
	
	public List<Comments> homePageComments();

	public boolean saveComments(String content,HttpServletRequest request);
	
	/**
	 * 注册，id时间戳
	 * @author BIN
	 * @param users
	 * @return int
	 */
	public int add(Users users);
	
	/**
	 * 通过tel查询登录返回boolean
	 * @author BIN
	 * @param users
	 * @return flag
	 */
	public boolean selectByTel(Users users,HttpServletRequest request);
	
	/**
	 * 通过tel查询返回boolean
	 * @author BIN
	 * @param tel
	 * @return flag
	 */
	public boolean selectTel(String tel);
}
