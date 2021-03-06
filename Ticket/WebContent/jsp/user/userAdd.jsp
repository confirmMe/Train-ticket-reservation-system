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
		var username = $("#username").val();
		var password = $("#password").val();
		if(username==null||username==''){
			alert("用户名不能为空！");
			return false;
		}else if(password==null||password==''){
			alert("密码不能为空！");
			return false;
		}else{
			return true;
		}
  	}
  </script>

  </head>
  
  <body>
  	<form action="<%=basePath%>servlet/UserAdd" method="post" onsubmit="return checkDate();">
    <table class="altrowstable" id="alternatecolor" width="99%;">
   		<tr>
    		<th>
    			用户名
    		</th>
    		<td>
    			<input type="text" id="username" name="username"/>
    		</td>
    		<th>
    			密码
    		</th>
    		<td>
    			<input type="text" id="password" name="password"/>
    		</td>
    		<th>
    			姓名
    		</th>
    		<td>
    			<input type="text" id="name" name="name"/>
    		</td>
   		</tr>
   		<tr>
    		<th>
    			性别
    		</th>
    		<td>
    			<input type="text" id="sex" name="sex"/>
    		</td>
    		<th>
    			部门
    		</th>
    		<td>
    			<input type="text" id="deptname" name="deptname"/>
    		</td>
    		<th>
    			角色
    		</th>
    		<td>
    			<select id="rolename" name="rolename">
    				<option>普通管理员</option>
    				<option>系统管理员</option>
    			</select>
    		</td>
   		</tr>
   		<tr>
    		<th>
    			地址
    		</th>
    		<td colspan="5">
    			<input type="text" id="address" name="address"/>
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
