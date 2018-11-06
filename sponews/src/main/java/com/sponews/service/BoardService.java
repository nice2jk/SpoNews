package com.sponews.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sponews.dao.BoardDAO;

@Service
public class BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	public List<HashMap<String, Object>> getArticles(int offset) {
		return boardDAO.getArticles(offset);
	}
	
	public HashMap<String, Object> getArticle(int aid) {
		boardDAO.updateViewCount(aid);
		return boardDAO.getArticle(aid);
	}
	
	@Transactional
	public HashMap<String, Object> setArticle(HashMap<String, Object> requestMap) {
		int articleId = boardDAO.setArticle(requestMap);
		System.out.println(articleId + " | " + requestMap.get("aid"));
		return null;
	}
}
