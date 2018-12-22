package com.sponews.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;


public interface TipDAO {

	public List<HashMap<String, Object>> getLatestTipList();
	public List<HashMap<String, Object>> getTips(@Param("matchId") int matchId);
	public int setTip(HashMap<String, Object> requestMap);
	public HashMap<String, Object> getTip(@Param("tid") long tid); 
	public void updateViewCount(@Param("tid") int tid);
	public int getTipCount(@Param("matchId") int matchId);
	
}
