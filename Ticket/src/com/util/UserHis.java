package com.util;

import java.util.Date;

import com.database.DataBase;

public class UserHis {

	public static void addHis(String user,String type,String value){
		DataBase dbBase=new DataBase();
		dbBase.doAdd("insert into userhis (user,type,value,date)values('"+user+"','"+type+"','"+value+"','"+new Date().toString()+"')");
		
	}
}
