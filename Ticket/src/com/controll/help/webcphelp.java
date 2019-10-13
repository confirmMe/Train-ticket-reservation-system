package com.controll.help;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.DataBase;

public class webcphelp extends HttpServlet {


	//查询用户最近购买的车票，只能显示3个
	/**
	 * Constructor of the object.
	 */
	public webcphelp() {
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
	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        HttpSession session=request.getSession();
		request.setCharacterEncoding("UTF-8");
		DataBase db = new DataBase();
		String username=(String) session.getAttribute("username");
		if(username!=null){
		List list=db.doSelect("select * from selecthis where username='"+username+"' ORDER BY selsum DESC");
		StringBuffer sb=new StringBuffer();
		if(list!=null){
			int ele=list.size()>=5?5:list.size();
			for(int i=0;i<ele;i++){
				HashMap map=(HashMap) list.get(i); 
				sb.append("<A href='servlet/Webyd?id="+map.get("selvalue")+"'>"+map.get("ccid")+"</A>");
				sb.append("         ");
			}	
		}
		request.setAttribute("maybe", sb.toString());
		}
		request.getRequestDispatcher("/jspweb/webcp.jsp").forward(request, response);
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
