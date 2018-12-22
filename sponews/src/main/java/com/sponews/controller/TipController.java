package com.sponews.controller;

import java.util.HashMap;

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
import com.sponews.service.TipService;

@Controller
public class TipController {
	
	@Autowired
	private MatchService matchService;
	
	@Autowired
	private TipService tipService;

	@RequestMapping(value="/tips.spn", method=RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public String tipList(
			@RequestParam(value="match_id", required=true) int matchId,
			Model model) {
		
		return "tip_list";
	}
	
	@RequestMapping(value="/tip_write.spn", method=RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public String tipWrite(
			@RequestParam(value="match_id", required=true) int matchId,
			Model model) {
		
		model.addAttribute("match", matchService.getMatch(matchId));
		
		return "tip_write";
	}
	
	@RequestMapping(value="/tip_write.done", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public String tipWriteDone(
			String matchId, String ttitle, String tbody, int toptions, int trange,
			HttpServletRequest request, HttpSession session, Model model) {
		System.out.println("tip write done");
		
		if(session.getAttribute("login_user") != null) {
			@SuppressWarnings("unchecked")
			String userId = ((HashMap<String, String>) session.getAttribute("login_user")).get("user_id");
			
			HashMap<String, Object> requestMap = new HashMap<String, Object>();
			requestMap.put("userId", userId);
			requestMap.put("matchId", matchId);			
			requestMap.put("ttitle", ttitle);
			requestMap.put("tbody", tbody);			
			requestMap.put("result", toptions);
			requestMap.put("bet", trange);
			
			model.addAttribute("tip", tipService.setTip(requestMap));
			
			return "tip_view";
		}
		
		return "redirect:/tip_write.spn?match_id=" + matchId;
	}
	
	@RequestMapping(value="/tip_view.spn", method=RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public String tipView(
			@RequestParam(value="tip_id", required=true) int tid,
			Model model) {
		System.out.println("tip view");
		
		model.addAttribute("tip", tipService.getTip(tid));
		
		return "tip_view";
	}
			
	
}
