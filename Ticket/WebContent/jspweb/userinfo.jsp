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
	    			手机号码
	    		</th>
	    		<th>
	    			身份证号码
	    		</th>
 	    		<th>  
	    			真实姓名
	    		</th>  
	    		<th>  
	    			注册日期
	    		</th>
	    		<th>
	    		         用户角色
	    		</th>
	    		
	    		<th>
	    		         性别
	    		</th>
	    		<th>
	    		         邮件地址
	    		</th>
	    		<th>
	    		         真实地址
	    		</th>
	    		<th>
	    		         账户余额
	    		</th>
	    		<th>
	    		         操作
	    		</th>
    		</tr>
   			<c:forEach var="u" items="${list}">
    		<tr>
   				<td style="text-align: center;" >${u.username }</td>
   				<td style="text-align: center;">${u.phone }</td>
   				<td style="text-align: center;">${u.bodyid }</td>
   				<td style="text-align: center;">${u.name }</td>
   				<td style="text-align: center;">${u.date }</td>
   				<td style="text-align: center;">
   				        <c:if test='${u.isStudent == "0" }'>
			 						成人
			 					</c:if>
			 					<c:if test='${u.isStudent == "1" }'>
			 						学生
			 			</c:if>
			 	</td>
			 	
			 	<td style="text-align: center;">${u.sex }</td>
                <td style="text-align: center;">${u.email }</td>
                <td style="text-align: center;">${u.address }</td>
                <td style="text-align: center;">${u.money }</td>
                <td style="text-align: center;"><a href="<%=basePath%>servlet/webuserEdit?id=${u.id}&flag=1">修改</a></td>
    		</tr>
   			</c:forEach>

    	</table>
<img src="<%=basePath%>jspweb/web_files/3.PNG">

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
