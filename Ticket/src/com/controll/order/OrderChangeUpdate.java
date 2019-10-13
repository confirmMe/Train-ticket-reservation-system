package com.controll.order;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.DataBase;
import com.util.Money;
import com.util.findTicket;

public class OrderChangeUpdate extends HttpServlet {
//改签火车票
//如果改签后的车次对应位置余票不够，中止一切操作
//将改签后的车次对应位置余票-1
//将改签前的车次的对应位置余票+1
//2019.3.2进行BUG修改
	/**
	 * Constructor of the object.
	 */
	public OrderChangeUpdate() {
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
		request.setCharacterEncoding("UTF-8");
		boolean flag=true;
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String bodyid = request.getParameter("bodyid");
		String type = request.getParameter("type");
		String ccid = request.getParameter("ccid");
		String oldid=request.getParameter("oldid");
 
		DataBase db = new DataBase();
		
		List<Object> oldlist=db.doSelect("select * from corder where id='"+oldid+"'");
		HashMap oldMap  = (HashMap) oldlist.get(0);
		String  oldCcid=(String) oldMap.get("ccid");
		String  oldType=(String) oldMap.get("type")+"page";
 
		//计算座位号，保证不重复
		String getseatnumsql = " SELECT seatnum FROM corder WHERE ccid ='"+ccid+"' ORDER BY seatnum DESC LIMIT 1";
		List<Object> seatlist = db.doSelect(getseatnumsql);
		int seatnum = 1;
		if(!seatlist.isEmpty()){
			HashMap map  = (HashMap) seatlist.get(0);
			seatnum = Integer.valueOf(map.get("seatnum").toString())+1;
		}
  
		//取得当前的最大座位号然后+1,作为当前的座位号
		Integer reString=findTicket.find(ccid, name, type)-findTicket.find(oldCcid, name, (String) oldMap.get("type"));
		Integer breString=-reString;
		System.out.println("改签前后价格差距"+ reString);
		boolean enough=Money.enough(username,  reString);
	    
        //查询cctable的指定车次是否还有票  
		List<Object> checkList=db.doSelect("select * from cctable where ccid ='"+ccid+"' ");
		HashMap map  = (HashMap) checkList.get(0);
		if(type.equals("rw")){
			 if(Integer.valueOf(map.get("rwpage").toString())==0||enough==false){
				 flag=false;
			 }else{ 
			 db.doUpdate("UPDATE cctable set rwpage= rwpage-1 WHERE ccid = '"+ccid+"'");
			 //有票，那么更新出票后的票数
			 }
		}
		if(type.equals("yw")){
			 if(Integer.valueOf(map.get("ywpage").toString())==0||enough==false){
				 flag=false;
			 }else{
				 db.doUpdate("UPDATE cctable set ywpage= ywpage-1 WHERE ccid = '"+ccid+"'");
				 //有票，那么更新出票后的票数
			}
		}
		if(type.equals("yz")){
			 if(Integer.valueOf(map.get("yzpage").toString())==0||enough==false){
				 flag=false;
			 }else{
				 db.doUpdate("UPDATE cctable set yzpage= yzpage-1 WHERE ccid = '"+ccid+"'");
				 //有票，那么更新出票后的票数
			}
		}
		if(type.equals("wz")){
			if(Integer.valueOf(map.get("wzpage").toString())==0||enough==false){
				flag=false;
			}else{
				 db.doUpdate("UPDATE cctable set wzpage= wzpage-1 WHERE ccid = '"+ccid+"'");
				 //有票，那么更新出票后的票数
				 seatnum=0;
			}
		}
		
		if(flag){
			if(reString>0){
				Money.spend("-"+reString.toString(), username,  oldCcid+"-->"+ccid);
			}else{
				Money.add("+"+breString.toString(), username,oldCcid+"-->"+ccid);
			}
			db.doUpdate("update cctable set "+oldType+"="+oldType+" +1 where ccid='"+oldCcid+"'");
			//将改签前的车次的对应位置的余票+1
			db.doUpdate("UPDATE corder SET ccid='"+ccid+"' , seatnum='"+seatnum+"', name='"+name+"', phone='"+phone+"', bodyid='"+bodyid+"' , type='"+type+"'   WHERE id ='"+oldid+"'");
			//更新原来数据的ccid以及其他信息，但不是新增
			request.setAttribute("msg", "changesuccess");
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
