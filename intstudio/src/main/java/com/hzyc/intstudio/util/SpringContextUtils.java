package com.hzyc.intstudio.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

@Component
public class SpringContextUtils implements ApplicationContextAware{

	private static ApplicationContext applicationContext;
	
	@Override
	public void setApplicationContext(ApplicationContext app) throws BeansException {
		 applicationContext = app;
	}

	public static <T> T getBean(Class<T> clazz) {
        return applicationContext.getBean(clazz);
    }

}
