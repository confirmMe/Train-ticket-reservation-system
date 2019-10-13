package com.controll.cc;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.DataBase;
import com.util.UserHis;

public class CcDel extends HttpServlet {
    //删除车次信息，同时删除车站表上的失效信息
	/**
	 * Constructor of the object.
	 */
	public CcDel() {
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
		DataBase db = new DataBase();
		
		//获取到即将删除的车次信息
		List list=db.doSelect("select * from cctable where id ='"+id+"'");
		HashMap map  = (HashMap) list.get(0);
		//只有订单表和历史表没有数据时，才会删除车次数据
		String ccid =(String) map.get("ccid");
		List list1=db.doSelect("select * from corder where ccid ='"+ccid+"'");

 
		if(list1.size()==0){
		String sql = "delete from cctable where id='"+id+"'";
		db.doDelete(sql);
		String delSql = "delete from glztable where ccid='"+id+"'";
		db.doDelete(delSql);
		UserHis.addHis(session.getAttribute("BossName").toString(), "删除车次", map.get("ccname").toString());
		}
		response.sendRedirect(request.getContextPath() + "/servlet/Cc");
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
