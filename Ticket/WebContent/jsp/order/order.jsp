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
	    			订单编号
	    		</th>
	    		<th>
	    			乘车人
	    		</th>
	    		<th>
	    			下单人帐号
	    		</th>
	    		<th>
	    			乘车人手机号
	    		</th>
	    		<th>
	    			乘车人身份证号
	    		</th>
	    		<th>
	    			订购车次编号
	    		</th>
	    		<th>
	    			乘坐方式
	    		</th>
	    		<th>
	    			订票数
	    		</th>
	    		<th>
	    			座号
	    		</th>
	    		<th>
	    			操作
	    		</th>
    		</tr>
   			<c:forEach var="u" items="${list}">
    		<tr>
   				<td>${u.id }</td>
   				<td>${u.name }</td>
   				<td>${u.username }</td>
   				<td>${u.phone }</td>
   				<td>${u.bodyid }</td>
   				<td>${u.ccid }</td>
   				<td> 
   				<c:if test="${u.type=='rw'}">
   					软卧
   				</c:if>
   				<c:if test="${u.type=='yw'}">
   					硬卧
   				</c:if>
   				<c:if test="${u.type=='yz'}">
   					硬座
   				</c:if>
   				<c:if test="${u.type=='wz'}">
   					站票
   				</c:if>
   				</td>
   				<td>${u.num }</td>
   				<td>
   				<c:if test="${u.seatnum==0}">
   					无座位
   				</c:if>
   				<c:if test="${u.seatnum!=0}">
   					${u.seatnum }
   				</c:if>
   				</td>
   				<td align="center">
					<a href="<%=basePath%>servlet/OrderDel?id=${u.id}&flag=0">删除</a>
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
		    		<a href="<%=basePath%>servlet/Order?currentpage=1">首页</a>
		    		<a href="<%=basePath%>servlet/Order?currentpage=${pages-1}">上一页</a>
		    		<%} %>
		    		<%
		    		if((Integer)request.getAttribute("pages")!=(Integer)request.getAttribute("lastpage")){
		    		%>
		    		<a href="<%=basePath%>servlet/Order?currentpage=${pages+1}">下一页</a>
		    		<a href="<%=basePath%>servlet/Order?currentpage=${lastpage}">尾页</a>
		    		<%} %>
		    	</td>
		    </tr>
    	</table>
  </body>
</html>
