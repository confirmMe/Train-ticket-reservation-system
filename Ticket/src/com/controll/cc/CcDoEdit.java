package com.controll.cc;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.DataBase;
import com.util.myDate;

public class CcDoEdit extends HttpServlet {
	//编辑车次信息，同时删除原来的车站信息，增加新的车站信息

	/**
	 * Constructor of the object.
	 */
	public CcDoEdit() {
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
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String ccid = request.getParameter("ccid");
		String ccname = request.getParameter("ccname");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String time = request.getParameter("time");
		String reachtime = request.getParameter("reachtime");
		Long realtime=0l;
		try {
			realtime = myDate.parse(time);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String rwpage = request.getParameter("rwpage");
		String rwpice = request.getParameter("rwpice");
		String ywpage = request.getParameter("ywpage");
		String ywpice = request.getParameter("ywpice");
		String yzpage = request.getParameter("yzpage");
		String yzpice = request.getParameter("yzpice");
		String wzpage = request.getParameter("wzpage");
		String wzpice = request.getParameter("wzpice");
		String cartype = request.getParameter("cartype");
		String glzname[] = request.getParameterValues("glzname");
		String glztime[] = request.getParameterValues("glztime");
		DataBase db = new DataBase();
		String sql = "update cctable set ccid='" + ccid + "',ccname='" + ccname
				+ "',start='" + start + "',end='" + end + "',time='" + time
				+ "',rwpage='" + rwpage + "',rwpice='" + rwpice + "',ywpage='"
				+ ywpage + "',ywpice='" + ywpice + "',yzpage='" + yzpage
				+ "',yzpice='" + yzpice + "',wzpage='" + wzpage + "',wzpice='"
				+ wzpice +"',cartype='" + cartype + "',realtime='"+realtime+"',reachtime='"+reachtime+"' where id='" + id + "'";
		db.doUpdate(sql);
		String delSql = "delete from glztable where ccid='"+id+"'";
		db.doDelete(delSql);
		if(glzname!=null&&glztime!=null){
			for(int i=0;i<glzname.length;i++){
				Long glzrealtime=0l;
				try {
					glzrealtime = myDate.parse(glztime[i]);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				String addSql = "insert into glztable (ccid,glzname,glztime,glzrealtime)values('"+id+"','"+glzname[i]+"','"+glztime[i]+"','"+glzrealtime+"')";
				db.doAdd(addSql);
			}
		}
		response.sendRedirect(request.getContextPath() + "/servlet/Cc");
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
