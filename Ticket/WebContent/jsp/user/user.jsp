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
	    			用户名
	    		</th>
	    		<th>
	    			密码
	    		</th>
	    		<th>
	    			姓名
	    		</th>
	    		<th>
	    			性别
	    		</th>
	    		<th>
	    			部门
	    		</th>
	    		<th>
	    			角色
	    		</th>
	    		<th>
	    			地址
	    		</th>

	    		<th>
	    			操作
	    		</th>
    		</tr>
   			<c:forEach var="u" items="${list}">
    		<tr>
   				<td>${u.username }</td>
   				<td>${u.password }</td>
   				<td>${u.name }</td>
   				<td>${u.sex }</td>
   				<td>${u.deptname }</td>
   				<td>${u.rolename }</td>
   				<td>${u.address }</td>
   				<td align="center">
					<a href="<%=basePath%>servlet/UserEdit?id=${u.id}">修改</a>
					<a href="<%=basePath%>servlet/UserDel?id=${u.id}">删除</a>
				</td>
    		</tr>
   			</c:forEach>
   			<tr align="center">
		    	<td colspan="8">
		    		共${count }条记录&nbsp;&nbsp;&nbsp;&nbsp;
		    		 当前第${pages }页/共${lastpage }页&nbsp;&nbsp;&nbsp;&nbsp;
		    		<%
		    		if((Integer)request.getAttribute("pages")!=1){
		    		%>
		    		<a href="<%=basePath%>servlet/User?currentpage=1">首页</a>
		    		<a href="<%=basePath%>servlet/User?currentpage=${pages-1}">上一页</a>
		    		<%} %>
		    		<%
		    		if((Integer)request.getAttribute("pages")!=(Integer)request.getAttribute("lastpage")){
		    		%>
		    		<a href="<%=basePath%>servlet/User?currentpage=${pages+1}">下一页</a>
		    		<a href="<%=basePath%>servlet/User?currentpage=${lastpage}">尾页</a>
		    		<%} %>
		    	</td>
		    </tr>
    	</table>
  </body>
</html>
