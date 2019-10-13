package com.controll.web;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;




import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.DataBase;
import com.util.myDate;
import com.util.selFD;



public class Webcc extends HttpServlet {
//根据条件模糊查询车次
//支持查询中间的经过站

	/**
	 * Constructor of the object.
	 */
	public Webcc() {
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
	@SuppressWarnings({ "unchecked", "unused" })
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		
		String cartype = request.getParameter("cartype");
		String starttime = request.getParameter("starttime");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");//设置日期格式
		
		try {
			//筛选掉已经失效的车次信息
			if(myDate.parse(starttime)<=myDate.parse(df.format(new Date()))){
				starttime=df.format(new Date());
			}
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		
		String endtime = request.getParameter("endtime");
		
		Long realstarttime=0l;
		try {
			realstarttime = myDate.parse(starttime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Long realendtime=0l;
		try {
			realendtime = myDate.parse(endtime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		DataBase db = new DataBase();
		int page;
		if(request.getParameter("currentpage")==null){
			page=1;
		}else{
			page=Integer.parseInt(request.getParameter("currentpage"));
		}
		 

        //从起点到终点
		String thing1="select * from cctable where  cartype= '"+cartype+"' and start like '%"+start+"%' and end like '%"+end+"%'  and realtime >= '"+realstarttime+"' and realtime <= '"+realendtime+"' ";
		int count1=db.getCount(thing1 );
		//从起点到中间站
		String thing2="select c.* from cctable c,glztable g where c.cartype= '"+cartype+"' and c.start like '%"+start+"%' and g.glzname like '%"+end+"%' and g.ccid=c.id  and c.realtime >= '"+realstarttime+"' and c.realtime <= '"+realendtime+"'";
        int count2=db.getCount(thing2);
        //从中间站到终点
        String thing3="select c.* from cctable c,glztable g where c.cartype= '"+cartype+"' and c.end like '%"+end+"%' and g.glzname like '%"+start+"%' and g.ccid=c.id and g.glzrealtime >= '"+realstarttime+"' and g.glzrealtime <= '"+realendtime+"'";
		int count3=db.getCount(thing3);
		 
		List<Object> list1 = db.doSelect(thing1);
		List<Object> list2 = db.doSelect(thing2);
		List<Object> list3 = db.doSelect(thing3);
	 
		
		list1.addAll(list2);
		list1.addAll(list3);
 
		
		List<Object> resList=db.doSelect("SELECT * FROM `glztable` where ccid IN (SELECT ccid FROM glztable GROUP BY ccid HAVING COUNT(ccid)>1) AND (glzname = '"+start+"' OR glzname = '"+end+"')");
		
		//该组代码用于删除resList中的无效项
		System.out.println("优化前有效项"+resList.size());
		String [] arr=new String[resList.size()];
		for(int i=0;i<resList.size();i++){
			HashMap  resmapHashMap=(HashMap) resList.get(i);
			arr[i]=  (String) resmapHashMap.get("ccid");
 
		}
        for(int i=0;i<selFD.fd(arr).size();i++){
        	for(int j=0;j<resList.size();j++){
        		if(selFD.fd(arr).get(i).equals(((HashMap) resList.get(j)).get("ccid"))){
        			resList.remove(j);
        			break;
        		}
        	}
        }
        System.out.println("优化后有效项"+resList.size());
        

		int ele=resList.size()/2;
		int count4=0;
		for(int i=0;i<ele;i++){
		HashMap map1  = (HashMap) resList.get(2*(i+1)-2);
		HashMap map2  = (HashMap) resList.get(2*(i+1)-1);
		if(map1.get("glzname").equals(start)){
			String ccid=(String) map1.get("ccid");
			String en1=(String) map1.get("glztime");//出发站
			String en2=(String) map2.get("glztime");//结束站
			try {
				if(myDate.parse(en1)<myDate.parse(en2)&&realstarttime<myDate.parse(en1)&&myDate.parse(en1)<realendtime){
					
					if(list1.addAll(db.doSelect("select * from cctable where id='"+ccid+"' AND cartype='"+cartype+"' "))){
						count4++;
					}
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}else{
			String ccid=(String) map2.get("ccid");
			String en1=(String) map2.get("glztime");//出发站
			String en2=(String) map1.get("glztime");//结束站
			try {
				if(myDate.parse(en1)<myDate.parse(en2)&&realstarttime<myDate.parse(en1)&&myDate.parse(en1)<realendtime){
					
					if(list1.addAll(db.doSelect("select * from cctable where id='"+ccid+"' AND cartype='"+cartype+"'"))){
						count4++;
					}
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		}
		int count=count1+count2+count3+count4;
		System.out.println("起点终点，起点中转，中转终点，中转中转"+count1+"-"+count2+"-"+count3+"-"+count4);
 
		request.setAttribute("start",start);
		request.setAttribute("end",end);
		request.setAttribute("starttime",starttime);
		request.setAttribute("endtime",endtime);
		request.setAttribute("cartype",cartype);
 
		request.setAttribute("lastpage", 1);

		request.setAttribute("count", count);
		request.setAttribute("pages", 1);
		request.setAttribute("list",list1);
		HttpSession session = request.getSession();
		request.setAttribute("username",session.getAttribute("username"));
	
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
