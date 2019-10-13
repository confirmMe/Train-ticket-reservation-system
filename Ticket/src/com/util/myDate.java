package com.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.sun.org.apache.bcel.internal.generic.NEW;


/**
 * 该工具类用于模糊查询页面时间参数的转换
 * @author ysw
 *
 */
public class myDate {
public static long parse(String date) throws ParseException {
	  
	    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");//24小时制 //  
	    long time = simpleDateFormat.parse(date).getTime(); 
	    return time;
}
public static String newdate(){
	 SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd-HH-mm");//24小时制 //  
	 return simpleDateFormat.format(new Date());
}
public static void main(String[] args) throws ParseException {
//	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");//设置日期格式
//	System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
	System.out.println(parse("2019-06-11 12:00"));


}	 
 
}
