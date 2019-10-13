<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><HTML 
xmlns="http://www.w3.org/1999/xhtml">
<HEAD><META content="IE=11.0000" 
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
    
	function check(){
		var start = $("#start").val();
		var end = $("#end").val();
		var starttime = $("#starttime").val();
		var endtime = $("#endtime").val();
		var cartype = $("#cartype").val();
		if(cartype==null||cartype==''){
			alert("车次类别不能为空！");
			return false;
		}else if(start==null||start==''){
			alert("出发地不能为空！");
			return false;
		}else if(end==null||end==''){
			alert("目的地不能为空！");
			return false;
		}else if(starttime==null||starttime==''){
			alert("出发日期不能为空！");
			return false;
		}else if(endtime==null||endtime==''){
			alert("出发日期不能为空！");
			return false;
		}else{
			return true;
		}
	}

	function ydcp(id){
		 
		var username = $("#username").val();
		if(username!=null&&username!=''){
		window.location.href="<%=basePath%>servlet/Webyd?id="+id;
		}else{
			alert("请登录后进行订票操作！");
			window.location.href="<%=basePath%>jspweb/weblogin.jsp";
		}
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
	<form action="<%=basePath%>servlet/Webcc" method="post" onsubmit="return check();">
	<table width="99%">	
	    <tr>
			<td colspan="7">
			您可能需要购买的车次： ${maybe }
			</td>
		</tr>
		<tr>
			<td colspan="7">
				 	选择出发地目的地和出发时间查询车次信息：
				<input type="hidden" id="username" name="username" value="${username }"/>
				  
			</td>
		</tr>
		<tr>
			<th>车次类别</th>
			<td>
				<select id="cartype" name="cartype">   
					<option value="K">快车</option>
					<option value="T">特快</option>
					<option value="G">高铁</option>
				</select>
			</td>
			<th>出发地</th>
			<td><input type="text" size="12" id="start" name="start" value="${start }"/></td>
			<th>目的地</th>
			<td><input type="text" size="12" id="end" name="end" value="${end }"/></td>
			<th>出发日期</th>
			<td>
				<input type="text" size="15" id="starttime" name="starttime" value="${starttime }" onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm'});"/>&nbsp;至&nbsp;
				<input type="text" size="15" id="endtime" name="endtime" value="${endtime }" onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm'});"/>
			</td>
			<td><input type="submit" value="查询"/></td>
		</tr>
	</table>
	</form>
	<c:if test="${count>0}">
	<table class="altrowstable" id="alternatecolor" width="99%;">
    		<tr>
	    		<th>
	    			车次名称
	    		</th>
	    		<th>
	    			始发站
	    		</th>
	    		<th>
	    			终点站
	    		</th>
	    		<th>
	    			发车时间
	    		</th>
	    		<th>
	    			到达时间
	    		</th>
	    		<th>
	    			软卧剩余票数
	    		</th>
	    		<th>
	    			软卧价格
	    		</th>
	    		<th>
	    			硬卧剩余票数
	    		</th>
	    		<th>
	    			硬卧价格
	    		</th>
	    		<th>
	    			硬座剩余票数
	    		</th>
	    		<th>
	    			硬座价格
	    		</th>
	    		<th>
	    			站票剩余票数
	    		</th>
	    		<th>
	    			站票价格
	    		</th>
	    		<th>
	    			操作
	    		</th>
    		</tr>
   			<c:forEach var="u" items="${list}">
    		<tr>
   				<td>${u.ccid }</td>
   				<td>${u.start }</td>
   				<td>${u.end }</td>
   				<td>${u.time }</td>
   				<td>${u.reachtime }</td>
   				<td><c:if test='${u.rwpage > 0 }'>
			 		<div style="color:green">有</div>
			    </c:if>
			    <c:if test='${u.rwpage == "0" }'>
			 		<div style="color:red">——</div>
			    </c:if></td>
   				<td>${u.rwpice }</td>
   				<td><c:if test='${u.ywpage > 0 }'>
			 		<div style="color:green">有</div>
			    </c:if>
			    <c:if test='${u.ywpage == "0" }'>
			 		<div style="color:red">——</div>
			    </c:if></td>
   				<td>${u.ywpice }</td>
   				<td><c:if test='${u.yzpage > 0 }'>
			 		<div style="color:green">有</div>
			    </c:if>
			    <c:if test='${u.yzpage == "0" }'>
			 		<div style="color:red">——</div>
			    </c:if></td>
   				<td>${u.yzpice }</td>
   				<td><c:if test='${u.wzpage > 0 }'>
			 		<div style="color:green">有</div>
			    </c:if>
			    <c:if test='${u.wzpage == "0" }'>
			 		<div style="color:red">——</div>
			    </c:if></td>
   				<td>${u.wzpice }</td>
   				<td align="center">
					<a href="javascript:ydcp('${u.id }')">预订</a>
				</td>
    		</tr>
   			</c:forEach>
   			<tr align="center">
		    	<td colspan="100">
		    		共${count }条记录&nbsp;&nbsp;&nbsp;&nbsp;
		    		 当前第${pages }页/共${lastpage }页&nbsp;&nbsp;&nbsp;&nbsp;
		    		<%
		    		if((Integer)request.getAttribute("pages")!=1){
		    		%>
		    		<a href="<%=basePath%>servlet/Webcc?currentpage=1">首页</a>
		    		<a href="<%=basePath%>servlet/Webcc?currentpage=${pages-1}">上一页</a>
		    		<%} %>
		    		<%
		    		if((Integer)request.getAttribute("pages")!=(Integer)request.getAttribute("lastpage")){
		    		%>
		    		<a href="<%=basePath%>servlet/Webcc?currentpage=${pages+1}">下一页</a>
		    		<a href="<%=basePath%>servlet/Webcc?currentpage=${lastpage}">尾页</a>
		    		<%} %>
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
