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
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/styles1.css">
<style type="text/css">
form select {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	outline: 0;
	border: 1px solid rgba(255, 255, 255, 0.4);
	background-color: rgba(255, 255, 255, 0.2);
	width: 250px;
	border-radius: 3px;
	padding: 10px 15px;
	margin: 0 auto 10px auto;
	display: block;
	text-align: center;
	font-size: 18px;
	color: blue;
	-webkit-transition-duration: 0.25s;
	transition-duration: 0.25s;
	font-weight: 300;
}

span {
	float: left;
	font-size: 150%;
	clear: both;
	width: 150px;
}

input {
	float: left;
}

select {
	float: left;
}
</style>
<script src="js/jquery-2.1.1.min.js" type="text/javascript"></script>
<script>
	var username;
	var username_pd = 0;
	var email;
	var email_pd = 0;
	var idcard;
	var idcard_pd = 0;
	var pwd;
	var rpwd;
	var pwd_pd = 0;
	var result;

	function m_userTipOnblur() {
		username = $("input[name='username']").val();
		console.log(1);
		console.log(username);
		$("#span_userTip").css("display", "inline-block");
		if (username == "") { //用户名为空  
			$("#span_userTip").css("color", "#f00");
			$("#span_userTip")[0].innerText = "* 用户名不能为空";
			username_pd = 0;
		} else {
			var url = "RegisterCheckUserName.do?username=" + username;
			$.ajax({
				url : url,
				type : "GET",
				success : function(data) {
					m_useOrNo = data;
					if (data == "True") { //用户名已被占用
						$("#span_userTip").css("color", "#f00");
						$("#span_userTip")[0].innerText = "* 该用户名已经被占用";
						username_pd = 0;
					} else if (data == "False") { //此用户名可以放心使用       
						$("#span_userTip").css("color", "#0094ff");
						$("#span_userTip")[0].innerText = "* 此用户名可以放心使用";
						username_pd = 1;
					}
				}
			})
		}
	}
	function checkemail() {
		email = $("input[name='email']").val();
		var reg = /^([\w\.\-]+)\@(\w+)(\.([\w^\_]+)){1,2}$/;
		$("#span_emailTip").css("display", "inline-block");
		if (!reg.test(email)) {
			$("#span_emailTip").css("color", "#f00");
			$("#span_emailTip")[0].innerText = "* 邮箱格式错误";
			email_pd = 0;
		} else {
			$("#span_emailTip").css("color", "#0094ff");
			$("#span_emailTip")[0].innerText = "* 邮箱格式正确";
			email_pd = 1;
		}
	}
	function checkidcard() {
		idcard = $("input[name='idcard']").val();
		var reg = /(^\d{15}$)|(^\d{17}([0-9]|X)$)/;
		$("#span_idcardTip").css("display", "inline-block");
		if (!reg.test(idcard)) {
			$("#span_idcardTip").css("color", "#f00");
			$("#span_idcardTip")[0].innerText = "* 身份证格式错误";
			idcard_pd = 0;
		} else {
			$("#span_idcardTip").css("color", "#0094ff");
			$("#span_idcardTip")[0].innerText = "* 身份证格式正确";
			idcard_pd = 1;
		}
	}
	function checkpassword() {
		pwd = $("input[name='password']").val();
		rpwd = $("input[name='repassword']").val();
		$("span_passwordTip").css("display", "inline-block");
		if (pwd.length < 6 || pwd.length > 12) {
			$("#span_passwordTip").css("color", "#f00");
			$("#span_passwordTip")[0].innerText = "* 密码长度应为6~12位";
			pwd_pd = 0;
		} else if (pwd != rpwd) {
			$("#span_passwordTip").css("color", "#f00");
			$("#span_passwordTip")[0].innerText = "* 两次密码不相同";
			pwd_pd = 0;
		} else {
			$("#span_passwordTip").css("color", "#0094ff");
			$("#span_passwordTip")[0].innerText = "* 密码检测通过";
			pwd_pd = 1;
		}
	}

</script>
</head>

<body>
	<div class="htmleaf-container">
		<div class="wrapper">
			<div class="container" style="padding-top: 10%;" >
				<h1>Welcome to LinkMUN</h1>
				<div
					style="width:80%;background-color:rgba(255, 255, 255, 0.2);margin: 0 auto;overflow-y:scroll;height:334px;margin-top: 20px;">
					<form class="form" action="UserRegister.do" Method="post"
						style="margin:0px;">
						<div style="height: 50px;">
							<span>用户名：</span><input type="text" name="username" id="username"
								placeholder="Username" onblur="m_userTipOnblur();"> <span
								id="span_userTip"
								style="color:#f00;display:inline-block;	font-size: 100%; width: 300px">*</span>
						</div>
						<div style="height: 50px;">
							<span>密码：</span><input type="password" name="password"
								placeholder="Password">
						</div>
						<div style="height: 50px;">
							<span>确认密码：</span><input type="password" name="repassword"
								placeholder="RePassword" onblur="checkpassword()"> <span
								id="span_passwordTip"
								style="color:#f00;display:inline-block;	font-size: 100%; width: 300px">*</span>
						</div>
						<div style="height: 50px;">
							<span>姓名：</span><input type="text" name="realname"
								placeholder="Name">
						</div>
						<div style="height: 50px;">
							<span>性别：</span> <select name="sex">
								<option value="male">男/male</option>
								<option value="female">女/female</option>
							</select>
						</div>
						<div style="height: 50px;">
							<span>学校：</span><input type="text" name="school"
								placeholder="School">
						</div>
						<div style="height: 50px;">
							<span>邮箱：</span><input type="text" name="email" id="email"
								placeholder="Email" onblur="checkemail()"> <span
								id="span_emailTip"
								style="color:#f00;display:inline-block;	font-size: 100%; width: 300px">*</span>
						</div>
						<div style="height: 50px;">
							<span>QQ：</span><input type="text" name="qq" placeholder="QQ">
						</div>
						<div style="height: 50px;">
							<span>手机：</span><input type="text" name="phone"
								placeholder="Phone">
						</div>
						<div style="height: 50px;">
							<span>身份证：</span><input type="text" name="idcard"
								placeholder="IDcard" onblur="checkidcard()""> <span
								id="span_idcardTip"
								style="color:#f00;display:inline-block;	font-size: 100%; width: 300px">*</span>
						</div>
						<div style="height: 50px;">
							<span>第一志愿：</span> <select name="first">
								<option value="undp">联合国开发计划署</option>
								<option value="FNA">1848法兰克福国民议会</option>
								<option value="Berlin">1878柏林会议</option>
								<option value="ATS">Antarctica Treaty System</option>
							</select>
						</div>
						<div style="height: 50px;">
							<span>第二志愿：</span> <select name="second">
								<option value="undp">联合国开发计划署</option>
								<option value="FNA">1848法兰克福国民议会</option>
								<option value="Berlin">1878柏林会议</option>
								<option value="ATS">Antarctica Treaty System</option>
							</select>
						</div>

						<button type="submit" id="login-button" name="register">注册/register</button>
						<div style="height:50px"><h1> </h1><br><h1> </h1><br><h1> </h1><br></div>
					</form>
				</div>
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
	<script>
			$("button[name='register']").click(function(event) {
		event.preventDefault();
		if (username_pd == 0 || pwd_pd == 0 || email_pd == 0 || idcard_pd == 0) {
			alert("请核对信息");
		} else {
			$("form").submit();
		}
	})
	
	</script>
</body>
</html>
