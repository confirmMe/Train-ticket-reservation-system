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
		var ggid = $("#ggid").val();
		var ggtitle = $("#ggtitle").val();
		var ggtext = $("#ggtext").val();
		if(ggid==null||ggid==''){
			alert("公告编号不能为空！");
			return false;
		}else if(ggtitle==null||ggtitle==''){
			alert("公告标题不能为空！");
			return false;
		}else if(ggtext==null||ggtext==''){
			alert("公告内容不能为空！");
			return false;
		}else{
			return true;
		}
  	}
  </script>

  </head>
  
  <body>
  	<form action="<%=basePath%>servlet/GgAdd" method="post" onsubmit="return checkDate();">
    <table class="altrowstable" id="alternatecolor" width="99%;">
   		<tr>
    		<th>
    			公告编号
    		</th>
    		<td>
    			<input type="text" id="ggid" name="ggid"/>
    		</td>
    		<th>
    			公告标题
    		</th>
    		<td>
    			<input type="text" id="ggtitle" name="ggtitle"/>
    		</td>
    		<th>
    			公告内容
    		</th>
    		<td>
    			<input type="text" id="ggtext" name="ggtext"/>
    		</td>
   		</tr>
   		<tr>
    		<th>
    			公告日期
    		</th>
    		<td colspan="5">
    			<input type="text" id="ggtime" name="ggtime" onclick="WdatePicker();"/>
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
