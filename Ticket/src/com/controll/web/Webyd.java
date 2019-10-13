package com.controll.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.DataBase;

public class Webyd extends HttpServlet {

	//在显示订单时回显车次信息
	//查询用户是否是学生，如果是则返回student为1
	/**
	 * Constructor of the object.
	 */
	public Webyd() {
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
	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		DataBase db = new DataBase();
		String id = request.getParameter("id");
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");//用户昵称
		String name = request.getParameter("name");//乘车人姓名
		
		String sql1 ="select * from webuser where name='"+name+"'";
		List<Object> list1 = db.doSelect(sql1);
		if(name!=null){
		if(((HashMap)list1.get(0)).get("isStudent").equals("1")){
			request.setAttribute("student",true);
		}else{
			request.setAttribute("student",false);
		}
		}else{
			request.setAttribute("student",false);
		}
		String sql = "select * from cctable where id='"+id+"'";
		List<Object> list = db.doSelect(sql);
		
		
		
		//获取用户常用乘车人信息
		StringBuffer sb=new StringBuffer();
		List maybe=db.doSelect("select * from rideuser where username='"+username+"'");
		for(int i=0;i<maybe.size();i++){
			HashMap map=(HashMap) maybe.get(i); 
			sb.append("<A href='servlet/Webyd?id="+id+"&name="+map.get("name")+"&phone="+map.get("phone")+"&bodyid="+map.get("bodyid")+"'>"+map.get("name")+"</A>");
			sb.append("         ");
		}
		
		String phone = request.getParameter("phone");
		String bodyid = request.getParameter("bodyid");
		
		request.setAttribute("u",list.get(0));
		request.setAttribute("maybe",sb.toString());
		request.setAttribute("name",name);
		request.setAttribute("phone",phone);
		request.setAttribute("bodyid",bodyid);
		
		
		request.getRequestDispatcher("/jspweb/webyd.jsp").forward(request, response);
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
