package com.hzyc.intstudio.controller;


import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hzyc.intstudio.entity.Comments;
import com.hzyc.intstudio.entity.Users;
import com.hzyc.intstudio.service.IUserService;
import com.hzyc.intstudio.util.JDBCTools;

@Controller
//@RequestMapping("/weishangcheng")
public class UserController {

	@Resource
	private IUserService userService;
	
	
	
	@RequestMapping("/selMyOrder")
	@ResponseBody
	public ArrayList<HashMap<String,String>> selMyOrder(String userid  
			) {
		JDBCTools jt = new JDBCTools();
		try {
			ArrayList<HashMap<String,String>> list = jt.find("select * from `order` where userid='"+userid+"' order by time desc");
					
			return list;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
					
			
	}
	
	
	@RequestMapping("/addOrder")
	@ResponseBody
	public boolean addOrder(String userid , String price ,String goodid , String isShop
			) {
		JDBCTools jt = new JDBCTools();
		try {
			String orderid = UUID.randomUUID().toString();
			ArrayList<String> list = new ArrayList<String>();
			//逻辑   下单   添加订单详情   删除购物车
			String sql = "INSERT INTO `ORDER`(userid , price , tprice , TIME , state , orderid)  VALUES('"+userid+"','"+price+"','"+price+"',NOW(),'已付款','"+orderid+"')";
			if(goodid.indexOf(",") != -1) {
				String[] array = goodid.split(",");
				for(String id : array) {
					String sql2  = "INSERT INTO order_detail(orderid ,goodid , nums , price) VALUES('"+orderid+"','"+id+"','1','"+price+"')";
					list.add(sql2);
				}
			}else {
				String sql2  = "INSERT INTO order_detail(orderid ,goodid , nums , price) VALUES('"+orderid+"','"+goodid+"','1','"+price+"')";
				list.add(sql2);
			}
			
			if(isShop != null && isShop.equals("1")) {
				//购物车购买   需要删除购物车
			}
			
			list.add(sql);
			
			jt.batch(list);
					
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}
	
	
	
	@RequestMapping("/selUserById")
	@ResponseBody
	public ArrayList<HashMap<String,String>> selUserById(String userid
			) {
		JDBCTools jt = new JDBCTools();
		try {
			ArrayList<HashMap<String,String>> list = jt.find("select * from users where userid='"+userid+"' ");
					
			return list;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}
	
	@RequestMapping("/giveGift")
	@ResponseBody
	public boolean giveGift(String userid, String tel , String name , String cw , String gift , 
			String grade , String time
			) {
		JDBCTools jt = new JDBCTools();
		String iSql = "insert into give_gift(userid  , gift ,grade , time) "
				+ "values('"+userid+"','"+gift+"','"+grade+"',NOW())";
				
				
				// "insert into give_gift(userid , tel , name , cw , gift ,grade , time) "
				//+ "values('"+userid+"','"+tel+"','"+name+ "','"+cw+ "','"+ gift +"','"+ grade+ "','" +time  +  "')";
		String updateUserSql = "update users set grade = grade-"+ grade +" where userid='"+userid+"'" ;
		ArrayList<String> list = new ArrayList<String>();
		list.add(iSql);
		list.add(updateUserSql);
		try {
			jt.batch(list);
					
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}
	
	
	@RequestMapping("/selGradeGiftByUserId")
	@ResponseBody
	public ArrayList<HashMap<String,String>> selGradeGiftByUserId(String userid
			) {
		JDBCTools jt = new JDBCTools();
		try {
			ArrayList<HashMap<String,String>> list = jt.find("SELECT gift.id gift , gift.name , g.grade  FROM "
					+ "give_gift g,gift gift WHERE g.gift = gift.id "
					+ "AND userid = '"+userid+"'" + 
					"	 ");
					
			return list;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}	
	
	
	@RequestMapping("/selZhihuanByUserId")
	@ResponseBody
	public ArrayList<HashMap<String,String>> selZhihuanByUserId(String userid
			) {
		JDBCTools jt = new JDBCTools();
		try {
			ArrayList<HashMap<String,String>> list = jt.find("select * from zhihuan where userid = '"+userid+"'" + 
					"	 ");
					
			return list;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}		
			
	@RequestMapping("/selGradeGift")
	@ResponseBody
	public ArrayList<HashMap<String,String>> selGradeGift(
			) {
		JDBCTools jt = new JDBCTools();
		try {
			ArrayList<HashMap<String,String>> list = jt.find("SELECT g.*,gift.name FROM grade_gift g,gift gift WHERE g.gift = gift.id ");
					
			return list;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}
	
	
	@RequestMapping("/selWeibaoByuserid")
	@ResponseBody
	public ArrayList<HashMap<String,String>> selWeibaoByuserid(String userid
			) {
		JDBCTools jt = new JDBCTools();
		try {
			ArrayList<HashMap<String,String>> list = jt.find("SELECT * FROM bespoke WHERE userid = '"+userid+"'");
					
			return list;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}
	@RequestMapping("/selShijiaByuserid")
	@ResponseBody
	public ArrayList<HashMap<String,String>> selShijiaByuserid(String userid
			) {
		JDBCTools jt = new JDBCTools();
		try {
			ArrayList<HashMap<String,String>> list = jt.find("SELECT * FROM testdrive WHERE userid = '"+userid+"'");
					
			return list;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}
	
	

	@RequestMapping("/addUser")
	@ResponseBody
	public boolean addUser(String userid , String id
			) {
		JDBCTools jt = new JDBCTools();
		try {
			ArrayList<HashMap<String,String>> list = jt.find("select * from users where userid = '"+userid+"'");
			if(list != null && list.size() > 0 ) {
				
			}else {
				int row =jt.update("insert into users(userid , grade)  values ('"+userid+"','2000')");
				
			}			
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public boolean delete(String table , String id
			) {
		JDBCTools jt = new JDBCTools();
		try {
			int row =jt.update("delete from "+table+" where id= '"+id+"'");
			if(row > 0) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}		
	
	@RequestMapping("/addRole")
	@ResponseBody
	public boolean addRole(String type , String remark ,String price 
			) {
		JDBCTools jt = new JDBCTools();
		try {
			int row =jt.update("insert into grade_gift(grade,gift,userid,times,flag) values('"+price+"','"+type+"','admin','"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())+"','1')");
			if(row > 0) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}		
	
	
	@RequestMapping("/addGift")
	@ResponseBody
	public boolean addGift(String type , String remark ,String price ,String name
			) {
		JDBCTools jt = new JDBCTools();
		try {
			int row =jt.update("insert into gift(type,reamrk,price,name) values('"+type+"','"+remark+"','"+price+"','"+name+"')");
			if(row > 0) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}		
			
    @RequestMapping("/addType")
	@ResponseBody
	public boolean addType(String pinpai ,String type , String remark , String price) {
		JDBCTools jt = new JDBCTools();
		try {
			int row =jt.update("insert into cartype(NAME,reamrk,pid,price) values('"+type+"','"+remark+"','"+pinpai+"','"+price+"')");
			if(row > 0) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}
	
	@RequestMapping("/addPinpai")
	@ResponseBody
	public boolean addPinpai(String pinpai , String remark) {
		JDBCTools jt = new JDBCTools();
		try {
			int row =jt.update("insert into cartype(NAME,reamrk,pid) values('"+pinpai+"','"+remark+"','0')");
			if(row > 0) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}
	
	
	@RequestMapping("/login")
	@ResponseBody
	public boolean login(String username , String pwd) {
		JDBCTools jt = new JDBCTools();
		try {
			ArrayList<HashMap<String,String>> list =jt.find("select * from admin where username = '"+username+"' and pwd = '"+pwd+"'");
			if(list != null && list.size() > 0) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}
	
	
	@RequestMapping("/insertTestDrive")
	@ResponseBody
	public boolean insertTestDrive(String xslc, String userid , String cartype, String carcode , String name , String tel , String cw , String time , HttpServletResponse response,HttpServletRequest request) {
		JDBCTools jt = new JDBCTools();
		int row = jt.update("INSERT INTO testdrive(xslc  , userid  ,cartype,carcode , name,tel,cw,time)"
				+ " VALUES('"+xslc+"','"+userid+"','"+cartype+"','"+carcode+"','"+name+"','"+tel+"','"+cw+"','"+time+"')");
		if(row > 0 ) {
			return true;
		}
		
		return false;
		
	}
	
	@RequestMapping("/insertZhihuan")
	@ResponseBody
	public boolean insertZhihuan(String xslc, String userid, String cartype, String carcode , String name , String tel , String cw , String time , HttpServletResponse response,HttpServletRequest request) {
		JDBCTools jt = new JDBCTools();
		int row = jt.update("INSERT INTO zhihuan(xslc  ,userid ,  cartype,carcode , name,tel,cw,time)"
				+ " VALUES('"+xslc+"','"+userid+"','"+cartype+"','"+carcode+"','"+name+"','"+tel+"','"+cw+"','"+time+"')");
		if(row > 0 ) {
			return true;
		}
		
		return false;
		
	}

	
	@RequestMapping("/yuyuebaoyang")
	@ResponseBody
	public boolean yuyuebaoyang(String nickname , String name , String tel , String cw , String xslc , String time , String code , String remark ,HttpServletResponse response,HttpServletRequest request) {
		JDBCTools jt = new JDBCTools();
		int row = jt.update("INSERT INTO bespoke(userid,name , phone , `call`,mills , times , carid ,remark)"
				+ " VALUES('"+nickname+"','"+name+"','"+tel+"','"+cw+"','"+xslc+"','"+time+"','"+code+"','"+remark+"')");
		if(row > 0 ) {
			return true;
		}
		
		return false;
		
	}
	
	@RequestMapping("/addCar")
	@ResponseBody
	public boolean addCar(String cartype , String date , String xslc , String sbdm , String carcode , String fdjh , String nickname , HttpServletResponse response,HttpServletRequest request) {
		JDBCTools jt = new JDBCTools();
		int row = jt.update("INSERT INTO mycar(xslc,userid , carid , TYPE,CODE , fadongji , TIME ,imgurl)"
				+ " VALUES('"+xslc+"','"+nickname+"','"+carcode+"','"+cartype+"','"+sbdm+"','"+fdjh+"','"+date+"','"+""+"')");
		if(row > 0 ) {
			return true;
		}
		
		return false;
		
	}
	
	@RequestMapping("/selectAllCartype")
	@ResponseBody
	public HashMap selectAllCartype(String id , HttpServletResponse response,HttpServletRequest request) {
		JDBCTools jt = new JDBCTools();
		List<HashMap<String,String>> list = jt.find("select * from cartype");
		List<HashMap<String,String>> old = jt.find("select * from cartype where pid = '0'");
		//for(HashMap<String,String> map : list) {
			//newlist.add(map.get("name"));
	//	}
		HashMap amap = new HashMap();
		amap.put("all" , list);
		List<String> newlist = new ArrayList();
		for(HashMap<String,String> map : old) {
			newlist.add(map.get("name"));
		}
		amap.put("one" , newlist);
		return amap;
		
	}
	
	
	@RequestMapping("/selectOneNews")
	@ResponseBody
	public HashMap<String,String> selOneNews(String id , HttpServletResponse response,HttpServletRequest request) {
		JDBCTools jt = new JDBCTools();
		List<HashMap<String,String>> list = jt.find("select * from news where id='"+id+"'");
		if(list != null && list.size() > 0) {
		return list.get(0);	
		}else {
			return null;
		}
		
	}
	
	@RequestMapping("/selectNews")
	@ResponseBody
	public List<HashMap<String,String>> selNews(String limit ,String type , HttpServletResponse response,HttpServletRequest request) {
		String name = "";
		if(type.equals("1")) {
			name = "新闻";
			
		}else {
			name = "爱车";
		}
		String sql = "select * from news where type='"+name+"'";
		if(limit != null && !limit.equals("")) {
			sql += " limit "+limit + "";
		}
		JDBCTools jt = new JDBCTools();
		List<HashMap<String,String>> list = jt.find(sql);
		return list;
		
	}
	
	@RequestMapping("/haveCar")
	@ResponseBody
	public List<HashMap<String,String>> haveCar(String name , HttpServletResponse response,HttpServletRequest request) {
		
		JDBCTools jt = new JDBCTools();
		List<HashMap<String,String>> list = jt.find("select * from mycar where userid='"+name+"'");
		return list;
		
	}
	
	@RequestMapping("/selectGoods")
	@ResponseBody
	public List<HashMap<String,String>> saveComments(String type , HttpServletResponse response,HttpServletRequest request) {
		String typeString = "";
		if(type.equals("1")) {
			typeString = "车";
		} if(type.equals("2")) {
			
		}
		if(type.equals("3")) {
			
		}
		JDBCTools jt = new JDBCTools();
		List<HashMap<String,String>> list = jt.find("select * from goods where type='"+typeString+"'");
		return list;
		
	}
	
	@RequestMapping("/getGoodsInfo")
	@ResponseBody
	public List<HashMap<String,String>> getGoodsInfo(String id , HttpServletResponse response,HttpServletRequest request) {
		 
		JDBCTools jt = new JDBCTools();
		List<HashMap<String,String>> list = jt.find("select * from goods where id='"+id+"'");
		return list;
		
	}
	@RequestMapping("/addShopCar")
	@ResponseBody
	public String addShopCar(String goodid,String userid , HttpServletResponse response,HttpServletRequest request) {
		 
		JDBCTools jt = new JDBCTools();
		String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		String sql = "insert into shopcar(userid,goodid,time,nums) values('"+userid+"','"+goodid+"','"+date+"','1')";
		int i = jt.update(sql);
		return i > 0 ?"true":"false";
		
	}
	@RequestMapping("/selshopcar")
	@ResponseBody
	public List<HashMap<String,String>>  selshopcar(String userid , HttpServletResponse response,HttpServletRequest request) {
		 
		JDBCTools jt = new JDBCTools();
		String sql = "select g.*,s.nums snums,s.time from goods g,shopcar s where g.id = s.goodid and s.userid = '"+userid+"'";
		List<HashMap<String,String>> list = jt.find(sql);
		return list;
		
	}
	
	@RequestMapping("/homePage")
	public ModelAndView homePage() {
		ModelAndView modelAndView = new ModelAndView();
		
		List<Comments> cList = userService.homePageComments();
		modelAndView.addObject("cList", cList);
		modelAndView.setViewName("eucms.jsp");
		
		return modelAndView;
	}
	
	/**
	 * 注册，id时间戳
	 * @author BIN
	 * @param users
	 */
	@RequestMapping("/add")
	public ModelAndView adduser(Users users,HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		
		int rows = userService.add(users);
		String flag = rows > 0 ? "1" : "0";
		
		modelAndView.setViewName("redirect:loginorregist.jsp");
		modelAndView.addObject("flag", flag);
		
		return modelAndView;
	}
	
	/**
	 * 登录，通过tel查询
	 * @author BIN
	 * @param users
	 */
	@RequestMapping("/selectByTel")
	public ModelAndView selectByTel(Users users,HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		
		boolean flag = userService.selectByTel(users,request);
		String jsp = flag ? "redirect:homePage" : "redirect:loginorregist.jsp";
		
		if (flag) {
			try {
				HttpSession session = request.getSession();
				if (session.getAttribute("users") != null && session.getAttribute("users") != "") {
					users = (Users)session.getAttribute("users");
				}
				modelAndView.addObject("username", users.getUsername());
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		modelAndView.setViewName(jsp);
		
		return modelAndView;
	}
	
	/**
	 * 注册时手机号校验
	 * @author BIN
	 * @param users
	 * @return flag
	 */
	@RequestMapping("/telCheck")
	public void telCheck(HttpServletResponse response,HttpServletRequest request) {
		PrintWriter writer = null;
		String tel = request.getParameter("tel");
		try {
			writer = response.getWriter();
			
			boolean telFlag = userService.selectTel(tel);
			String flag = telFlag ? "1" : "0" ;
			String result = "{\"flag\":\"" + flag + "\"}";
			writer.println(result);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			writer.flush();
			writer.close();
		}
	}
	
	/**
	 * 注销
	 * @author BIN
	 * @param request
	 * @return
	 */
	@RequestMapping("/logOut")
	public ModelAndView logOut(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		
		request.getSession().removeAttribute("users");
		request.getSession().invalidate();
		
		modelAndView.setViewName("redirect:loginorregist.jsp");
		
		return modelAndView;
	}
}
