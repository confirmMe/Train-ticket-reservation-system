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

public class Weblogin extends HttpServlet {
    //用户登录
	/**
	 * Constructor of the object.
	 */
	public Weblogin() {
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
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String sql = "select * from webuser where username='"+username+"' and password='"+password+"'";
		DataBase db = new DataBase();
		List<Object> list = db.doSelect(sql);
		if(list.size()>0){
			if(!((HashMap)list.get(0)).get("isnot").equals("1")){
				request.setAttribute("username",((HashMap)list.get(0)).get("username"));
				HttpSession session = request.getSession();
				//在登陆成功后将用户信息通过全局对象保存
				session.setAttribute("username",((HashMap)list.get(0)).get("username"));
				request.setAttribute("name",((HashMap)list.get(0)).get("name"));
				response.sendRedirect(request.getContextPath() + "/servlet/Webgg");
			}else{
				request.setAttribute("message","您的账号已经被停用，请联系系统管理员");
				request.getRequestDispatcher("/jspweb/weblogin.jsp").forward(request, response);
			}
		}else{
			request.setAttribute("message","密码错误或账号不存在");
			request.getRequestDispatcher("/jspweb/weblogin.jsp").forward(request, response);
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
