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
function check(){
	var username = $("#username").val();
	var password = $("#password").val();
	var bodyid = $("#bodyid").val();
	if(username==null||username==''){
		alert("用户名不能为空！");
		return false;
	}else if(password==null||password==''){
		alert("密码不能为空！");
		return false;
	}else if(bodyid==null||bodyid==''){
		alert("输入正确的身份证号");
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
		<form action="<%=basePath%>servlet/Webreg" method="post" enctype="multipart/form-data" onsubmit="return check();">
		<table width="900px;" align="center" style="line-height: 30px;">
			<tr>
				<td colspan="2" align="center">
					会员注册
				</td>
			</tr>
			<tr>
				<th align="right" width="40%">用户名：</th>
				<td align="left" width="50%"><input type="text" id="username" name="username"/></td>
			</tr>
			<tr>
				<th align="right">密码：</th>
				<td><input type="text" id="password" name="password"/></td>
			</tr>
			<tr>
				<th align="right">姓名：</th>
				<td><input type="text" id="name" name="name"/></td>
			</tr>
			<tr>
				<th align="right">手机号：</th>
				<td><input type="text" id="phone" name="phone"/></td>
			</tr>
			<tr>
				<th align="right">身份证号：</th>
				<td><input type="text" id="bodyid" name="bodyid"/></td>
			</tr>
			<tr>
				<th align="right">地址：</th>
				<td><input type="text" id="address" name="address"/></td>
			</tr>
			<tr>
				<th align="right">性别：</th>
				<td><input type="text" id="sex" name="sex"/></td>
			</tr>
			<tr>
				<th align="right">邮件地址：</th>
				<td><input type="text" id="email" name="email"/></td>
			</tr>
			<tr>
			    <th align="right">身份：</th>
			    <td>
			    <select id="isStudent" name="isStudent">   
					<option value="1">学生</option>
					<option value="0">普通用户</option>	 
				</select>
				</td>
			</tr>
			<tr>
				<td colspan="5" align="center">
					<h4 style="color:red">如果您是学生，请输入学生证号并上传您的学生证照片，否则请上传您的身份证照片，我们会在后台对您的身份进行校验。</h4>
				</td>
			</tr>
			<tr>
				<th align="right">学生证号</th> 
				<td><input type="text" id="studentNum" name="studentNum"/></td>
			</tr>
			<tr>
				<td colspan="5" align="center">
					<h4 style="color:red">请上传jpg格式的图片，并且不大于80KB</h4>
				</td>
			</tr>
				<td colspan="5" align="center"><input id="image_w" type="file" name="image_w"/></td>
			
			<tr>
				<td align="center" colspan="2"><input type="submit" value="注册"/></td>
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
