package com.controll.webuser;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.If;

import com.database.DataBase;
import com.util.UserHis;

public class WebuserDoEdit extends HttpServlet {

	//设置禁用或者启动某个账号
	/**
	 * Constructor of the object.
	 */
	public WebuserDoEdit() {
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
		HttpSession session=request.getSession();
		String id = request.getParameter("id");
		String isnot = request.getParameter("isnot");
		DataBase db = new DataBase();
		List list=db.doSelect("select * from webuser where id='"+id+"'");
		HashMap map=(HashMap) list.get(0);
		
		String sql = "update webuser set isnot='"+isnot+"' ,isAudit=0 where id='"+id+"'";
		db.doUpdate(sql);
		String flag="启用"+map.get("username").toString();
		if(isnot.equals("1")){
			flag="禁用"+map.get("username").toString();
		}
		UserHis.addHis(session.getAttribute("BossName").toString(), "权限操作", flag );
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
