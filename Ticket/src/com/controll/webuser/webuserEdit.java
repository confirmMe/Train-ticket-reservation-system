package com.controll.webuser;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.DataBase;

public class webuserEdit extends HttpServlet{

	/**
	 * 在修改用户信息时，回显用户信息
	 */
	public webuserEdit() {
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
		String flag = request.getParameter("flag");
		String id = request.getParameter("id");
		DataBase db = new DataBase();
		String sql = "select * from webuser where id='"+id+"'";
		List<Object> list = db.doSelect(sql);
		request.setAttribute("user",list.get(0));
		if(flag.equals("1")){
			request.getRequestDispatcher("/jspweb/userinfoEdit.jsp").forward(request, response);	
		}else{
			request.getRequestDispatcher("/jsp/webuser/webuserEdit.jsp").forward(request, response);	
		}
		
		}
		
}
