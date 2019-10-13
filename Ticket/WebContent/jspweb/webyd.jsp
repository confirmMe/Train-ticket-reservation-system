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
		var name = $("#name").val();
		var phone = $("#phone").val();
		var bodyid = $("#bodyid").val();
		var num = $("#num").val();
		if(name==null||name==''){
			alert("姓名不能为空！");
			return false;
		}else if(phone==null||phone==''){
			alert("手机号不能为空！");
			return false;
		}else if(bodyid==null||bodyid==''){
			alert("身份证号不能为空！");
			return false;
		}else{
			return true;
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
	<div style="width: 100%;padding: 10px;min-height: 500px;">
	<form action="<%=basePath%>servlet/OrderAdd" method="post" onsubmit="return check();">
	<table width="99%">
		<tr>
			<td colspan="7">
				订单支付：
 				
			</td>
		</tr>
		
		<tr>
			<td colspan="7" width="100%">
				<table id="userinfotab">
					<tr>
						<td><font  style="font-weight: bold;">姓名：</font>
							<input type="text" id="name" name="name" value="${name}"/>
							<input type="hidden" id="ccid" name="ccid" value="${u.ccid }"/>
						</td>
						<td><font  style="font-weight: bold;">手机号:</font><input type="text" id="phone" name="phone" value="${phone}" /></td>
						<td><font  style="font-weight: bold;">身份证号：</font><input type="text" id="bodyid" name="bodyid" value="${bodyid}" /></td>
						<td><font  style="font-weight: bold;">乘坐方式：</font>
						<select id="type" name="type">   
					    <option value="rw">软卧</option>
					    <option value="yw">硬卧</option>
					    <option value="yz">硬座</option>
					    <option value="wz">站票</option>
				        </select>
						</td>
						<td><font  style="font-weight: bold;">订票张数：</font><span id="num" name="num" > 1 </span></td>
					   
					</tr>
					<tr>
			<td colspan="7">
			您最近添加的乘车人： ${maybe }
			</td>
			</tr>
			<tr>
			<td colspan="7">
			<c:if test='${student == "true" }'>
			 		<div style="color:green">${name}是学生，享受半价优惠！</div>
			</c:if>
			</td>
		</tr>
				</table>
			</td>
		</tr>
		
		<tr>
			<td colspan="100">
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
			   		</tr>
			   		<tr>
			 				<td>${u.ccid }</td>
			 				<td>${u.start }</td>
			 				<td>${u.end }</td>
			 				<td>${u.time }</td>
			 				<td>${u.reachtime }</td>
			 				<td>${u.rwpage }</td>
			 				<td>
			 					<c:if test='${student == "true" }'>
			 						${u.rwpice/2 }
			 					</c:if>
			 					<c:if test='${student == "false" }'>
			 						${u.rwpice/1 }
			 					</c:if>
			 				</td>
			 				<td>${u.ywpage }</td>
			 				<td>
			 					<c:if test='${student == "true" }'>
			 						${u.ywpice/2 }
			 					</c:if>
			 					<c:if test='${student == "false" }'>
			 						${u.ywpice/1 }
			 					</c:if>
			 				</td>
			 				<td>${u.yzpage }</td>
			 				<td>
			 					<c:if test='${student == "true" }'>
			 						${u.yzpice/2 }
			 					</c:if>
			 					<c:if test='${student == "false" }'>
			 						${u.yzpice/1 }
			 					</c:if>
			 				</td>
			 				<td>${u.wzpage }</td>
			 				<td>
			 					<c:if test='${student == "true" }'>
			 						${u.wzpice/2 }
			 					</c:if>
			 					<c:if test='${student == "false" }'>
			 						${u.wzpice/1 }
			 					</c:if>
			 				</td>
			   		</tr>
				</table>
			
			</td>
		</tr>
		<tr>
			<td align="center" colspan="100"><input type="submit" value="立即支付"/></td>
		</tr>
	</table>
	</form>
	
	
	
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
