package com.sponews.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BoardDAO {

	public List<HashMap<String, Object>> getArticles(@Param("offset") int offset);
	public int setArticle(HashMap<String, Object> requestMap);
	public HashMap<String, Object> getArticle(@Param("aid") long aid);
	public void updateViewCount(@Param("aid") int aid);
}
