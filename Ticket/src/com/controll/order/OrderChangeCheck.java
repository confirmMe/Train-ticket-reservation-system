package com.controll.order;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.DataBase;

public class OrderChangeCheck extends HttpServlet {
    //向前端回显出原来订单的用户信息
	//向前端回显改签到的车次的详细信息
	/**
	 * Constructor of the object.
	 */
	public OrderChangeCheck() {
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
		String oldid = request.getParameter("oldid");
		HttpSession session=request.getSession();
		String username=(String) session.getAttribute("username");
		DataBase db = new DataBase();

	 
		String sql = "select * from cctable where id='"+id+"'";
		List<Object> list = db.doSelect(sql);
		request.setAttribute("u",list.get(0));
		
		String sqlOld = "select * from corder where id='"+oldid+"'";
		List<Object> list2 = db.doSelect(sqlOld);
		HashMap<String,String> map = (HashMap<String,String>) list2.get(0);
		String name = map.get("name");
		String sql1 ="select * from webuser where name='"+name+"'";
		List<Object> list1 = db.doSelect(sql1);
		if(((HashMap)list1.get(0)).get("isStudent").equals("1")){
			request.setAttribute("student",true);
		}else{
			request.setAttribute("student",false);
		}
		
		String phone = map.get("phone");
		String bodyid = map.get("bodyid");
		
		request.setAttribute("name", name);
		request.setAttribute("phone", phone);
		request.setAttribute("bodyid", bodyid);
		
		request.setAttribute("oldid",oldid);
		request.getRequestDispatcher("/jsp/order/orderchangecheck.jsp").forward(request, response);
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
