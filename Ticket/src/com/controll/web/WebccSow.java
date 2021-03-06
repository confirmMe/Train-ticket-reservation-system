package com.controll.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.DataBase;

public class WebccSow extends HttpServlet {
    //用户界面的车次信息展示
	/**
	 * Constructor of the object.
	 */
	public WebccSow() {
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
		DataBase db = new DataBase();
		int page;
		if(request.getParameter("currentpage")==null){
			page=1;
		}else{
			page=Integer.parseInt(request.getParameter("currentpage"));
		}
		
		String sql1 = "select * from cctable";
		int count=db.getCount(sql1);

		int lastpage=0;
		if(count%10==0){
			lastpage=count/10;
		}else{
			lastpage=count/10+1;
		}
		int qswz = (page-1)*10;
		String sql = "select * from cctable limit "+qswz+",10";
		List<Object> list = db.doSelect(sql);
	
		request.setAttribute("lastpage", lastpage);
	
		request.setAttribute("count", count);
		request.setAttribute("pages", page);
		request.setAttribute("list",list);
		request.getRequestDispatcher("/jspweb/webcc.jsp").forward(request, response);
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
