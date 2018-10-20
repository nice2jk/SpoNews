package com.sponews.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MatchDAO {

	public List<HashMap<String, Object>> getLatestMatchList(@Param("month") int month);
	public List<HashMap<String, Object>> getAllMatchList(@Param("league") String league, @Param("month") int month);
	public List<HashMap<String, Object>> getMatchList(@Param("league") String league, @Param("month") int month);
	public List<HashMap<String, Object>> getResultList(@Param("league") String league, @Param("month") int month);
}
