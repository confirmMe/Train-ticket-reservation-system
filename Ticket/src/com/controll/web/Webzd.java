package com.controll.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.DataBase;

public class Webzd extends HttpServlet {
    //通过车次名称查询
	/**
	 * Constructor of the object.
	 */
	public Webzd() {
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
		String ccid = request.getParameter("ccid");
		DataBase db = new DataBase();
		String sql = "select * from cctable where ccid='"+ccid+"'";
		List<Object> list = db.doSelect(sql);
		if(list.size()!=0){
		HashMap map = (HashMap) list.get(0);
		String id = map.get("id")+"";
		request.setAttribute("c",list.get(0));
		String sql1 = "select g.* from glztable g where ccid ='"+id+"'";
		List<Object> list1 = db.doSelect(sql1);
		request.setAttribute("list1",list1);
		}
		request.setAttribute("listSize",list.size());
		request.setAttribute("ccid",ccid);
		request.getRequestDispatcher("/jspweb/webzd.jsp").forward(request, response);
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
