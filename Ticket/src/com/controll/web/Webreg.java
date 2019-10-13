package com.controll.web;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.database.DataBase;
import com.util.myDate;

public class Webreg extends HttpServlet {
    //用户注册
	/**
	 * Constructor of the object.
	 */
	public Webreg() {
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
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sf.format(new Date());
		String filename=null;
		
		DiskFileItemFactory dfif = new DiskFileItemFactory();
		// 使用工厂创建解析器对象
		ServletFileUpload fileUpload = new ServletFileUpload(dfif);
		fileUpload.setSizeMax(80*1024);
		try {
			// 使用解析器对象解析request，得到FileItem列表
			List<FileItem> list2 = fileUpload.parseRequest(request);
			// 遍历所有表单项
			Map map = new HashMap<>();
			for(FileItem fileItem : list2) {
				// 如果当前表单项为普通表单项
				if(!fileItem.isFormField()) {
					//如果当前表单项不是普通表单项，说明就是文件字段
					
					Random random = new Random();
					int end3 = random.nextInt(999);
					//如果不足三位前面补0
					String onlyid =  String.format("%03d", end3);	
					filename = myDate.newdate()+"-"+onlyid+"-"+fileItem.getName();//获取上传文件的名称
					 
					 if(!filename.toLowerCase().endsWith(".jpg")) {
						 request.setAttribute("message","图片格式错误，请正确输入");
						 request.getRequestDispatcher("/jspweb/weblogin.jsp").forward(request, response);
							return;
						}
					// 获取真实路径，对应${项目目录}/uploads，当然，这个目录必须存在
					String savepath = this.getServletContext().getRealPath("/uploads");
					// 通过uploads目录和文件名称来创建File对象
					File file = new File(savepath, filename);
					// 把上传文件保存到指定位置
					fileItem.write(file);
				}else{
					map.put(fileItem.getFieldName(), fileItem.getString("UTF-8"));
				}
			 }
			DataBase db = new DataBase();
			List list=db.doSelect("select * from webuser where username='"+map.get("username")+"'");
			List list1=db.doSelect("select * from webuser where studentNum='"+map.get("studentNum")+"' ");
			if(list.size()==0){
				if(list1.size()==0||map.get("isStudent").equals("0")){
					String sql = "insert into webuser (username,password,name,phone,bodyid,date,email,address,sex,isStudent,money,isnot,isAudit,studentNum,image) values ('"+map.get("username")+"','"+map.get("password")+"','"+map.get("name")+"','"+map.get("phone")+"','"+map.get("bodyid")+"','"+date+"','"+map.get("email")+"','"+map.get("address")+"','"+map.get("sex")+"','"+map.get("isStudent")+"',0,1,1,'"+map.get("studentNum")+"','"+filename+"')";
					db.doAdd(sql);
			request.setAttribute("message","注册成功，请等待管理员审核！");
				}else{
					request.setAttribute("message","学生证号码已被认证！");
				}
			}else{
			request.setAttribute("message","用户名已经存在！");
			}
			request.getRequestDispatcher("/jspweb/weblogin.jsp").forward(request, response);
			
			} catch (Exception e) {
				request.setAttribute("message","图片的格式超过了80KB");
				request.getRequestDispatcher("/jspweb/weblogin.jsp").forward(request, response);
				return;
		} 	
	}
	/**
	 * Initialization of the servlet. <br>
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}
}
