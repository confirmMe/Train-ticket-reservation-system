package com.util;

import java.util.HashMap;
import java.util.List;

import com.database.DataBase;

public class findTicket {
public static Integer find(String ccid,String username,String type){
	DataBase db =new DataBase();
	Integer element=0;
	//初步计算票价
	StringBuffer checkBuffer=new StringBuffer();
    checkBuffer.append("select * from cctable where ccid ='"+ccid+"' ");
    //查询cctable的指定车次是否还有票  
	List<Object> checkValList=db.doSelect(checkBuffer.toString());
	HashMap valmap  = (HashMap) checkValList.get(0);
 
		 
	element=Integer.valueOf(valmap.get(type+"pice").toString());
	 
	//再次计算票价
	System.out.println("开始计算票价");
	String sql1 ="select * from webuser where name='"+username+"'";
	List<Object> list1 = db.doSelect(sql1);
	if(((HashMap)list1.get(0)).get("isStudent").equals("1")){
		 element=element/2;
		 System.out.println("学生票"+element); 
	} 
	System.out.println("最终票价为"+element);
	return element;
}
 
}
