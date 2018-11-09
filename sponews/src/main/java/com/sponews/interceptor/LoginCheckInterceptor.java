package com.sponews.interceptor;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sponews.service.UserService;

@Service
public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private UserService userService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login_user") == null) {
			response.sendRedirect(request.getContextPath() + "/login.spn");
			return false;
		}
		
		HashMap<String, String> sessionUser = (HashMap<String, String>) session.getAttribute("login_user");
		HashMap<String, String> user = userService.getLogin(sessionUser.get("user_id"), sessionUser.get("user_pw"));
		if(user == null) {
			session.removeAttribute("login_user");
			response.sendRedirect(request.getContextPath() + "/login.spn");
			return false;
		}
		
		return true;
	}
	
	
}
