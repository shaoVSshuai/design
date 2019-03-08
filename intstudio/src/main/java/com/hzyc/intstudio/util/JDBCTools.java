package com.hzyc.intstudio.util;





import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class JDBCTools {
	
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	
	private void connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://39.96.62.60:3306/vfulovecar", "root", "mysql");
			stmt = conn.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			conn.close();
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}
	public int update(String sql) {
		int rows = 0;
		try {
			connect();
			rows = stmt.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return rows;
	}
	
	public ArrayList<HashMap<String, String>> find(String sql) {
		System.out.println(sql);
		ArrayList<HashMap<String, String>> rsList = new ArrayList<HashMap<String, String>>();
		try {
			connect();
			rs = stmt.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			while (rs.next()) {
				HashMap<String, String> oneMap = new HashMap<String, String>();
				for (int i = 1; i <= rsmd.getColumnCount(); i++) {
					oneMap.put(rsmd.getColumnName(i), rs.getString(rsmd.getColumnName(i)));
				}
				rsList.add(oneMap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return rsList;
	}
	
	public void batch(ArrayList<String> sqls) {
		try {
			connect();
			for (int i = 0; i < sqls.size(); i++) {
				stmt.addBatch(sqls.get(i));
			}
			stmt.executeBatch();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public static void main(String[] args) {
		JDBCTools jt = new JDBCTools();
		for(int i = 1; i <= 20 ;i ++){
			
			String name = "С��"+i;
			String price = "1000";
			String rom = "8G";
			String ram = "3G";
			String size = "5.2";
			String img = i+".jpg";
			jt.update("insert into goods(name,price,rom,ram,size,img) values('"+name+"','"+price+"','"+rom+"','"+ram+"','"+size+"','"+img+"')");
		}
		
	}
} 




