package com.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

 

public class test {
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
				 list.add(fdindex(arr, obj.toString()));
			 }
		 }
		 return list;
	 }
	public static int fdindex(String [] arr,String ele){
		int res=0;
		for(int i=0;i<arr.length;i++){
			if(arr[i].equals(ele)){
				res=i;
				break;
			}
		}
		return res;
	}
	public static void show(List list){
		for(int i=0;i<list.size();i++){
			System.out.println(list.get(i));
		}
	}
public static void main(String[] args) {
	
//	  String [] arr={"kk","k806","hh","kk","k806","k80"};
//	  
//	   show( fd(arr));
	String aString="swsw";
	System.out.println(aString.length());
}
}

