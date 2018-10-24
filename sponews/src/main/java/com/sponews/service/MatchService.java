package com.sponews.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sponews.dao.MatchDAO;

@Service
public class MatchService {
	
	@Autowired
	private MatchDAO matchDAO;
	
	public List<HashMap<String, Object>> getLatestMatchList(int month) {
		return matchDAO.getLatestMatchList(month);
	}
	
	public List<HashMap<String, Object>> getMatchList(String league, int month) {
		return matchDAO.getMatchList(league, month);
	}
	
	public HashMap<String, Object> getMatch(int matchId) {
		HashMap<String, Object> match = matchDAO.getMatch(matchId);
		
		List<HashMap<String, Object>> commentList = matchDAO.getCommentList(matchId);
		match.put("comment_list", commentList);
		
		HashMap<String, Object> commentCount= matchDAO.getCommentCount(matchId);
		for(String key : commentCount.keySet()) {
			match.put(key, commentCount.get(key));
		}	
		
		return match;
	}

	public List<HashMap<String, Object>> getResultList(String league, int month) {
		return matchDAO.getResultList(league, month);
	}
	
	@Transactional
	public HashMap<String, Object> setComment(int matchId, int result, String comment) { 
		matchDAO.setComment(matchId, result, comment);
		HashMap<String, Object> match = matchDAO.getMatch(matchId);
		
		List<HashMap<String, Object>> commentList = matchDAO.getCommentList(matchId);
		match.put("comment_list", commentList);
		
		HashMap<String, Object> commentCount= matchDAO.getCommentCount(matchId);
		for(String key : commentCount.keySet()) {			
			match.put(key, commentCount.get(key));
		}	
			
		return match;
	}

}
