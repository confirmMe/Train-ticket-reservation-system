package com.controll.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.DataBase;
import com.util.myDate;

public class OrderChange extends HttpServlet {
    //改签火车票
	//选择具体需要改签到哪个车次
	/**
	 * Constructor of the object.
	 */
	public OrderChange() {
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
		DataBase db = new DataBase();
		request.setCharacterEncoding("UTF-8");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		
		String cartype = request.getParameter("cartype");
		String starttime = request.getParameter("starttime");
		String endtime = request.getParameter("endtime");
		Long  mystarttime=0l;
		Long  myendtime=0l;
		
		//将用户输入的时间段转换为毫秒值
		if(starttime!=null&&endtime!=null){
		try {
			  mystarttime=myDate.parse(starttime);
		} catch (ParseException e) {
		}
		try {
			  myendtime=myDate.parse(endtime);
		} catch (ParseException e) {
		}
		}
		
		//获取当前时间的毫秒值
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");//设置日期格式
		String nowdate=df.format(new Date());
		Long nowrealtime=0l;
		try {
			 nowrealtime=myDate.parse(nowdate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		//粗糙查询
		StringBuffer sb = new StringBuffer();
		sb.append("select * from cctable where 1=1 and realtime >= '"+nowrealtime+"'");
		if(cartype != null && !"".equals(cartype)){
			sb.append(" and cartype = '"+cartype+"' ");	
		}
		if(start != null && !"".equals(start)){
			sb.append(" and start like '%"+start+"%' ");

		}
		if(end != null && !"".equals(end)){
			sb.append(" and end like '%"+end+"%' ");
		}
		if(starttime != null && !"".equals(starttime) && endtime != null && !"".equals(endtime) ){
			sb.append("  and realtime >= '"+mystarttime+"' and realtime <= '"+myendtime+"'  ");
		}
		
		int count=db.getCount(sb.toString());
		List<Object> list = db.doSelect(sb.toString());
		request.setAttribute("start",start);
		request.setAttribute("end",end);
		request.setAttribute("starttime",starttime);
		request.setAttribute("endtime",endtime);

		request.setAttribute("count", count);

		request.setAttribute("list",list);
		HttpSession session = request.getSession();
		request.setAttribute("username",session.getAttribute("username"));
		
	
		request.setAttribute("oldid",id);//订单的id
		request.getRequestDispatcher("/jspweb/webchange.jsp").forward(request, response);
		


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
