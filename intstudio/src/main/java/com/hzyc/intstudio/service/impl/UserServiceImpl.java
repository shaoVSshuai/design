package com.hzyc.intstudio.service.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hzyc.intstudio.dao.UsersMapper;
import com.hzyc.intstudio.entity.Users;
import com.hzyc.intstudio.service.IUserService;

@Service
public class UserServiceImpl implements IUserService {

	@Resource
	private UsersMapper userMapper;

	/**
	 * 注册，id时间戳
	 * @author BIN
	 * @param users
	 * @return int
	 */
	public int add(Users users) {
		//时间戳id
		String id = System.currentTimeMillis() + "";
		users.setId(id);
		return userMapper.insert(users);
	}
	
	/**
	 * 通过tel查询返回boolean
	 * @author BIN
	 * @param users
	 * @return flag
	 */
	public boolean selectByTel(Users users) {
		boolean flag = false;
		//查询出来的对象
		Users selUsers = userMapper.selectByTel(users.getTel());
		//查询出来的密码
		String selPassword = selUsers.getPassword();
		if (!"".equals(users.getPassword()) && users.getPassword() != null) {
			flag = users.getPassword().equals(selPassword);
		}
		return flag;
	}
}
