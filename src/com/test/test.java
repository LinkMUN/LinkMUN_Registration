package com.test;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.*;
import org.springframework.context.ApplicationContext;
import com.linkmun.mapper.*;
import com.linkmun.model.*;

public class test {
	public static void main(String[] args) {
		ApplicationContext act = new ClassPathXmlApplicationContext("applicationContext.xml");
		LinkmunUserMapper usermapper=act.getBean(LinkmunUserMapper.class);
//		List<LinkmunUser> users=usermapper.selectAll();
//		for(LinkmunUser user:users)
//		{
//			System.out.println(user);
//		}
		
		LinkmunUser user=usermapper.selectByEmail("j10k@qq.com");
		System.out.println(user);
		LinkmunRoleMapper rolemapper=act.getBean(LinkmunRoleMapper.class);
		LinkmunRole role=rolemapper.selectByrolename(user.getRole());
		System.out.println(role);
		LinkmunNodeMapper nodemapper=act.getBean(LinkmunNodeMapper.class);
		int a=nodemapper.sclectcount();
		System.out.println(a);
		LinkmunRodeNodeMapper rolenodemapper=act.getBean(LinkmunRodeNodeMapper.class);
		List<LinkmunRodeNode> li=rolenodemapper.selectByRode(role.getLevel());
		for(LinkmunRodeNode a1:li){
			System.out.println(a1);
		}
		
	}
}
