package com.sponews.controller;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

@Controller
public class LoginController {

	@RequestMapping(value="/login.spn", method=RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public String login(Model model) {
		System.out.println("login");
				
		return "login";
	}
	
	@RequestMapping(value="/join.spn", method=RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public String join(Model model) {
		System.out.println("join");
				
		return "join";
	}
}
