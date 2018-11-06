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

import com.sponews.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/board.spn", method=RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public String getArticles(
			@RequestParam(value="month", required=true, defaultValue="0") int offset,
			Model model) {		
		System.out.println("articles : " + offset);
		
		List<HashMap<String, Object>> articleMap = boardService.getArticles(offset);
		model.addAttribute("articles", articleMap);
		model.addAttribute("offset", offset);
		
		return "board";		
	}
	
	@RequestMapping(value="/write.spn", method=RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public String write() {		
		System.out.println("articles");
		
		return "write";		
	}
	
	@RequestMapping (value = "/write.done", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public String writeArticle(String atitle, String abody, 
			HttpServletRequest request, HttpSession session) {
		System.out.println("write done");
		
		if(session.getAttribute("login_user") == null) {
			return "write";
		} else {
			@SuppressWarnings("unchecked")
			String userId = ((HashMap<String, String>) session.getAttribute("login_user")).get("user_id");
			System.out.println(userId);
			
			HashMap<String, Object> requestMap = new HashMap<String, Object>();
			requestMap.put("userId", userId);
			requestMap.put("atitle", atitle);
			requestMap.put("abody", abody);
			boardService.setArticle(requestMap);
		}
		
		return "board";
	}
	
	@RequestMapping (value = "/article", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public String getArticle(@RequestParam(value="aid", required=true) int aid, Model model) {
		System.out.println("getArticle GET : " + aid);
		
		HashMap<String, Object> article = boardService.getArticle(aid);
		model.addAttribute("article", article);
		
		return "article";
	}

}
