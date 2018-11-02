package com.sponews.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.sponews.service.MatchService;
import com.sponews.service.UserService;
import com.sponews.utils.CommonUtils;

@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MatchService matchService;

	@RequestMapping(value="/login.spn", method=RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public String login(
			@RequestParam(value="id", required=false) String id,
			@RequestParam(value="pw", required=false) String pw,
			HttpServletRequest request, HttpSession session,
			Model model) {
		System.out.println("login | " + id);
		
		if(id == null) {
			return "login";
		}

		HashMap<String, String> userInfo = userService.getLogin(id, pw);
		System.out.println(userInfo);
		if(userInfo != null) {
			System.out.println("login ok");
			userInfo.remove("user_pw");
			session.setAttribute("login_user", userInfo);
			session.setAttribute("login_result", 1);			
		} else {
			System.out.println("login no");			
			session.setAttribute("login_result", 0);			
			model.addAttribute("user_id", id);
			model.addAttribute("login_result", 0);
			return "login";
		}
		
		List<HashMap<String, Object>> matchList = matchService.getLatestMatchList(CommonUtils.nowMonth());
		model.addAttribute("match_list", matchList);		
		
		return "main";
	}
	
	@RequestMapping(value="/join.spn", method=RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public String join(
			@RequestParam(value="id", required=false) String id,
			@RequestParam(value="pw", required=false) String pw,
			Model model) {
		System.out.println("join");
				
		return "join";
	}
}
