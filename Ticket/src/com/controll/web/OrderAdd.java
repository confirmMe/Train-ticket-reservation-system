package com.controll.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.DataBase;
import com.util.Money;
import com.util.findTicket;


public class OrderAdd extends HttpServlet {
//创建订单，座位号使用自动递增策略；
//每生成一个订单，那么数据库中对应的座位就自减1
//在生成订单之前，会检查车次中是否还有剩余座位，没有的话中止一切操作
//订单id使用随机生成策略，确保任意两个id不会重复
	/**
	 * Constructor of the object.
	 */
	public OrderAdd() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
         int flag=0;
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		DataBase db = new DataBase();
		//初始化票价
	    Integer element=0;
		String ccid = request.getParameter("ccid");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String bodyid = request.getParameter("bodyid");
		String type = request.getParameter("type");
		
		
		
		
		
		String getseatnumsql = " SELECT seatnum FROM corder WHERE ccid ='"+ccid+"' ORDER BY seatnum DESC LIMIT 1";
		List<Object> seatlist = db.doSelect(getseatnumsql);
		//该sql语句是查询当前最高的座位号
		//初始化座位号是1
		int seatnum = 1;
		if(!seatlist.isEmpty()){
			HashMap map  = (HashMap) seatlist.get(0);
			seatnum = Integer.valueOf(map.get("seatnum").toString())+1;
		}

			long millis = System.currentTimeMillis();
			//long millis = System.nanoTime();
			//加上三位随机数
			Random random = new Random();
			int end3 = random.nextInt(999);
			//如果不足三位前面补0
			String id = millis + String.format("%03d", end3);	
		
		
			
			
			
			List<Object> checkList=db.doSelect("select * from cctable where ccid ='"+ccid+"' ");
			HashMap map  = (HashMap) checkList.get(0);
			
			//计算用户数据库中是否有该乘车人信息
			List<Object> userlist = db.doSelect("select * from webuser where name= '"+name+"' and phone ='"+phone+"' and bodyid='"+bodyid+"' and isnot=0");
			if(userlist.size()==0){
				flag=1;
			}
			else{
			//计算票价
			element=findTicket.find(ccid, name, type);
			if(type.equals("rw")){
				 if(Integer.valueOf(map.get("rwpage").toString())==0||Money.enough(username, element)==false){
					 flag=2;
				 }else{
				 db.doUpdate("UPDATE cctable set rwpage= rwpage-1 WHERE ccid = '"+ccid+"'");
				 //有票，那么更新出票后的票数
				 }
			}
			if(type.equals("yw")){
				 if(Integer.valueOf(map.get("ywpage").toString())==0||Money.enough(username, element)==false){
					 flag=2;
				 }else{
					 db.doUpdate("UPDATE cctable set ywpage= ywpage-1 WHERE ccid = '"+ccid+"'");
					 //有票，那么更新出票后的票数
				}
			}
			if(type.equals("yz")){
				 if(Integer.valueOf(map.get("yzpage").toString())==0||Money.enough(username, element)==false){
					 flag=2;
				 }else{
					 db.doUpdate("UPDATE cctable set yzpage= yzpage-1 WHERE ccid = '"+ccid+"'");
					 //有票，那么更新出票后的票数
				}
			}
			if(type.equals("wz")){
				if(Integer.valueOf(map.get("wzpage").toString())==0||Money.enough(username, element)==false){
					flag=2;
				}else{
					 db.doUpdate("UPDATE cctable set wzpage= wzpage-1 WHERE ccid = '"+ccid+"'");
					 //有票，那么更新出票后的票数
					seatnum=0;
				}
			}
		
		}
		if(flag==0){
		//创建订单 
		StringBuffer sql = new StringBuffer();
		sql.append("insert into corder (id,username,name,phone,bodyid,type,num,ccid,seatnum) values ");
        sql.append("('"+id+"','"+username+"','"+name+"','"+phone+"','"+bodyid+"','"+type+"','"+1+"','"+ccid+"','"+seatnum+"')");
		db.doAdd(sql.toString());
		
		//记录到车次推荐表
		List maybe=db.doSelect("select * from selecthis where ccid='"+ccid+"' and username='"+username+"' limit 1");
		if(maybe.size()==0){
		db.doAdd("insert into selecthis (selvalue,selsum,username,ccid) values('"+map.get("id")+"','"+1+"','"+username+"','"+ccid+"')");
		}else{
		HashMap mybeList=(HashMap) maybe.get(0);
		db.doUpdate("update selecthis set selsum=selsum+1 where id='"+mybeList.get("id")+"'");
		}
		
		//新增乘车人
		List rideList=db.doSelect("select * from rideuser where username='"+username+"' and name='"+name+"'");
		if(rideList.size()==0){
		db.doAdd("insert into rideuser (username,name,phone,bodyid) values ('"+username+"','"+name+"','"+phone+"','"+bodyid+"')");
		}
		
		Money.spend("-"+element.toString(), username, ccid);
		
		    request.setAttribute("msg", "success");
		    request.getRequestDispatcher("/servlet/OrderSearch").forward(request, response);
		}else if(flag==1){
			request.setAttribute("msg", "erroruser");
			request.getRequestDispatcher("/servlet/OrderSearch").forward(request, response);
		}else{
			
				request.setAttribute("msg", "error");
				request.getRequestDispatcher("/servlet/OrderSearch").forward(request, response);
			
		}
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
