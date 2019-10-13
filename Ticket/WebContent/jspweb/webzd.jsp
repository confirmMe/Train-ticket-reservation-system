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
	<div style="width: 100%;padding: 10px;min-height: 500px;">
		<form action="<%=basePath%>servlet/Webzd" method="post" onsubmit="return check();">
		<table width="99%">
			<tr>
				<td>
					根据车次编号查询站点信息：
				</td>
			</tr>
			<tr>
				<td align="center">车次编号:<input type="text" id="ccid" name="ccid" value="${ccid }"/><input type="submit" value="查询"/></td>
			</tr>
		</table>
		</form>
		<c:if test="${listSize!=0}">
		<table class="altrowstable" id="alternatecolor" width="99%;">
    		<tr>
	    		<th>
	    			车次编号
	    		</th>
	    		<td>
	    			${c.ccid }
	    		</td>
	    		<th>
	    			车次名称
	    		</th>
	    		<td>
	    			${c.ccname }
	    		</td>
	    		<th>
	    			始发站
	    		</th>
	    		<td>
	    			${c.start }
	    		</td>
    		</tr>
    		<tr>
	    		<th>
	    			终点站
	    		</th>
	    		<td>
	    			${c.end }
	    		</td>
	    		<th>
	    			软卧剩余票数
	    		</th>
	    		<td>
	    			${c.rwpage }
	    		</td>
	    		<th>
	    			软卧价格
	    		</th>
	    		<td>
	    			${c.rwpice }
	    		</td>
    		</tr>
    		<tr>
	    		<th>
	    			硬卧剩余票数
	    		</th>
	    		<td>
	    			${c.ywpage }
	    		</td>
	    		<th>
	    			硬卧价格
	    		</th>
	    		<td>
	    			${c.ywpice }
	    		</td>
	    		<th>
	    			硬座剩余票数
	    		</th>
	    		<td>
	    			${c.yzpage }
	    		</td>
    		</tr>
    		<tr>
	    		<th>
	    			硬座价格
	    		</th>
	    		<td>
	    			${c.yzpice }
	    		</td>
	    		<th>
	    			站票剩余票数
	    		</th>
	    		<td>
	    			${c.wzpage }
	    		</td>
	    		<th>
	    			站票价格
	    		</th>
	    		<td>
	    			${c.wzpice }
	    		</td>
    		</tr>
    		<tr>
	    		<th>
	    			发车时间
	    		</th>
	    		<td colspan="111">
	    			${c.time }
	    		</td>
    		</tr>
    		<tr>
	    		<th>
	    			到达时间
	    		</th>
	    		<td colspan="111">
	    			${c.reachtime }
	    		</td>
    		</tr>
    		<tr>
	    		<th>
	    			途中经过车站
	    		</th>
	    		<td colspan="5">
	    			<table class="altrowstable" id="alternatecolor" width="99%;">
			    		<tr>
				    		<th>车站名称</th>
				    		<th>到站时间</th>
				    	</tr>
				    	<c:forEach var="g" items="${list1}">
			    		<tr>
				    		<td>${g.glzname }</td>
				    		<td>${g.glztime }</td>
				    	</tr>
				    	</c:forEach>
			    	</table>
	    		</th>
	    		</td>
    		</tr>
    	</table>
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
