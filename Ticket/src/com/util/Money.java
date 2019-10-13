package com.util;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.database.DataBase;

public class Money {

	public static void spend(String value,String username,String ccid){
		//value是金额，username是登录用户名，ccid是车次代号
		//1是进账，0是出账
		DataBase db = new DataBase();
		db.doUpdate("update webuser set money=money+'"+value+"' where username='"+username+"'");
		List list=db.doSelect("select * from webuser where username='"+username+"'");
		HashMap map  = (HashMap)  list.get(0);
		String remain=(String) map.get("money");
		db.doUpdate("insert into webuserhis ( user , ccid,money,edittype,remain,datetime) values ('"+username+"','"+ccid+"','"+value+"',1,'"+remain+"','"+new Date().toString()+"' )");
	}
	public static void add(String value,String username,String ccid){
		DataBase db = new DataBase();
		db.doUpdate("update webuser set money=money+'"+value+"'  where username='"+username+"'");
		List list=db.doSelect("select * from webuser where username='"+username+"'");
		HashMap map  = (HashMap)  list.get(0);
		String remain=(String) map.get("money");
		db.doUpdate("insert into webuserhis ( user , ccid,money,edittype,remain,datetime) values ('"+username+"','"+ccid+"','"+value+"',0,'"+remain+"','"+new Date().toString()+"' )");
	}
	
	public static boolean enough(String username,Integer element){
		DataBase db = new DataBase();
		List list=db.doSelect("select * from webuser where username='"+username+"'");
		HashMap map  = (HashMap)  list.get(0);
		if(Integer.valueOf(map.get("money").toString())>element){
			return true;
		}else{
			return false;
		}
	}
 
}
