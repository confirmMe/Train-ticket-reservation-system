<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'user.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/table_com.css">
  <script type="text/javascript" src="<%=basePath%>js/table.js"></script>
  </head>
  <body>
    	<table class="altrowstable" id="alternatecolor" width="99%;">
    		<tr>
	    		<th>
	    			管理员
	    		</th>
	    		<th>
	    			操作
	    		</th>
	    		<th>
	    			对象
	    		</th>
	    		<th>
	    			日期
	    		</th>
	    		 

	    		
    		</tr>
   			<c:forEach var="u" items="${list}">
    		<tr>
   				<td>${u.user }</td>
   				<td>${u.type }</td>
   				<td>${u.value }</td>
   				<td>${u.date}</td>
   				 
   				
    		</tr>
   			</c:forEach>
   			<tr align="center">
		    	<td colspan="8">
		    		
		    		
		    		
		    		
		    		
		    		
		    	</td>
		    </tr>
    	</table>
  </body>
</html>
