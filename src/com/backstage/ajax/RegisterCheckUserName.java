package com.backstage.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.linkmun.mapper.LinkmunUserMapper;
import com.linkmun.model.LinkmunUser;

/**
 * Servlet implementation class RegisterCheckUserName
 */
public class RegisterCheckUserName extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterCheckUserName() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		String username=request.getParameter("username");
		System.out.println(username);
		ApplicationContext act = new ClassPathXmlApplicationContext("applicationContext.xml");
		LinkmunUserMapper usermapper = act.getBean(LinkmunUserMapper.class);
		LinkmunUser user = usermapper.selectByUsername(username);
		System.out.println("usermanage："+user);
		if(user==null){
			out.write("False");
		}else{
			out.write("True");
		}
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
