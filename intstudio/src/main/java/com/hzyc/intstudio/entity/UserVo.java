package com.hzyc.intstudio.entity;

import org.apache.ibatis.type.Alias;

@Alias("userVo")
public class UserVo extends UserPo {

	public String startDate;
	public String endDate;

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

}
