package com.hzyc.intstudio.entity;

import java.io.Serializable;
import java.util.List;

public class Result<T> implements Serializable {

	private static final long serialVersionUID = 8923207691361355747L;
	private String code;
	private boolean result;
	private List<T> rows;
	private T data;
	private long total;

	public Result() {

	}

	public Result(String code, boolean result, List<T> rows) {
		super();
		this.code = code;
		this.result = result;
		this.rows = rows;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public boolean isResult() {
		return result;
	}

	public void setResult(boolean result) {
		this.result = result;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

}
