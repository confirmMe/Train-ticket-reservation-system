<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta charset="utf-8" />
<title>后台登录</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<style>
body {
	height: 100%;
	background: #16a085;
	overflow: hidden;
}

canvas {
	z-index: -1;
	position: absolute;
}
</style>
<script src="js/jquery.js"></script>
<script src="js/verificationNumbers.js"></script>
<script src="js/Particleground.js"></script>
<script>
	$(document).ready(function() {
		//粒子背景特效
		$('body').particleground({
			dotColor : '#5cbdaa',
			lineColor : '#5cbdaa'
		});
		//验证码
		createCode();

	});

/* 	function logins() {
		var uname = $("#username").val();
		var pawdd = $("#password").val();
		if (uname == "" || uname == null) {
			alert("请输入您的用户名");
			return false;
		} else if (pawdd == "" || pawdd == null) {
			alert("请输入您的登录密码");
			return false;
		} else {
			return true;
		}
	} */
</script>
</head>
<body>
	<dl class="admin_login">
		<dt>
			<strong>火车票预订系统管理员登陆</strong> <em>Management System</em>
		</dt>
		<form action="<%=basePath%>servlet/Login" id="myform" method="post"
			onsubmit="return validate();">
			<dd class="user_icon">
				<input type="text" placeholder="账号" class="login_txtbx"
					name="username" id="username" />
			</dd>
			<dd class="pwd_icon">
				<input type="password" placeholder="密码" class="login_txtbx"
					name="password" id="password" />
			</dd>

			<dd class="val_icon">
				<div class="checkcode">
					<input type="text" id="J_codetext" placeholder="验证码" maxlength="4"
						class="login_txtbx"> <canvas class="J_codeimg"
							id="myCanvas" onclick="createCode()">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
				</div>
				<input type="button" value="验证码核验" class="ver_btn"
					onClick="validate();">
			</dd>
			<dd>
				<input type="submit" value="立即登陆" class="submit_btn"  />
			</dd>
			<ul>
				<h1 style="color:red">${message }</h1>
			</ul>
		</form>



		<dd>
			<p>© 2018-2019 train book system版权所有</p>

		</dd>
	</dl>
</body>
</html>