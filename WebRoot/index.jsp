<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<title>index</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/styles1.css">

</head>

<body>
	<div class="htmleaf-container">
		<div class="wrapper">
			<div class="container">
				<h1>Welcome to LinkMUN</h1>
				<h1>欢迎来到联梦</h1>
				<img src="images/logo.png" width="70%" />
				<form class="form" action="login.jsp" style="margin:0px;display: inline">
					<button type="submit" id="login-button"  style="margin-bottom: 20px ;   margin-left: 30px;    margin-right: 30px;">登录/Login</button>
				</form>
				<form class="form" action="register.jsp" style="margin:0px;display: inline">
					<button type="submit" id="login-button"  >注册/register</button>
				</form>
			</div>

			<ul class="bg-bubbles">
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>
	</div>
	<script src="js/jquery-2.1.1.min.js" type="text/javascript"></script>
</body>
</html>
