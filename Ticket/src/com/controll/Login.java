package com.controll;

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

public class Login extends HttpServlet {

	//管理员登陆
	/**
	 * Constructor of the object.
	 */
	public Login() {
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
		String sql = "select * from user where username='"+username+"' and password='"+password+"'";
		DataBase db = new DataBase();
		List<Object> list = db.doSelect(sql);
		if(list.size()>0){
			HttpSession session=request.getSession();
			session.setAttribute("BossRolename", ((HashMap)list.get(0)).get("rolename"));
			session.setAttribute("BossName", ((HashMap)list.get(0)).get("username"));
			//登陆成功后首先将rolename存储在session中，以限制权限
			request.setAttribute("username",((HashMap)list.get(0)).get("username"));
			request.setAttribute("rolename",((HashMap)list.get(0)).get("rolename"));
			request.setAttribute("name",((HashMap)list.get(0)).get("name"));
			request.setAttribute("id",((HashMap)list.get(0)).get("id"));
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}else{
			//密码错误
			request.setAttribute("message","密码错误！");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
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
