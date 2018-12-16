package com.hzyc.intstudio.service.impl;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.hzyc.intstudio.dao.CommentsMapper;
import com.hzyc.intstudio.dao.UsersMapper;
import com.hzyc.intstudio.entity.Comments;
import com.hzyc.intstudio.entity.Users;
import com.hzyc.intstudio.service.IUserService;

@Service
public class UserServiceImpl implements IUserService {

	@Resource
	private UsersMapper userMapper;
	@Resource
	private CommentsMapper commentsMapper;
	
	public List<Comments> homePageComments() {
		List<Comments> cList = commentsMapper.selectAll();
		
		return cList;
	}
	
	public boolean saveComments(String content,HttpServletRequest request) {
		boolean flag = false;
		String id = System.currentTimeMillis() + "";
		Users users = (Users)request.getSession().getAttribute("users");
		String times = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		Comments comments = new Comments();
		comments.setId(id);
		comments.setUserid(users.getId());
		comments.setTimes(times);
		comments.setReplay("1");
		comments.setDeleted("0");
		comments.setContent(content);
		int result = commentsMapper.insertSelective(comments);
		if (result > 0) {
			flag = true;
		}
		
		return flag;
	}

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
		String times = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		users.setTimes(times);
		users.setDeleted("0");
		return userMapper.insert(users);
	}
	
	/**
	 * 通过tel查询登录返回boolean
	 * @author BIN
	 * @param users
	 * @return flag
	 */
	public boolean selectByTel(Users users,HttpServletRequest request) {
		boolean flag = false;
		//查询出来的对象
		Users selUsers = userMapper.selectByTel(users.getTel());
		//查询出来的密码
		if(selUsers != null) {
			String selPassword = selUsers.getPassword();
			if (!"".equals(users.getPassword()) && users.getPassword() != null) {
				flag = users.getPassword().equals(selPassword);
			}
		}else {
			flag = false;
		}
		if(flag) {
			HttpSession session = request.getSession();
			session.setAttribute("users", selUsers);
		}
		return flag;
	}
	
	/**
	 * 通过tel查询返回boolean
	 * @author BIN
	 * @param tel
	 * @return flag
	 */
	public boolean selectTel(String tel) {
		Users users = userMapper.selectByTel(tel);
		boolean flag = users != null ? false : true;
		
		return flag;
	}
}
