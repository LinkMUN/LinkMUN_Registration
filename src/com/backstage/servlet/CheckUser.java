package com.backstage.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.linkmun.mapper.LinkmunNodeMapper;
import com.linkmun.mapper.LinkmunRodeNodeMapper;
import com.linkmun.mapper.LinkmunRoleMapper;
import com.linkmun.mapper.LinkmunUserMapper;
import com.linkmun.model.LinkmunRodeNode;
import com.linkmun.model.LinkmunRole;
import com.linkmun.model.LinkmunUser;
import com.tools.*;

/**
 * Servlet implementation class CheckUser
 */
public class CheckUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println("username:" + username);
		System.out.println("password:" + password);
		password = Md.md5_16(password);// 密码加密
		System.out.println("md5_password:" + password);
		ApplicationContext act = new ClassPathXmlApplicationContext("applicationContext.xml");
		LinkmunUserMapper usermapper = act.getBean(LinkmunUserMapper.class);
		LinkmunUser user = usermapper.selectByUsername(username);// 用户名登录判断
		boolean pd = true;
		if (user == null) {
			user = usermapper.selectByEmail(username);// 邮箱登录判断
			if (user == null) {
				System.out.println("登录失败");
				pd = false;
			} else {
				System.out.println("邮箱登陆");
			}
		} else {
			System.out.println("用户名登录");
		}
		if (pd) {
			if (!user.getPassword().equals(password)) {
				pd = false;
				System.out.println("密码错误");
			}
			if (user.getIsEnabled()==0) {
				pd = false;
				System.out.println("用户不可用");
			}
		}
		if (pd) {
			// 获取角色
			LinkmunRoleMapper rolemapper = act.getBean(LinkmunRoleMapper.class);
			LinkmunRole role = rolemapper.selectByrolename(user.getRole());
			System.out.println(role);

			// 获取权限表
			LinkmunNodeMapper nodemapper = act.getBean(LinkmunNodeMapper.class);
			int a = nodemapper.sclectcount();
			int node[] = new int[a + 1];

			// 获取对应表
			LinkmunRodeNodeMapper rolenodemapper = act.getBean(LinkmunRodeNodeMapper.class);
			List<LinkmunRodeNode> li = rolenodemapper.selectByRode(role.getLevel());
			for (LinkmunRodeNode a1 : li) {
				node[a1.getLinkmunNodeId()] = 1;
			}
			HttpSession s = request.getSession();
			s.setAttribute("node", node);
			s.setAttribute("user", user);
			response.sendRedirect("back.jsp");
		} else {
			response.sendRedirect("index.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
