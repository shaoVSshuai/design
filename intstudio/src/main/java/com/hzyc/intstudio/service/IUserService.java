package com.hzyc.intstudio.service;

import com.hzyc.intstudio.entity.Users;

public interface IUserService {

	/**
	 * 注册，id时间戳
	 * @author BIN
	 * @param users
	 * @return int
	 */
	public int add(Users users);
	
	/**
	 * 通过tel查询返回boolean
	 * @author BIN
	 * @param users
	 * @return flag
	 */
	public boolean selectByTel(Users users);
}
