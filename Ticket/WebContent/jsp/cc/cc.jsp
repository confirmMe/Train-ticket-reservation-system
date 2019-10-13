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
  </head>
  <body>
  <p>
  	<input type="button" value="添加车次信息" onclick="javascript:location.href='<%=basePath%>jsp/cc/ccAdd.jsp'"/>
  </p>
    	<table class="altrowstable" id="alternatecolor" width="99%;">
    		<tr>
	    		<th>
	    			车次编号
	    		</th>
	    		<th>
	    			车次名称
	    		</th>
	    		<th>
	    			始发站
	    		</th>
	    		<th>
	    			终点站
	    		</th>
	    		<th>
	    			发车时间
	    		</th>
	    		<th>
	    			到达时间
	    		</th>
	    		<th>
	    			软卧剩余票数
	    		</th>
	    		<th>
	    			软卧价格
	    		</th>
	    		<th>
	    			硬卧剩余票数
	    		</th>
	    		<th>
	    			硬卧价格
	    		</th>
	    		<th>
	    			硬座剩余票数
	    		</th>
	    		<th>
	    			硬座价格
	    		</th>
	    		<th>
	    			站票剩余票数
	    		</th>
	    		<th>
	    			站票价格
	    		</th>
	    		<th>
	    			途中经过车站数
	    		</th>
	    		<th>
	    			操作
	    		</th>
    		</tr>
   			<c:forEach var="u" items="${list}">
    		<tr>
   				<td>${u.ccid }</td>
   				<td>${u.ccname }</td>
   				<td>${u.start }</td>
   				<td>${u.end }</td>
   				<td>${u.time }</td>
   				<td>${u.reachtime }</td>
   				<td>${u.rwpage }</td>
   				<td>${u.rwpice }</td>
   				<td>${u.ywpage }</td>
   				<td>${u.ywpice }</td>
   				<td>${u.yzpage }</td>
   				<td>${u.yzpice }</td>
   				<td>${u.wzpage }</td>
   				<td>${u.wzpice }</td>
   				<td>${u.count }</td>
   				<td align="center">
					<a href="<%=basePath%>servlet/CcDetail?id=${u.id}">详细</a>
					<a href="<%=basePath%>servlet/CcEdit?id=${u.id}">修改</a>
					<a href="<%=basePath%>servlet/CcDel?id=${u.id}">删除</a>
				</td>
    		</tr>
   			</c:forEach>
   			<tr align="center">
		    	<td colspan="100">
		    		共${count }条记录&nbsp;&nbsp;&nbsp;&nbsp;
		    		 当前第${pages }页/共${lastpage }页&nbsp;&nbsp;&nbsp;&nbsp;
		    		<%
		    		if((Integer)request.getAttribute("pages")!=1){
		    		%>
		    		<a href="<%=basePath%>servlet/Cc?currentpage=1">首页</a>
		    		<a href="<%=basePath%>servlet/Cc?currentpage=${pages-1}">上一页</a>
		    		<%} %>
		    		<%
		    		if((Integer)request.getAttribute("pages")!=(Integer)request.getAttribute("lastpage")){
		    		%>
		    		<a href="<%=basePath%>servlet/Cc?currentpage=${pages+1}">下一页</a>
		    		<a href="<%=basePath%>servlet/Cc?currentpage=${lastpage}">尾页</a>
		    		<%} %>
		    	</td>
		    </tr>
    	</table>
  </body>
</html>
