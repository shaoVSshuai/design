package com.hzyc.intstudio.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hzyc.intstudio.entity.UserPo;
import com.hzyc.intstudio.entity.UserVo;

public interface UserMapper {

	public int add(UserPo user);
	
	public List<UserPo> query(@Param("u")UserVo u, @Param("orderStr")String orderStr);
	
	public UserPo get(int id);
	
	public int update(UserPo u);
}
