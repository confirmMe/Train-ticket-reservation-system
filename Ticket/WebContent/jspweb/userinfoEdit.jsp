<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
  	<script type="text/javascript" src="<%=basePath%>js/table.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.7.2.min.js"></script>
  <script type="text/javascript">
  	function checkDate(){
	 
		var password = $("#password").val();
		  if(password==null||password==''){
			alert("密码不能为空！");
			return false;
		}else{
			return true;
		}
  	}
  </script>
  </head>
  
  <body>
  	<form action="<%=basePath%>servlet/userinfoUpdate" method="post" onsubmit="return checkDate();">
    <table class="altrowstable" id="alternatecolor" width="99%;">
    		<tr>
	    		 
	    		<th>
	    			密码
	    		</th>
	    		<td>
	    	    	<input type="hidden" name="id" value="${user.id }"/>
	    			<input type="text" id="password" name="password" value="${user.password }"/>
	    		</td>
	    		<th>
	    			姓名
	    		</th>
	    		<td>
	    			<input type="text" id="name" name="name" value="${user.name }"/>
	    		</td>
    		</tr>
    		<tr>
	    		<th>
	    			性别
	    		</th>
	    		<td>
	    			<input type="text" id="sex" name="sex" value="${user.sex }"/>
	    		</td>
	    		<th>
	    			身份证号
	    		</th>
	    		<td>
	    			<input type="text" id="bodyid" name="bodyid" value="${user.bodyid }"/>
	    		</td>
	    		<th>
	    			地址
	    		</th>
	    		<td>
	    			<input type="text" id="address" name="address" value="${user.address }"/>
	    		</td>
	    		 
	    		 
    		</tr>
    		<tr>
	    		<th>
	    			电话
	    		</th>
	    		<td colspan="5">
	    			<input type="text" id="phone" name="phone" value="${user.phone }"/>
	    		</td>
    		</tr>
    		
    		<tr>
	    		<th>
	    			email
	    		</th>
	    		<td colspan="5">
	    			<input type="text" id="eamil" name="email" value="${user.email }"/>
	    		</td>
    		</tr>
    		<tr>
	    		<td colspan="6" align="center">
	    			<input type="submit" value="提  交"/>
	    			<input type="button" value="取  消" onclick="history.go(-1);"/>
	    		</td>
    		</tr>
    	</table>
    	</form>
  </body>
</html>
