package com.backstage.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.linkmun.model.*;
import com.linkmun.mapper.*;
import com.tools.*;

/**
 * Servlet implementation class Userregister
 */
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=df.format(new Date());
		LinkmunUser user=new LinkmunUser();
		LinkmunDelegate delegate=new LinkmunDelegate();
		LinkmunFare fare=new LinkmunFare();
		LinkmunTest test=new LinkmunTest();
		Param2Bean.add_param2Bean(request, user);
		Param2Bean.add_param2Bean(request, delegate);
		Param2Bean.add_param2Bean(request, fare);
		System.out.println(user);
		System.out.println(delegate);
		System.out.println(fare);
		user.setRole("代表");
		user.setIsEnabled(1);
		user.setAddTime(time);
		user.setPassword(Md.md5_16(user.getPassword()));
		test.setConference(delegate.getFirst());

		ApplicationContext act = new ClassPathXmlApplicationContext("applicationContext.xml");
		LinkmunDelegateMapper delemapper =act.getBean(LinkmunDelegateMapper.class);
		int testid=delemapper.sclectcount()+1;
		delegate.setTestid(String.valueOf(testid));
		test.setTestid(testid);
		delemapper.insertSelective(delegate);
		LinkmunUserMapper usermapper=act.getBean(LinkmunUserMapper.class);
		usermapper.insertSelective(user);
		LinkmunFareMapper faremapper=act.getBean(LinkmunFareMapper.class);
		faremapper.insertSelective(fare);
		LinkmunTestMapper testmapper=act.getBean(LinkmunTestMapper.class);
		testmapper.insertSelective(test);
		response.sendRedirect("index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
