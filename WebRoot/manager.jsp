<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.linkmun.model.*"%>
<%@ page import="org.springframework.context.ApplicationContext"%>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@ page import="com.linkmun.mapper.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
		ApplicationContext act = new ClassPathXmlApplicationContext("applicationContext.xml");
		LinkmunUser user=(LinkmunUser) session.getAttribute("user");
		LinkmunDelegateMapper delemapper =act.getBean(LinkmunDelegateMapper.class);
		LinkmunDelegate degegate=delemapper.selectByUsername(user.getUsername());
 %>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>后台页面-主页</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/xadmin.css">
<link rel="stylesheet" href="./lib/layui/css/layui.css">
<link rel="stylesheet"
	href="https://cdn.bootcss.com/Swiper/3.4.2/css/swiper.min.css">
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.bootcss.com/Swiper/3.4.2/js/swiper.jquery.min.js"></script>
<script src="./lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="./js/xadmin.js"></script>
<script type="text/javascript">
var req;  
 
function callback() {  
    if(req.readyState == 4 && req.status == 200) {  
        var check = req.responseText; 
        show (check);  
    }  
}  
  
function show(str) {  
	$('#username').text("尊敬的"+str);
}  
function validate() {  

    var idField = document.getElementById("userName");  
    var url = "getname.do"
    
    if(window.XMLHttpRequest) {  
        req = new XMLHttpRequest();  
    }else if(window.ActiveXObject) {  
        req = new ActiveXObject("Microsoft.XMLHTTP");  
    }  
    req.open("GET", url, true);
    req.onreadystatechange = callback;  
    req.send(null);                  
}  

$(document).ready(function() {

    var idField = document.getElementById("userName");  
    var url = "getname.do"
    
    if(window.XMLHttpRequest) {  
        req = new XMLHttpRequest();  
    }else if(window.ActiveXObject) {  
        req = new ActiveXObject("Microsoft.XMLHTTP");  
    }  
    req.open("GET", url, true);
    req.onreadystatechange = callback;  
    req.send(null);     
<%	
int node[] = (int[]) session.getAttribute("node");
			for (int i = 1; i < node.length; i++) {
				if (node[i] == 0) {
					out.println("$(\"#l" + i + "\").remove();");
				}
			}
%>
})
</script>
</head>

<body>
	<div class="container">
		<div class="logo">
			<a href="./index.jsp">LinkMUN</a>
		</div>
		<div class="open-nav">
			<i class="iconfont">&#xe699;</i>
		</div>
		<ul class="layui-nav right" lay-filter="">
			<li class="layui-nav-item"><a href="javascript:;" id="username">尊敬的用户</a>
				<dl class="layui-nav-child">
					<!-- 二级菜单 -->
					<dd>
						<a href=""></a>
					</dd>
					<dd>
						<a href="login.jsp">切换帐号</a>
					</dd>
					<dd>
						<a href="./index.jsp">退出</a>
					</dd>
				</dl></li>
			<li class="layui-nav-item"><a href="index.jsp">前台首页</a></li>
		</ul>
	</div>
	<div class="wrapper">
		<!-- 左侧菜单开始 -->
		<div class="left-nav">
			<div id="side-nav">
				<ul id="nav">
					<li class="list" current id="l1"><a href="manager.jsp"> <i
							class="iconfont">&#xe761;</i> 个人信息<i class="iconfont nav_right">&#xe697;</i>
					</a></li>
					<li class="list" id="l2"><a href="javascript:;"> <i
							class="iconfont">&#xe70b;</i> 权限管理 <i class="iconfont nav_right">&#xe697;</i>
					</a>
						<ul class="sub-menu">
							<li><a href="user_list.jsp"> <i class="iconfont">&#xe6a7;</i>
									用户列表
							</a></li>
							<li><a href="member-list.html"> <i class="iconfont">&#xe6a7;</i>
									代表列表
							</a></li>
							<li><a href="member-del.html"> <i class="iconfont">&#xe6a7;</i>
									用户删除
							</a></li>
							<li><a href="member-level.html"> <i class="iconfont">&#xe6a7;</i>
									角色管理
							</a></li>
							<li><a href="member-kiss.html"> <i class="iconfont">&#xe6a7;</i>
									权限管理
							</a></li>
							<li><a href="member-view.html"> <i class="iconfont">&#xe6a7;</i>
									浏览记录
							</a></li>
						</ul></li>
					<li class="list" id="l3"><a href="javascript:;"> <i
							class="iconfont">&#xe6a3;</i> 缴费信息<i class="iconfont nav_right">&#xe697;</i>
					</a>
						<ul class="sub-menu">
							<li><a href="./category.html"> <i class="iconfont">&#xe6a7;</i>
									分类列表
							</a></li>
						</ul></li>
					<li class="list" id="l4"><a href="javascript:;"> <i
							class="iconfont">&#xe6a3;</i> 委员会信息 <i class="iconfont nav_right">&#xe697;</i>
					</a>
						<ul class="sub-menu" style="display:none">
							<li><a href="./banner-list.html"> <i class="iconfont">&#xe6a7;</i>
									轮播列表
							</a></li>
						</ul></li>
					<li class="list" id="l5"><a href="javascript:;"> <i
							class="iconfont">&#xe6a3;</i> 缴费管理 <i class="iconfont nav_right">&#xe697;</i>
					</a>
						<ul class="sub-menu" style="display:none">
							<li><a href="./banner-list.html"> <i class="iconfont">&#xe6a7;</i>
									轮播列表
							</a></li>
						</ul></li>
					<li class="list" id="l6"><a href="javascript:;"> <i
							class="iconfont">&#xe6a3;</i> 席位管理 <i class="iconfont nav_right">&#xe697;</i>
					</a>
						<ul class="sub-menu" style="display:none">
							<li><a href="./banner-list.html"> <i class="iconfont">&#xe6a7;</i>
									轮播列表
							</a></li>
						</ul></li>
				</ul>
			</div>
		</div>

	        <div class="page-content">
          <div class="content">
            <!-- 右侧内容框架，更改从这里开始 -->
            <blockquote class="layui-elem-quote">
                欢迎来到联梦全国模拟联合国大会
            </blockquote>
            <blockquote class="layui-elem-quote">
               官方交流群：<a href="https://jq.qq.com/?wv=1027&k=5HnPVV8" target="_blank"> 642804189</a>
            </blockquote>
            <fieldset class="layui-elem-field layui-field-title site-title">
              <legend><a name="default">个人信息</a></legend>
            </fieldset>
            <table class="layui-table">
                <thead>
                    <tr>
                        <th colspan="2" scope="col">服务器信息</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th width="30%">用户名</th>
                        <td><%=user.getUsername() %></td>
                    </tr>
                    <tr>
                        <td>姓名</td>
                        <td><%=user.getRealname() %></td>
                    </tr>
                    <tr>
                        <td>性别</td>
                        <td><%=user.getSex() %></td>
                    </tr>
                    <tr>
                        <td>邮箱 </td>
                        <td><%=user.getEmail() %></td>
                    </tr>
                    <tr>
                        <td>电话 </td>
                        <td><%=user.getPhone() %></td>
                    </tr>
                    <tr>
                        <td>委员会 </td>
                        <td><%=degegate.getConference() %></td>
                    </tr>
                    <tr>
                        <td>席位 </td>
                        <td><%=degegate.getSeat() %></td>
                    </tr>
                    <tr>
                        <td>学校 </td>
                        <td><%=degegate.getSchool() %></td>
                    </tr>
                    <tr>
                        <td>注册时间 </td>
                        <td><%=user.getAddTime() %></td>
                    </tr>
                </tbody>
            </table>
            <!-- 右侧内容框架，更改从这里结束 -->
          </div>
        </div>
        <!-- 右侧主体结束 -->
        	</div>
	    <!-- 底部开始 -->
    <div class="footer">
        <div class="copyright">Copyright ©2017 LinkMUN All Rights All Rights Reserved. </div>  
    </div>
    <!-- 底部结束 -->
    <!-- 背景切换开始 -->
	<div class="bg-changer">
        <div class="swiper-container changer-list">
            <div class="swiper-wrapper">
                <div class="swiper-slide"><img class="item" src="./images/a.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="./images/b.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="./images/c.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="./images/d.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="./images/e.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="./images/f.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="./images/g.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="./images/h.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="./images/i.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="./images/j.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="./images/k.jpg" alt=""></div>
                <div class="swiper-slide"><span class="reset">初始化</span></div>
            </div>
        </div>
        <div class="bg-out"></div>
        <div id="changer-set"><i class="iconfont">&#xe696;</i></div>   
    </div>
    <!-- 背景切换结束 -->
</body>
</html>
