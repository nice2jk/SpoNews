package com.sponews.dao;

import java.util.HashMap;
import java.util.List;


public interface TipDAO {

	public List<HashMap<String, Object>> getLatestTipList();
	
}
