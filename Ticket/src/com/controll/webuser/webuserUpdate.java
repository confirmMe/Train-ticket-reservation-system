package com.controll.webuser;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.DataBase;

public class webuserUpdate extends HttpServlet {
    //编辑用户信息
	/**
	 * Constructor of the object.
	 */
	public webuserUpdate() {
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
 
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String email = request.getParameter("email");
		String money = request.getParameter("money");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String bodyid = request.getParameter("bodyid");
		String isStudent = request.getParameter("isStudent");
		String studentNum=request.getParameter("studentNum");
		DataBase db = new DataBase();
		String sql = "update webuser set username='"+username+"', password='"+password+"',name='"+name+"',sex='"+sex+"',email='"+email+"',money='"+money+"',address='"+address+"',phone='"+phone+"',bodyid='"+bodyid+"',studentNum='"+studentNum+"',isStudent='"+isStudent+"' where id='"+id+"'";
		db.doUpdate(sql);
		response.sendRedirect(request.getContextPath()+"/servlet/Webuser");
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
