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
    <p>
  	<input type="button" value="发布帮助" onclick="javascript:location.href='<%=basePath%>jsp/help/helpAdd.jsp'"/>
  </p>
    	<table class="altrowstable" id="alternatecolor" width="99%;">
    		<tr>
	    		
	    		<th>
	    			关键字
	    		</th>
	    		<th>
	    			帮助内容
	    		</th>
	    		
	    		<th>
	    			操作
	    		</th>
    		</tr>
   			<c:forEach var="u" items="${list}">
    		<tr>
   				<td>${u.key }</td>
   				<td>${u.value }</td>
   				
   				<td align="center">
					<a href="<%=basePath%>servlet/helpEdit?id=${u.id}">修改</a>
					<a href="<%=basePath%>servlet/helpDel?id=${u.id}">删除</a>
				</td>
    		</tr>
   			</c:forEach>
   			
    	</table>
  </body>
</html>
