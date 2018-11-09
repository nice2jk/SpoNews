package com.sponews.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MatchDAO {

	public List<HashMap<String, Object>> getLatestMatchList();
	public List<HashMap<String, Object>> getMatchList(@Param("league") String league);
	public List<HashMap<String, Object>> getMatchList(@Param("league") String league, @Param("month") int month);
	public List<HashMap<String, Object>> getResultList(@Param("league") String league, @Param("month") int month);
	public HashMap<String, Object> getMatch(@Param("match_id") int matchId);
	public List<HashMap<String, Object>> getMatchWithComment(@Param("match_id") int matchId);
	public void setComment(@Param("matchId") int matchId, @Param("result") int result, @Param("story") String comment);
	public List<HashMap<String, Object>> getCommentList(@Param("match_id") int matchId);
	public HashMap<String, Object> getCommentCount(@Param("match_id") int matchId);
}
