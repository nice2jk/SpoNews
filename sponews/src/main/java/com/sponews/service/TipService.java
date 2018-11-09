package com.sponews.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sponews.dao.TipDAO;

@Service
public class TipService {

	@Autowired
	private TipDAO tipDAO;
	
	public List<HashMap<String, Object>> getLatestTipList() {
		return tipDAO.getLatestTipList();
	}
}
