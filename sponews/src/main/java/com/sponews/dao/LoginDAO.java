package com.sponews.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

public interface LoginDAO {

	public HashMap<String, String> getLogin(@Param("user_id") String id, @Param("user_pw") String pw);
	public void setJoin(@Param("user_id") String id, @Param("user_pw") String pw, @Param("user_nm") String nm);
}
