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
	<script type="text/javascript" src="<%=basePath%>WdatePicker/WdatePicker.js"></script>
  <script type="text/javascript">
  	function checkDate(){
		var key = $("#key").val();
		var value = $("#value").val();
		if(key==null||key==''){
			alert("关键字不能为空！");
			return false;
		}else if(value==null||value==''){
			alert("帮助信息不能为空！");
			return false;
		}else{
			return true;
		}
  	}
  </script>

  </head>
  
  <body>
  	<form action="<%=basePath%>servlet/helpAdd" method="post" onsubmit="return checkDate();">
    <table class="altrowstable" id="alternatecolor" width="99%;">
   		<tr>
    		<th>
    			关键字
    		</th>
    		<td>
    			<input type="text" id="key" name="key"/>
    		</td>
    		<th>
    			帮助信息
    		</th>
    		<td>
    			<input type="text" id="value" name="value"/>
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
