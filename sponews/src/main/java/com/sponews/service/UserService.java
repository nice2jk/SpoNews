package com.sponews.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sponews.dao.LoginDAO;

@Service
public class UserService {

	@Autowired
	private LoginDAO loginDAO;
	
	public HashMap<String,String> getLogin(String id, String pw) {
		return loginDAO.getLogin(id, pw);
	}
	
	public void setLogin(String id, String pw) {
		loginDAO.setLogin(id, pw);
	}
}
