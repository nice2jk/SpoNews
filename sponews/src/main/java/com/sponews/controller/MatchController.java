package com.sponews.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.sponews.service.MatchService;
import com.sponews.service.TipService;
import com.sponews.utils.CommonUtils;

@Controller
public class MatchController {

	@Autowired
	private MatchService matchService;
	
	@Autowired
	private TipService tipService;
	
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
		
		List<HashMap<String, Object>> matchList = matchService.getMatchList(league);
		model.addAttribute("league", league);
		model.addAttribute("match_list", matchList);
		model.addAttribute("size", matchList.size());		
		
		return "match_list";
	}
	
	@RequestMapping(value="/matchDetail.spn", method=RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public String getMatchDetail(
			@RequestParam(value="match_id", required=true) int matchId,
			Model model) {
		System.out.println("getMatchDetail " + matchId);

		model.addAttribute("match", matchService.getMatchWithComments(matchId));
		model.addAttribute("tips", tipService.getTips(matchId));
		
		return "match_detail";
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
		
		List<HashMap<String, Object>> matchList = matchService.getResultList(league, month);
		
		model.addAttribute("league", league);
		model.addAttribute("match_list", matchList);
		model.addAttribute("size", matchList.size());
		model.addAttribute("month", month);
		
		return "result_list";
	}
	
	@RequestMapping(value="/matchComment.spn", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public String getMatchStory(int matchId, String comment, int inlineRadioOptions, Model model) {
		System.out.println("matchComment " + matchId);
		
		HashMap<String, Object> match = matchService.setComment(matchId, inlineRadioOptions, comment); 
		model.addAttribute("match", match);
		model.addAttribute("league", (String) match.get("league"));
		model.addAttribute("tips", tipService.getTips(matchId));
		
		return "match_detail";
	}
}
