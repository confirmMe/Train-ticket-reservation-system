package com.controll.cc;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.DataBase;

public class Cc extends HttpServlet {
//管理员界面的车次信息显示
	/**
	 * Constructor of the object.
	 */
	public Cc() {
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
		//分页显示车次信息
		String sql1 = "select * from cctable";
		int count=db.getCount(sql1);
		//计算数据个数
		int lastpage=0;
		if(count%10==0){
			lastpage=count/10;
		}else{
			lastpage=count/10+1;
		}
		int qswz = (page-1)*10;
		//这行sql的意义是回显车次的列表，并且返回每个车次经过了几个车站
		String sql = "select c.*,count(g.id) count from cctable c left join glztable g on c.id=g.ccid group by c.id limit "+qswz+",10";
		List<Object> list = db.doSelect(sql);
         
		request.setAttribute("lastpage", lastpage);

		request.setAttribute("count", count);
		request.setAttribute("pages", page);
		request.setAttribute("list",list);
		request.getRequestDispatcher("/jsp/cc/cc.jsp").forward(request, response);
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
