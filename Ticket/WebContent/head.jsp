<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <base href="<%=basePath%>">
        <meta http-equiv=content-type content="text/html; charset=utf-8" />
        <link href="<%=basePath%>css/admin.css" type="text/css" rel="stylesheet" />
        <%request.setCharacterEncoding("UTF-8"); %>  
		<%
			String username = request.getParameter("username");
			//username = new String(username.getBytes("ISO-8859-1"), "UTF-8");
			String rolename = request.getParameter("rolename");
			//rolename = new String(rolename.getBytes("ISO-8859-1"), "UTF-8"); 
		%>
    </head>
    <body>
        <table cellspacing=0 cellpadding=0 width="100%" 
               background="<%=basePath%>img/header_bg.jpg" border=0>
            <tr height=56>
                <td width=260 style="font-size: 30px;font-weight: bold;color: #fff;">火车票管理中心</td>
                <td style="font-weight: bold; color: #fff; padding-top: 20px" 
                    align=middle>当前用户：<%=username %> &nbsp;&nbsp; 用户角色：<%=rolename %> &nbsp;&nbsp; 
                    <a style="color: #fff" onclick="if (confirm('确定要退出吗？')) return true; else return false;" href="<%=basePath%>login.jsp" target=_top>退出系统</a> 
                </td>
                <td align=right width=268><img height=56 
                                               src="./img/header_right.jpg" width=268></td></tr></table>
        <table cellspacing=0 cellpadding=0 width="100%" border=0>
            <tr bgcolor=#1c5db6 height=4>
                <td></td>
            </tr>
        </table>
    </body>
</html>