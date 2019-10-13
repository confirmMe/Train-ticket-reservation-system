<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html public "-//w3c//dtd xhtml 1.0 frameset//en" "http://www.w3.org/tr/xhtml1/dtd/xhtml1-frameset.dtd">
<html>
    <head>
        <meta http-equiv=content-type content="text/html; charset=utf-8" />
        <meta http-equiv=pragma content=no-cache />
        <meta http-equiv=cache-control content=no-cache />
        <meta http-equiv=expires content=-1000 />
        
        <title>火车票管理中心</title>
	    <base href="<%=basePath%>">

    </head>
    <frameset border=0 framespacing=0 rows="60, *" frameborder=0>
        <frame name=head src="<%=basePath%>head.jsp?username=${username}&rolename=${rolename}" frameborder=0 noresize scrolling=no>
            <frameset cols="170, *">
                <frame name=left src="<%=basePath%>left.jsp?username=${username}&rolename=${rolename}" frameborder=0 noresize /> 
                <frame name=right src="<%=basePath%>right.jsp?username=${username}&rolename=${rolename}&name=${name}" frameborder=0 noresize scrolling=yes />
            </frameset>
    </frameset>
    <noframes>
    </noframes>
</html>
