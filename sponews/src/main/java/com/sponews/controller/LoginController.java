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
		
		if(id == null || pw == null) {
			return "login";
		}

		HashMap<String, String> userInfo = userService.getLogin(id, pw);
		System.out.println(userInfo);
		if(userInfo != null) {
			userInfo.remove("user_pw");
			session.setAttribute("login_user", userInfo);						
		} else {
			model.addAttribute("user_id", id);
			model.addAttribute("result", "다시 로그인 해 주세요!");
			
			return "login";
		}
		
		List<HashMap<String, Object>> matchList = matchService.getLatestMatchList(CommonUtils.nowMonth());
		model.addAttribute("match_list", matchList);
		
		return "main";
	}
	
	@RequestMapping(value="/logout.spn", method=RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public String logout(
			HttpServletRequest request, HttpSession session,
			Model model) {
		System.out.println("logout");
		
		if(session.getAttribute("login_user") != null) {
			session.removeAttribute("login_user");
		}
		
		List<HashMap<String, Object>> matchList = matchService.getLatestMatchList(CommonUtils.nowMonth());
		model.addAttribute("match_list", matchList);
		
		return "main";
	}
	
	@RequestMapping(value="/join.spn", method=RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public String join(
			HttpSession session,
			Model model) {
		System.out.println("join");
		
		if(session.getAttribute("login_user") != null) {
			session.removeAttribute("login_user");
		}
		
		return "join";
	}
	
	@RequestMapping(value="/join.done", method=RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public String joinDone(
			@RequestParam(value="id", required=false) String id,
			@RequestParam(value="pw", required=false) String pw,
			@RequestParam(value="nm", required=false) String nm,
			HttpSession session,
			Model model) {
		System.out.println("join done | " + id + " | " + nm);
		
		if(userService.setJoin(id, pw, nm) == false) {
			model.addAttribute("result", "중복 ID가 있습니다.");
			model.addAttribute("user_id", id);
			
			return "join";
		}
		
		if(session.getAttribute("login_user") != null) {
			session.removeAttribute("login_user");
		}
		
		HashMap<String, String> userInfo = userService.getLogin(id, pw);
		System.out.println(userInfo);
		if(userInfo != null) {
			userInfo.remove("user_pw");
			session.setAttribute("login_user", userInfo);						
		} else {
			model.addAttribute("user_id", id);
			model.addAttribute("result", "다시 로그인 해 주세요!");
			
			return "login";
		}
		
		List<HashMap<String, Object>> matchList = matchService.getLatestMatchList(CommonUtils.nowMonth());
		model.addAttribute("match_list", matchList);
		
		return "main";
	}
}
