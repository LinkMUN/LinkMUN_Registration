<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="org.springframework.context.ApplicationContext"%>
<%@ page import="com.linkmun.mapper.*" %>
<%@ page import="com.linkmun.model.*" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>后台页面-主页</title>

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

<%LinkmunUser user;
				int node[] = (int[]) session.getAttribute("node");
				user = (LinkmunUser) session.getAttribute("user");
				for (int i = 1; i < node.length; i++) {
					if (node[i] == 0) {
						out.println("$(\"#l" + i + "\").remove();");
					}
				}%>
})
</script>
</head>

<body>
	<div class="container">
		<div class="logo">
			<a href="./index.html">LinkMUN</a>
		</div>
		<div class="open-nav">
			<i class="iconfont">&#xe699;</i>
		</div>
		<ul class="layui-nav right" lay-filter="">
			<li class="layui-nav-item"><a href="javascript:;" id="username">尊敬的用户
			</a>
				<dl class="layui-nav-child">
					<!-- 二级菜单 -->
					<dd>
						<a href=""></a>
					</dd>
					<dd>
						<a href="">切换帐号</a>
					</dd>
					<dd>
						<a href="./login.html">退出</a>
					</dd>
				</dl></li>
			<li class="layui-nav-item"><a href="/">前台首页</a></li>
		</ul>
	</div>
	<div class="wrapper">
		<!-- 左侧菜单开始 -->
		<div class="left-nav">
			<div id="side-nav">
				<ul id="nav">
					<li class="list" current id="l1"><a href=""> <i
							class="iconfont">&#xe761;</i> 个人信息<i class="iconfont nav_right">&#xe697;</i>
					</a></li>
					<li class="list" id="l2"><a href="javascript:;"> <i
							class="iconfont">&#xe70b;</i> 权限管理 <i class="iconfont nav_right">&#xe697;</i>
					</a>
						<ul class="sub-menu">
							<li><a href="member-list.html"> <i class="iconfont">&#xe6a7;</i>
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
			<!-- 右侧主体开始 -->
	<div class="page-content">
		<div class="content">
			<!-- 右侧内容框架，更改从这里开始 -->
			<xblock>
			<button class="layui-btn layui-btn-danger" onclick="delAll()">
				<i class="layui-icon">&#xe640;</i>批量删除
			</button>
			<button class="layui-btn"
				onclick="member_add('添加用户','member-add.html','600','500')">
				<i class="layui-icon">&#xe608;</i>添加
			</button>
			<span class="x-right" style="line-height:40px">共有数据：88 条</span></xblock>
			<table class="layui-table">
				<thead>
					<tr>
						<th><input type="checkbox" name="" value=""></th>
						<th>ID</th>
						<th>用户名</th>
						<th>性别</th>
						<th>手机</th>
						<th>邮箱</th>
						<th>真名</th>
						<th>加入时间</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<%		
		ApplicationContext act = new ClassPathXmlApplicationContext("applicationContext.xml");
		LinkmunUserMapper usermapper=act.getBean(LinkmunUserMapper.class);
		List<LinkmunUser> users=usermapper.selectAll();
		for(int i=0;i<users.size();i++){
				 %>
				 <tr>
				 	<td><input type="checkbox" value="1" name=""></td>
				 	<td><%=users.get(i).getId()%></td>
				 	<td><%=users.get(i).getUsername() %></td>
				 	<td><%=users.get(i).getSex()%></td>
				 	<td><%=users.get(i).getPhone()%></td>
				 	<td><%=users.get(i).getEmail() %></td>
				 	<td><%=users.get(i).getRealname() %></td>
				 	<td><%=users.get(i).getAddTime() %></td>
				 	<td class="td-status"><span class="layui-btn layui-btn-normal layui-btn-mini"><%=users.get(i).getIsEnabled() %></span></td>
				 	<td><a style="text-decoration:none"
							onclick="member_stop(this,'10001')" href="javascript:;"
							title="停用"> <i class="layui-icon">&#xe601;</i>
						</a> <a title="编辑" href="javascript:;"
							onclick="member_edit('编辑','member-edit.html','4','','510')"
							class="ml-5" style="text-decoration:none"> <i
								class="layui-icon">&#xe642;</i>
						</a> <a style="text-decoration:none"
							onclick="member_password('修改密码','m	ember-password.html','10001','600','400')"
							href="javascript:;" title="修改密码"> <i class="layui-icon">&#xe631;</i>
						</a> <a title="删除" href="DelectUser?id=<%=users.get(i).getId()%>"> <i class="layui-icon">&#xe640;</i>
						</a><td>
				 </tr>
				 <%} %>
					<tr>
						<td><input type="checkbox" value="1" name=""></td>
						<td>1</td>
						<td>小明 </td>
						<td>男</td>
						<td>13000000000</td>
						<td>admin@mail.com</td>
						<td>北京市 海淀区</td>
						<td>2017-01-01 11:11:42</td>
						<td class="td-status"><span
							class="layui-btn layui-btn-normal layui-btn-mini"> 已启用 </span></td>
						<td class="td-manage"><a style="text-decoration:none"
							onclick="member_stop(this,'10001')" href="javascript:;"
							title="停用"> <i class="layui-icon">&#xe601;</i>
						</a> <a title="编辑" href="javascript:;"
							onclick="member_edit('编辑','member-edit.html','4','','510')"
							class="ml-5" style="text-decoration:none"> <i
								class="layui-icon">&#xe642;</i>
						</a> <a style="text-decoration:none"
							onclick="member_password('修改密码','m	ember-password.html','10001','600','400')"
							href="javascript:;" title="修改密码"> <i class="layui-icon">&#xe631;</i>
						</a> <a title="删除" href="javascript:;" onclick="member_del(this,'1')"
							style="text-decoration:none"> <i class="layui-icon">&#xe640;</i>
						</a></td>
					</tr>
					<tr>
						<td><input type="checkbox" value="1" name=""></td>
						<td>1</td>
						<td><u style="cursor:pointer"
							onclick="member_show('张三','member-show.html','10001','360','400')">
								小明 </u></td>
						<td>男</td>
						<td>13000000000</td>
						<td>admin@mail.com</td>
						<td>北京市 海淀区</td>
						<td>2017-01-01 11:11:42</td>
						<td class="td-status"><span
							class="layui-btn layui-btn-normal layui-btn-mini"> 已启用 </span></td>
						<td class="td-manage"><a style="text-decoration:none"
							onclick="member_stop(this,'10001')" href="javascript:;"
							title="停用"> <i class="layui-icon">&#xe601;</i>
						</a> <a title="编辑" href="javascript:;"
							onclick="member_edit('编辑','member-edit.html','4','','510')"
							class="ml-5" style="text-decoration:none"> <i
								class="layui-icon">&#xe642;</i>
						</a> <a style="text-decoration:none"
							onclick="member_password('修改密码','member-password.html','10001','600','400')"
							href="javascript:;" title="修改密码"> <i class="layui-icon">&#xe631;</i>
						</a> <a title="删除" href="javascript:;" onclick="member_del(this,'1')"
							style="text-decoration:none"> <i class="layui-icon">&#xe640;</i>
						</a></td>
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
		<div class="copyright">Copyright ©2018 LinkMUN All Rights
			Reserved.</div>
	</div>
	<!-- 底部结束 -->
	<!-- 背景切换开始 -->
	<div class="bg-changer">
		<div class="swiper-container changer-list">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<img class="item" src="./images/a.jpg" alt="">
				</div>
				<div class="swiper-slide">
					<img class="item" src="./images/b.jpg" alt="">
				</div>
				<div class="swiper-slide">
					<img class="item" src="./images/c.jpg" alt="">
				</div>
				<div class="swiper-slide">
					<img class="item" src="./images/d.jpg" alt="">
				</div>
				<div class="swiper-slide">
					<img class="item" src="./images/e.jpg" alt="">
				</div>
				<div class="swiper-slide">
					<img class="item" src="./images/f.jpg" alt="">
				</div>
				<div class="swiper-slide">
					<img class="item" src="./images/g.jpg" alt="">
				</div>
				<div class="swiper-slide">
					<img class="item" src="./images/h.jpg" alt="">
				</div>
				<div class="swiper-slide">
					<img class="item" src="./images/i.jpg" alt="">
				</div>
				<div class="swiper-slide">
					<img class="item" src="./images/j.jpg" alt="">
				</div>
				<div class="swiper-slide">
					<img class="item" src="./images/k.jpg" alt="">
				</div>
				<div class="swiper-slide">
					<span class="reset">初始化</span>
				</div>
			</div>
		</div>
		<div class="bg-out"></div>
		<div id="changer-set">
			<i class="iconfont">&#xe696;</i>
		</div>
	</div>
	<!-- 背景切换结束 -->
</body>
</html>
