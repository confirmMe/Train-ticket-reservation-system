package com.controll.webgg;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.DataBase;

public class Webgg extends HttpServlet {
//展示车次以及公告信息的后50条数据
	/**
	 * Constructor of the object.
	 */
	public Webgg() {
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
		
		//获取ggtable的后50条数据
	    int ggres=db.getCount("select * from ggtable")-50;
	    if(ggres<0){
	    	ggres=0;
	    }
	    
		String sql = "select * from ggtable order by id desc limit "+ggres+",50";
		List<Object> list = db.doSelect(sql);
		request.setAttribute("gglist", list);
		
		
		//获取cctable的后50条数据
	    int ccres=db.getCount("select * from cctable")-50;
	    if(ccres<0){
	    	ccres=0;
	    }
	   
		String ccsql = "select * from cctable order by id desc limit "+ccres+",50";
		List<Object> clist = db.doSelect(ccsql);
		request.setAttribute("cclist", clist);
		
		
		HttpSession session = request.getSession();
		if(session.getAttribute("username")!=null&&!"".equals(session.getAttribute("username"))){
			request.setAttribute("username1","当前登录用户："+session.getAttribute("username"));
 
		}
		request.getRequestDispatcher("/jspweb/web.jsp").forward(request, response);
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
