package com.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * 该工具类用于优化查询的搜索引擎
 * @author ysw
 *
 */
public class selFD {

	public static List  fd(String [] arr){
		 List list=new ArrayList();
		 Map map=new HashMap<>();
		 for(int i=0;i<arr.length;i++){
			 if(map.get(arr[i])==null){
				 map.put(arr[i], 1);
			 }else{
				 map.put(arr[i], Integer.parseInt( map.get(arr[i]).toString())+1);
			 }
		 }
		 for(Object obj:map.keySet()){
			 if((Integer)map.get(obj)==1){           
				 list.add(obj.toString());
			 }
		 }
		 return list;
	 }
	 
	public static void main(String[] args) {
		 
		List list=new ArrayList<>();
		list.add("1");
		list.add("2");
		list.add("2");
		list.add("1");
		list.add("3");
		list.add("4");
		
		String  [] a={"3","4"};
		for(int i=0;i<a.length;i++){
			for(int j=0;j<list.size();j++){
				if(a[i].equals(list.get(j))){
					list.remove(j);
					break;
				}
			}
		}
		
		
		System.out.println(list.get(0));
		System.out.println(list.get(1));
		System.out.println(list.get(2));
		System.out.println(list.get(3));
		System.out.println(list.size());
	}
	 
		 
			 
			 
		 
 
 
}
