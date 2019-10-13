package com.controll.gg;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.DataBase;
import com.util.UserHis;

public class GgAdd extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GgAdd() {
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
        HttpSession session=request.getSession();
		request.setCharacterEncoding("UTF-8");
		String ggid = request.getParameter("ggid");
		String ggtitle = request.getParameter("ggtitle");
		String ggtext = request.getParameter("ggtext");
		String ggtime = request.getParameter("ggtime");
		DataBase db = new DataBase();
		String writer=session.getAttribute("BossName").toString();
		String sql = "insert into ggtable (ggid,ggtitle,ggtext,ggtime,writer) values ('"+ggid+"','"+ggtitle+"','"+ggtext+"','"+ggtime+"','"+writer+"')";
		db.doAdd(sql);
		UserHis.addHis(writer, "发布公告信息", ggtitle);
		response.sendRedirect(request.getContextPath()+"/servlet/Gg");
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
