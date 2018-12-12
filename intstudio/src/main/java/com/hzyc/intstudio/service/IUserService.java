package com.hzyc.intstudio.service;

import java.util.List;

import com.hzyc.intstudio.entity.UserPo;
import com.hzyc.intstudio.entity.UserVo;

public interface IUserService {

	public int add(UserPo user);
	
	public List<UserPo> query(UserVo u, String orderStr);
	
	public UserPo get(int id);
	
	public int update(UserPo u);
}
