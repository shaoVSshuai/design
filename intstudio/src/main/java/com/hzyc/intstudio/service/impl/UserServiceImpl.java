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

	public int add(Users users) {
		return userMapper.insert(users);
	}
}
