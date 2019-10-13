<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
      
    	<base href="<%=basePath%>">
        <meta http-equiv=content-type content="text/html; charset=utf-8" />
        <link href="css/admin.css" type="text/css" rel="stylesheet" />
        <script>
            <%
            request.setCharacterEncoding("UTF-8"); 
			String username = request.getParameter("username");
			//username = new String(username.getBytes("ISO-8859-1"), "UTF-8");
		    String name = request.getParameter("name");
			//name = new String(name.getBytes("ISO-8859-1"), "UTF-8");
			String rolename = request.getParameter("rolename");
			//rolename = new String(rolename.getBytes("ISO-8859-1"), "UTF-8"); 
	     	%> 
	     	
        function todispaly(){
        	  var dates=new Date();
        	  var year=dates.getFullYear();
        	  var month=dates.getMonth()+1;
        	  var day=dates.getDate();
        	  var hours=dates.getHours();
        	  var minutes=dates.getMinutes();
        	  var seconds=dates.getSeconds();
        	  document.getElementById("id1").innerHTML="当前时间："+year+"-"+month+"-"+day+" "+hours+":"+minutes+":"+seconds;
        	  setTimeout("todispaly()",1000);
        	  }
 
	           
</script>
    </head>
    <body  onload="todispaly()">
        <table cellspacing=0 cellpadding=0 width="100%" align=center border=0>
            <tr height=28>
                <td background=./img/title_bg1.jpg>首页</td></tr>
            <tr>
                <td bgcolor=#b1ceef height=1></td></tr>
            <tr height=20>
                <td background=./img/shadow_bg.jpg></td></tr></table>
        <table cellspacing=0 cellpadding=0 width="90%" align=center border=0>
            <tr height=100>
                <td align=middle width=100><img height=100 src="./img/admin_p.gif" 
                                                width=90></td>
                <td width=60>&nbsp;</td>
                <td>
                    <table height=100 cellspacing=0 cellpadding=0 width="100%" border=0>

                        <tr>
                            <td id='id1'></td></tr>
                        <tr>

						<td style="font-weight: bold; font-size: 16px">当前用户： <%=username %></td></tr>
                        <tr>
                            <td>欢迎进入火车票管理中心！</td></tr></table></td></tr>
            <tr>
                <td colspan=3 height=10></td></tr></table>
        <table cellspacing=0 cellpadding=0 width="95%" align=center border=0>
            <tr height=20>
                <td></td></tr>
            <tr height=22>
                <td style="padding-left: 20px; font-weight: bold; color: #ffffff" 
                    align=middle background=./img/title_bg2.jpg>您的相关信息</td></tr>
            <tr bgcolor=#ecf4fc height=12>
                <td></td></tr>
            <tr height=20>
                <td></td></tr></table>
        <table cellspacing=0 cellpadding=2 width="95%" align=center border=0>
            <tr>
                <td align=right width=100>登陆帐号：</td>
                <td style="color: #880000"> <%=username %></td></tr>
            <tr>
                <td align=right>真实姓名：</td>
                <td style="color: #880000"><%=name %></td></tr>
            <tr>
                <td align=right>角色：</td>
                <td style="color: #880000"><%=rolename %></td></tr>
            <tr>
            <tr>
                <td align=right>状态： </td>
                <td style="color: #880088">当前系统状态良好，欢迎登陆！</td>
			</tr>
        </table>		
    </body>
</html>