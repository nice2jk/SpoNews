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

import com.sponews.service.NewsService;

@Controller
public class NewsController {

	@Autowired
	private NewsService newsService;
	
	@RequestMapping(value="/news.spn", method=RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public String getNewsList(
			@RequestParam(value="offset", required=true, defaultValue="0") int offset,
			Model model) {
		System.out.println("getNewsList ");
		
		List<HashMap<String, Object>> newsList = newsService.getNewsList(offset);
		model.addAttribute("news_list", newsList);
		model.addAttribute("offset", offset);
		
		return "news_list";
	}
}
