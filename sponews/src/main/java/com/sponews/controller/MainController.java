package com.sponews.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.sponews.service.MatchService;
import com.sponews.utils.CommonUtils;

@Controller
public class MainController {

	@Autowired
	private MatchService matchService;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public String main(Model model) {
		System.out.println("main");
		
		List<HashMap<String, Object>> matchList = matchService.getLatestMatchList(CommonUtils.nowMonth());
		model.addAttribute("match_list", matchList);
		
		return "main";
	}
}