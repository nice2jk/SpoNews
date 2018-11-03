package com.sponews.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sponews.dao.LoginDAO;
import com.sponews.dao.UserDAO;

@Service
public class UserService {

	@Autowired
	private LoginDAO loginDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	public HashMap<String,String> getLogin(String id, String pw) {
		return loginDAO.getLogin(id, pw);
	}

	@Transactional
	public boolean setJoin(String id, String pw, String nm) {
		if(userDAO.getUser(id) != null) {
			return false;
		}
		
		loginDAO.setJoin(id, pw, nm);
		
		return true;
	}
}
