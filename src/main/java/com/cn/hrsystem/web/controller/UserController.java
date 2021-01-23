package com.cn.hrsystem.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cn.hrsystem.domain.User;
import com.cn.hrsystem.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login")
	public String login(HttpServletRequest req,HttpServletResponse res) {
		HttpSession session = req.getSession();
		
		session.removeAttribute("user");
		
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		
		User u = userService.login(user);
		if(u != null) {
			session.setAttribute("user", u);
			return "forward:/index.jsp";
		}
		
		// 给出错误提示信息
		req.setAttribute("login_msg", "用户名或密码错误！");
		
		return "forward:/login.jsp";
	}
	
}
