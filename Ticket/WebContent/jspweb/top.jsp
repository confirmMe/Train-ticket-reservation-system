<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<UL class="menubg" style="90%">
  <LI id="currentDate" style="width: 83px; ">
	<SCRIPT language="JavaScript" src="<%=basePath%>/jspweb/web_files/date.js" type="text/javascript"></SCRIPT>
  </LI>
  <LI style="width: 60px; "><A href="<%=basePath%>servlet/Webgg">首&nbsp;页</A></LI>
  <LI style="width: 83px; "><A href="<%=basePath%>servlet/webcphelp">火车票订购</A></LI>
  <LI style="width: 95px; "><A href="<%=basePath%>servlet/WebccSow">车次信息展示</A></LI>
  <LI style="width: 95px; "><A href="<%=basePath%>jspweb/webzd.jsp">车次检索</A></LI>
  <LI style="width: 80px; "><A href="<%=basePath%>servlet/OrderSearch">我的订单</A></LI>
  <LI style="width: 80px; "><A href="<%=basePath%>jspweb/help.jsp">客户服务</A></LI>
  <LI style="width: 80px; "><A href="<%=basePath%>jspweb/weblogin.jsp">会员登录</A></LI>
  <LI style="width: 80px; "><A href="<%=basePath%>servlet/UserinfoSearch">用户信息</A></LI>
  <LI style="width: 78px; "><A href="<%=basePath%>servlet/userHis" >我的账单</A></LI>
  
   
   
</UL>