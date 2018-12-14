package com.hzyc.intstudio.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hzyc.intstudio.dao.ApplicationMapper;
import com.hzyc.intstudio.entity.Application;
import com.hzyc.intstudio.service.ApplicationService;

@Service
public class ApplicationServiceImpl implements ApplicationService{

	@Resource
	private ApplicationMapper appMapper;
	
	/**
	 * 联系我们
	 * @author BIN
	 * @param application
	 */
	public boolean saveApplication(Application application) {
		boolean flag = false;
		String id = System.currentTimeMillis() + "";
		String times = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		application.setId(id);
		application.setTimes(times);
		application.setDealwith("1");
		application.setDeteled("0");
		int result = appMapper.insertSelective(application);
		if (result > 0) {
			flag = true;
		}
		return flag;
	}

}
