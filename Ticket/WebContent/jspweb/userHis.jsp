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
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/table_com.css">
<SCRIPT src="<%=basePath%>/jspweb/web_files/jquery-1.4.2.min.js" type="text/javascript"></SCRIPT>
<SCRIPT src="<%=basePath%>/jspweb/web_files/jquery.flash.js" type="text/javascript"></SCRIPT>
<link type="text/css" href="<%=basePath%>css/lrtk.css" rel="stylesheet" />
 

<BODY>
<DIV class="clearfix" id="page">
<DIV id="top">
	<img src="<%=basePath%>jspweb/web_files/top.jpg">
</DIV>
<DIV id="menu">
	<jsp:include page="top.jsp"></jsp:include>
</DIV>
<!--erweima-->      
</DIV>
<div style="width: 958px;margin: 0 auto;background: #fff;">
<!-- 代码开始 -->
<div class="box">
	<div style="width: 99%;padding: 10px;min-height: 500px;">
		<c:if test="${count!=null}">
		<table class="altrowstable" id="alternatecolor" width="99%;">
    		<tr>
	    		<th>
	    			姓名
	    		</th>
	    		
	    		<th>
	    			车次
	    		</th>
 	    		<th>  
	    			花费
	    		</th>  
	    		<th>  
	    			类型
	    		</th>
	    		<th>
	    		         剩余
	    		</th>
	    		<th>
	    		         日期
	    		</th>
	    		 
    		</tr>
   			<c:forEach var="u" items="${list}">
    		<tr>
   				<td style="text-align: center;" >${u.user }</td>
   				<td style="text-align: center;">${u.ccid }</td>
   				<td style="text-align: center;">${u.money }</td>
   				 
   				 
   				<td style="text-align: center;">
   				        <c:if test='${u.edittype == "0" }'>
			 						退回
			 					</c:if>
			 					<c:if test='${u.edittype == "1" }'>
			 						花费
			 			</c:if>
			 	</td>
			 	<td style="text-align: center;">${u.remain }</td>
			 	 <td style="text-align: center;">${u.datetime }</td>
    		</tr>
   			</c:forEach>
   			
    	</table>
    	</c:if>
    	<c:if test="${count==null}">
    		${message }
    	</c:if>
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
