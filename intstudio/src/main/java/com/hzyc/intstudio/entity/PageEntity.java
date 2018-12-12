package com.hzyc.intstudio.entity;

public class PageEntity {

	private int rows;
	private int page;
	private String sort;
	private String order;
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	
	public String getOrderStr() {
		String orderStr = "";
		if (!org.springframework.util.StringUtils.isEmpty(order)) {
			String[] orders = order.split(",");
			String[] sorts = sort.split(",");
			for (int i = 0; i < sorts.length; i++) {
				orderStr += sorts[i] + " " + orders[i] + ", ";
			}
			orderStr = orderStr.endsWith(", ") ? orderStr.substring(0, orderStr.length() - 2) : orderStr;
		}
		return orderStr;
	}
}
