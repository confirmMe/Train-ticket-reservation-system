<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><HTML 
xmlns="http://www.w3.org/1999/xhtml"><HEAD><META content="IE=11.0000" 
http-equiv="X-UA-Compatible">
<META http-equiv="Content-Type" content="text/html; charset=utf-8">     
<TITLE>铁路客户服务中心</TITLE>   
<base href="<%=basePath%>">  
<LINK href="<%=basePath%>/jspweb/web_files/global20150101.css" rel="stylesheet" type="text/css">    
<SCRIPT src="<%=basePath%>/jspweb/web_files/jquery-1.4.2.min.js" type="text/javascript"></SCRIPT>
     
     
     
<SCRIPT src="<%=basePath%>/jspweb/web_files/jquery.flash.js" type="text/javascript"></SCRIPT>
<link type="text/css" href="<%=basePath%>css/lrtk.css" rel="stylesheet" />
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>js/lrtk.js"></script>    
<META name="GENERATOR" content="MSHTML 11.00.9600.17690"></HEAD> 
<BODY>
<DIV class="clearfix" id="page">
<DIV id="top">
	<img src="<%=basePath%>/jspweb/web_files/top.jpg">
</DIV>
<DIV id="menu">
	<jsp:include page="top.jsp"></jsp:include>
</DIV>
<!--erweima-->      
</DIV>
<div style="width: 958px;margin: 0 auto;background: #fff;">
<!-- 代码开始 -->
<div class="box">
	${username1 }
	<div class="picbox">
		<ul class="piclist mainlist">
			<li><img src="images/1.jpg" width="220" height="105" /></li>
			<li><img src="images/2.jpg" /></li>
			<li><img src="images/3.jpg" /></li>
			<li><img src="images/4.jpg" /></li>
			<li><img src="images/5.jpg" /></li>
            <li><img src="images/6.jpg" /></li>
			<li><img src="images/7.jpg" /></li>
			<li><img src="images/8.jpg" /></li>
		</ul>
        <ul class="piclist swaplist"></ul>
	</div>
	<div class="og_prev"></div>
	<div class="og_next"></div>
	<div style="width: 100%;padding: 10px;min-height: 500px;">
	<table width="99%">
		<tr>
			<td width="50%;" valign="top">
				<table width="99%" style="border: 1px solid #1297D1;">
					<tr>
						<th colspan="2"><b>最新公告</b></th>
					</tr>
					<c:forEach var="g" items="${gglist}" varStatus="i">
						<tr style="line-height: 30px;">
							<td>
							<a href="<%=basePath%>servlet/WebggDetail?id=${g.id}">
								${i.index+1 }.${g.ggtitle }
							</a>
							</td>
							<td style="text-align: right;">${g.ggtime }</td>
						</tr>
					</c:forEach>
				</table>
			</td>
			<td width="50%;" valign="top">
				<table width="99%" style="border: 1px solid #1297D1;">
					<tr>
						<th colspan="3"><b>最新车次</b></th>
 					</tr>
 					<c:forEach var="c" items="${cclist}" varStatus="i">
 					<tr style="line-height: 30px;">
						<td>${i.index+1 }.${c.ccid }</td>
						<td>${c.start }--${c.end }</td>
						<td style="text-align: right;">${c.time }</td>
					</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
	</table>
	</div>
</div>
<!-- 代码结束 -->

</div>

<DIV class="bottom_copy">
<DIV class="bottom_line1"></DIV>
<DIV><BR><A href="http://www.12306.cn/mormhweb/gljd/gywm/">关于我们</A>  |  <A href="http://www.12306.cn/mormhweb/gljd/wzls/">网站声明</A>
	 <BR>      版权所有 © 2008-2015 中国铁路信息技术中心 中国铁道科学研究院 <BR><A href="http://www.miibeian.gov.cn/" 
target="_blank">京ICP备15003716号-3</A> 	  </DIV>
<DIV class="bottom_line2"></DIV>

</DIV>
</BODY>
</HTML>
