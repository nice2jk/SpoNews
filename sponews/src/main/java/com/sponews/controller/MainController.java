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
import org.springframework.web.bind.annotation.ResponseStatus;

import com.sponews.service.MatchService;
import com.sponews.service.TipService;

@Controller
public class MainController {

	@Autowired
	private MatchService matchService;
	
	@Autowired
	private TipService tipService;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public String main(HttpServletRequest request, HttpSession session,
			Model model) {
		System.out.println("main " + session.getAttribute("login_user"));
		
		List<HashMap<String, Object>> matchList = matchService.getLatestMatchList();
		model.addAttribute("match_list", matchList);
		
		List<HashMap<String, Object>> tipList = tipService.getLatestTipList();
		model.addAttribute("tip_list", tipList);		
		
		return "main";
	}
	

}
