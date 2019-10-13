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
	    			会员帐号
	    		</th>
	    		<th>
	    			会员登录密码
	    		</th>
	    		<th>
	    			姓名
	    		</th>
	    		<th>
	    			会员身份证号
	    		</th>
	    		<th>
	    			会员手机号
	    		</th>
	    		<th>
	    			状态
	    		</th>
	    		<th>
	    		        是否被审核
	    		</th> 
	    		<th>
	    			注册日期
	    		</th>
	    		<th>
	    			是否学生
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
   				<td>${u.bodyid }</td>
   				<td>${u.phone }</td>
   				<td>
   				<c:if test="${u.isnot==0}">
   					<div style="color:green">正常</div>
   				</c:if>
   				<c:if test="${u.isnot==1}">
   					<div style="color:red">禁用</div>
   				</c:if>
   				</td>
   				<td style="text-align: center;">
   				        <c:if test='${u.isAudit == "0" }'>
			 						<div style="color:green">已被审核</div>
			 					</c:if>
			 					<c:if test='${u.isAudit == "1" }'>
			 						<div style="color:red">未被审核</div>
			 			</c:if>
			 	</td>
   				<td>${u.date }</td>
   				<td>
   			    <c:if test="${u.isStudent==0}">
   					普通用户
   				</c:if>
   				<c:if test="${u.isStudent==1}">
   					学生
   				</c:if>  
   				</td>
   				<td align="center">
   				    <a href="<%=basePath%>servlet/webuserEdit?id=${u.id}&flag=2">修改</a>
   					<c:if test="${u.isnot==0}">
					<a href="<%=basePath%>servlet/WebuserDoEdit?id=${u.id}&isnot=1">禁用</a>
					</c:if>
					<c:if test="${u.isnot==1}">
					<a href="<%=basePath%>servlet/WebuserDoEdit?id=${u.id}&isnot=0">启用</a>
					</c:if>
				</td>
    		</tr>
   			</c:forEach>
   			
    	</table>
  </body>
</html>
