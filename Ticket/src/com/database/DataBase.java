package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DataBase {

	//数据库的连接会话
	private Connection con;
	private Statement  st;
	private ResultSet  rs;
	//驱动名称
	private final static String driver="com.mysql.jdbc.Driver";
	//访问数据库的地址
	private final static String url="jdbc:mysql://127.0.0.1:3306/hcmanage?useUnicode=true&characterEncoding=utf-8";
	//访问数据库的用户名
	private final static String username="root";
	//访问数据库的密码
	private final static String password="123";
	/**
	 * 作用：建立与数据库的连接，并得到与数据库的会话结果
	 */
	public Connection getcon(){
		try {
			//注册jdbc驱动程序
			Class.forName(driver);
			//建立与数据的连接，并得到一个会话
			con=DriverManager.getConnection(url,username,password);
			//System.out.println("正在进行数据库连接--"+con);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}

	//添加数据
	public boolean doAdd(String sql){
		boolean falg=false;
		//得到会话
		con=getcon();
		//创建sql语句
		//执行sql语句
		try {
			st=con.createStatement();
			//数据更新:增加，删除，修改
			st.executeUpdate(sql);
			falg=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			try {
				st.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return falg;
	}
	
	//数据修改
	public boolean doUpdate(String sql){
		boolean flag=false;
		//获取会话对象
		con=getcon();
		try {
			st=con.createStatement();
			//执行sql语句
			st.executeUpdate(sql);
			flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				st.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return flag;
	}
	//删除数据
	public boolean doDelete(String sql){
		boolean flag=false;
		//获取会话对象
		con=getcon();
		try {
			st=con.createStatement();
			st.executeUpdate(sql);
			flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				st.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return flag;
	}
	//数据查询
	public List<Object> doSelect(String sql){
		List<Object> list=new ArrayList<Object>();
		Map<Object,Object> map=null;
		//获取会话对象
		con=getcon();
		try {
			st=con.createStatement();
			rs=st.executeQuery(sql);
			//获取列数
			int lcount=rs.getMetaData().getColumnCount();
			//int hcount=rs.getRow();
			while(rs.next()){
				map=new HashMap<Object,Object>();
				for(int i=1;i<=lcount;i++){
					map.put(rs.getMetaData().getColumnName(i), rs.getObject(i));
				}
				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				st.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return list;
	}
	//查询总记录条数
	public int getCount(String sql){
		int count=0;
		con=getcon();
		try {
			st=con.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()){
				count++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				st.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return count;
	}
//	public static void main(String[] args) {
//		DataBase db=new DataBase();
//		System.out.println(db.getcon());
//		System.out.println(db.getCount("select * from webuser"));
//		
//	}
}
