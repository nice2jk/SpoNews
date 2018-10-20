package com.sponews.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sponews.dao.MatchDAO;

@Service
public class MatchService {
	
	@Autowired
	private MatchDAO matchDAO;
	
	public List<HashMap<String, Object>> getLatestMatchList(int month) {
		return matchDAO.getLatestMatchList(month);
	}
	
	public List<HashMap<String, Object>> getAllMatchList(String league, int month) {
		return matchDAO.getAllMatchList(league, month);
	}
	
	
	public List<HashMap<String, Object>> getMatchList(String league, int month) {
		return matchDAO.getMatchList(league, month);
	}
	

	public List<HashMap<String, Object>> getResultList(String league, int month) {
		return matchDAO.getResultList(league, month);
	}

}
