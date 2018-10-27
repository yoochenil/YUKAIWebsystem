package com.websystem.www.service.impl;


import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.websystem.www.dao.UserDao;
import com.websystem.www.entity.User;
import com.websystem.www.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource
	private UserDao userDao;

	@Override
	public User getByUserName(String userName) {
		return userDao.getByUserName(userName);
	}

    @Override
	public Set<String> getRoles(String account) {
		return userDao.getRoles(account);
	}

    @Override
	public Set<String> getPermissions(String account) {
		return userDao.getPermissions(account);
	}

    @Override
	public Set<User> getUserList(String storeid){
		return userDao.getUserList(storeid);
	}

    @Override
	public Set<String> getTodohukenList() {
		return userDao.getTodohukenList();
	}

    @Override
	public int insUser(User user) {
		return userDao.insUser(user);
	};


}
