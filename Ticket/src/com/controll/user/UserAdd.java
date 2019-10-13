package com.controll.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.DataBase;
import com.util.UserHis;

public class UserAdd extends HttpServlet {
    //增加新管理员
	/**
	 * Constructor of the object.
	 */
	public UserAdd() {
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
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String deptname = request.getParameter("deptname");
		String rolename = request.getParameter("rolename");
		String address = request.getParameter("address");
		DataBase db = new DataBase();
		
		HttpSession session=request.getSession();
		if((session.getAttribute("BossRolename")).equals("系统管理员")){
		String sql = "insert into user (username,password,name,sex,deptname,rolename,address) values ('"+username+"','"+password+"','"+name+"','"+sex+"','"+deptname+"','"+rolename+"','"+address+"')";
		db.doAdd(sql);
		UserHis.addHis(session.getAttribute("BossName").toString(), "新增管理员",  username);
		response.sendRedirect(request.getContextPath()+"/servlet/User");
		}else{
		request.setAttribute("msg", "sorry");
		request.getRequestDispatcher("/error.jsp").forward(request, response);	
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
