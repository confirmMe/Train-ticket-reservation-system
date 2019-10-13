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
    
    <title>My JSP 'userEdit.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/table_com.css">
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.7.2.min.js"></script>
  </head>
  
  <body>
  	<form action="<%=basePath%>servlet/UserDoEdit" method="post" onsubmit="return checkDate();">
    <table class="altrowstable" id="alternatecolor" width="99%;">
    		<tr>
	    		<th>
	    			车次编号
	    		</th>
	    		<td>
	    			${c.ccid }
	    		</td>
	    		<th>
	    			车次名称
	    		</th>
	    		<td>
	    			${c.ccname }
	    		</td>
	    		<th>
	    			始发站
	    		</th>
	    		<td>
	    			${c.start }
	    		</td>
    		</tr>
    		<tr>
	    		<th>
	    			终点站
	    		</th>
	    		<td>
	    			${c.end }
	    		</td>
	    		<th>
	    			软卧剩余票数
	    		</th>
	    		<td>
	    			${c.rwpage }
	    		</td>
	    		<th>
	    			软卧价格
	    		</th>
	    		<td>
	    			${c.rwpice }
	    		</td>
    		</tr>
    		<tr>
	    		<th>
	    			硬卧剩余票数
	    		</th>
	    		<td>
	    			${c.ywpage }
	    		</td>
	    		<th>
	    			硬卧价格
	    		</th>
	    		<td>
	    			${c.ywpice }
	    		</td>
	    		<th>
	    			硬座剩余票数
	    		</th>
	    		<td>
	    			${c.yzpage }
	    		</td>
    		</tr>
    		<tr>
	    		<th>
	    			硬座价格
	    		</th>
	    		<td>
	    			${c.yzpice }
	    		</td>
	    		<th>
	    			站票剩余票数
	    		</th>
	    		<td>
	    			${c.wzpage }
	    		</td>
	    		<th>
	    			站票价格
	    		</th>
	    		<td>
	    			${c.wzpice }
	    		</td>
	    		
    		</tr>
    		<tr>
    		<th>
	    			类型
	    		</th>
	    		<td>
	    			 
	    		<c:if test="${c.cartype=='K'}">
   					快车
   				</c:if>
   				<c:if test="${c.cartype=='T'}">
   					特快
   				</c:if>
   				<c:if test="${c.cartype=='G'}">
   					高铁
   				</c:if>
	    		</td>
    		</tr>
    		<tr>
	    		<th>
	    			发车时间
	    		</th>
	    		<td colspan="111">
	    			${c.time }
	    		</td>
    		</tr>
    		<tr>
	    		<th>
	    			到达时间
	    		</th>
	    		<td colspan="111">
	    			${c.reachtime }
	    		</td>
    		</tr>
    		<tr>
	    		<th>
	    			途中经过车站
	    		</th>
	    		<td colspan="5">
	    			<table class="altrowstable" id="alternatecolor" width="99%;">
			    		<tr>
				    		<th>车站名称</th>
				    		<th>到站时间</th>
				    	</tr>
				    	<c:forEach var="g" items="${list1}">
			    		<tr>
				    		<td>${g.glzname }</td>
				    		<td>${g.glztime }</td>
				    	</tr>
				    	</c:forEach>
			    	</table>
	    		</th>
	    		</td>
    		</tr>
    		<tr>
	    		<td colspan="6" align="center">
	    			<input type="button" value="返  回" onclick="history.go(-1);"/>
	    		</td>
    		</tr>
    	</table>
    	</form>
  </body>
</html>
