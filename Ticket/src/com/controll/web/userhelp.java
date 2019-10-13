package com.controll.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.DataBase;
import com.sun.javafx.collections.MappingChange.Map;

public class userhelp extends HttpServlet {
    //用户界面协助
	/**
	 * Constructor of the object.
	 */
	public userhelp() {
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
		String key = request.getParameter("key");
		DataBase db = new DataBase();
		String sql = "select h.* from help h where h.key like '%"+key+"%' ";
		List<Object> list = db.doSelect(sql);
		if(list.size()==0||key==""){
		request.setAttribute("c","很抱歉，暂时无法解决您的问题，请您致电我们，我们将尽快解决您的问题 ！");
		}else{
			StringBuffer sb=new StringBuffer();
			for(int i=0;i<list.size();i++){
				HashMap map = (HashMap) list.get(i);
				sb.append(map.get("value").toString());
				sb.append("<hr/>");
			}
		
		request.setAttribute("c",sb.toString());
		}
		 
		 
		request.getRequestDispatcher("/jspweb/help.jsp").forward(request, response);
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
