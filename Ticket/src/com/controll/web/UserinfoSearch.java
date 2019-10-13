package com.controll.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.DataBase;

public class UserinfoSearch extends HttpServlet {
    //用户登录后查看自己的信息
	/**
	 * Constructor of the object.
	 */
	public UserinfoSearch() {
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
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");

		if(username!=null&&!"".equals(username)){
			DataBase db = new DataBase();

			//得到总记录条数
			String sql1 = "select * from webuser ";			
			sql1+=" where username = '"+username+"' ";

			


			List<Object> list = db.doSelect(sql1);
			request.setAttribute("count", "1");
			request.setAttribute("list",list);
			request.getRequestDispatcher("/jspweb/userinfo.jsp").forward(request, response);
		}else{
			request.setAttribute("message","您还没有登录，登录后才能查看您的信息！");
			request.getRequestDispatcher("/jspweb/userinfo.jsp").forward(request, response);
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
