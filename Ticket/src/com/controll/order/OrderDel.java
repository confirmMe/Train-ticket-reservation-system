package com.controll.order;

import java.io.IOException;
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

public class OrderDel extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public OrderDel() {
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
		String id = request.getParameter("id");
		DataBase db = new DataBase();
		String flag=request.getParameter("flag");
		
		List<Object> oldlist=db.doSelect("select * from corder where id='"+id+"'");
		HashMap oldMap  = (HashMap) oldlist.get(0);
		String  oldCcid=(String) oldMap.get("ccid");
		String  oldType=(String) oldMap.get("type")+"page";
		String  username =(String) oldMap.get("username");
		String  name =(String) oldMap.get("name");
		db.doUpdate("update cctable set "+oldType+"="+oldType+" +1 where ccid='"+oldCcid+"'");
		//将改签前的车次的对应位置的余票+1
		
        //退票时，会少退回20元，作为惩罚
        Integer ele=findTicket.find(oldCcid, name, (String) oldMap.get("type"))-20;
		Money.add(  "+"+ele.toString(), username, oldCcid);
		String sql = "delete from corder where id='"+id+"'";
		db.doDelete(sql);
		request.setAttribute("msg", "delsuccess");
		
		if(flag.equals("1")){
		request.getRequestDispatcher("/servlet/OrderSearch").forward(request, response);
		}else{
		request.getRequestDispatcher("/servlet/Order").forward(request, response);	
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
