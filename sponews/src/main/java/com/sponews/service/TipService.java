package com.sponews.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sponews.dao.TipDAO;

@Service
public class TipService {

	@Autowired
	private TipDAO tipDAO;
	
	public List<HashMap<String, Object>> getLatestTipList() {
		return tipDAO.getLatestTipList();
	}
	
	public List<HashMap<String, Object>> getTips(int matchId) {
		return tipDAO.getTips(matchId);
	}
	
	@Transactional
	public HashMap<String, Object> getTip(int tid) {
		tipDAO.updateViewCount(tid);
		
		return tipDAO.getTip(tid);
	}
	
	@Transactional
	public HashMap<String, Object> setTip(HashMap<String, Object> requestMap) {
		int tipId = tipDAO.setTip(requestMap);
		System.out.println(tipId + " | " + requestMap.get("tid"));
		
		return tipDAO.getTip((long) requestMap.get("tid"));
	}
}
