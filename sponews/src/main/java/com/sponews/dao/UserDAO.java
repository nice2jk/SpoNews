package com.sponews.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

public interface UserDAO {

	public HashMap<String, String> getUser(@Param("user_id") String id);
}
