package com.sponews.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sponews.commons.Constants;
import com.sponews.utils.HttpUtils;

@Service
public class NewsService {
	
	public List<HashMap<String, Object>> getNewsList(int offset) {
		HttpUtils httpUtils = HttpUtils.getInstance();
		
		String contents = httpUtils.getHttpHTML(Constants.NEWS_URL);
		System.out.println(contents);
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			List<HashMap<String, Object>> newsList = mapper.readValue(contents, new TypeReference<List<HashMap<String, Object>>>(){});
			return newsList;
		} catch (Exception e) {
			System.out.println("News Parsing Eexception : " + e.getMessage());			
		}
		
		return null;
	}

}
