package com.sponews.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.sponews.service.MatchService;
import com.sponews.utils.CommonUtils;

@Controller
public class MatchController {

	@Autowired
	private MatchService matchService;
	
	@RequestMapping(value="/match.spn", method=RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public String getMatchList(
			@RequestParam(value="league", required=true, defaultValue="EPL") String league,
			@RequestParam(value="month", required=true, defaultValue="0") int month,
			Model model) {
		System.out.println("getMatchList " + month);
		
		if(month == 0) {
			month = CommonUtils.nowMonth();
		}
		
		model.addAttribute("league", league);
		model.addAttribute("match_list", matchService.getMatchList(league, month));
		model.addAttribute("month", month);
		
		return "match_list";
	}
	
	@RequestMapping(value="/result.spn", method=RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public String getResultList(
			@RequestParam(value="league", required=true, defaultValue="EPL") String league,
			@RequestParam(value="month", required=true, defaultValue="0") int month,
			Model model) {
		System.out.println("getResultList " + month);
		
		if(month == 0) {
			month = CommonUtils.nowMonth();
		}
		
		model.addAttribute("league", league);
		model.addAttribute("match_list", matchService.getResultList(league, month));
		model.addAttribute("month", month);
		
		return "result_list";
	}
}
