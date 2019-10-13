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
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>WdatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	var msg = "${requestScope.msg}";
	if(msg == "success"){
		alert("支付成功！");
	}else if(msg == "changesuccess"){
		alert("改签成功！");
	}else if(msg == "delsuccess"){
		alert("退票成功！");
	}else if(msg == "error"){
		alert("由于无剩余车票，或余额不足等原因，车票预订失败");
	}else if(msg == "erroruser"){
		alert("由于乘车人信息校验失败，车票预订失败");
	}
</script>

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
	    			订单编号
	    		</th>
	    		<th>
	    			乘车人
	    		</th>
	    		<th>
	    			下单人帐号
	    		</th>
	    		<th>
	    			下单人手机号
	    		</th>
	    		<th>
	    			下单人身份证号
	    		</th>
	    		<th>
	    			订购车次编号
	    		</th>
	    		<th>
	    			乘坐方式
	    		</th>
	    		<th>
	    			订票数
	    		</th>
	    		<th>
	    			座位
	    		</th>
	    		<th>
	    			操作
	    		</th>
    		</tr>
   			<c:forEach var="u" items="${list}">
    		<tr>
   				<td>${u.id }</td>
   				<td>${u.name }</td>
   				<td>${u.username }</td>
   				<td>${u.phone }</td>
   				<td>${u.bodyid }</td>
   				<td>${u.ccid }</td>
   				<td>
   				<c:if test="${u.type=='rw'}">
   					软卧
   				</c:if>
   				<c:if test="${u.type=='yw'}">
   					硬卧
   				</c:if>
   				<c:if test="${u.type=='yz'}">
   					硬座
   				</c:if>
   				<c:if test="${u.type=='wz'}">
   					站票
   				</c:if>
                </td>
   				<td>${u.num }</td>
   				<td>
   				<c:if test="${u.seatnum==0}">
   					无座位
   				</c:if>
   				<c:if test="${u.seatnum!=0}">
   					${u.seatnum }
   				</c:if>
                </td>
   				<td align="center">
					<a href="<%=basePath%>servlet/OrderChange?id=${u.id}">改签</a>/
					<a href="<%=basePath%>servlet/OrderDel?id=${u.id}&flag=1">退票</a>
				</td>
    		</tr>
   			</c:forEach>
   			<tr align="center">
		    	<td colspan="100">
		    		共${count }条记录&nbsp;&nbsp;&nbsp;&nbsp;
		    		
		    	 
		    	</td>
		    </tr>
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
