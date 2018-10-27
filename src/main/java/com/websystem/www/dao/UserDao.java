package com.websystem.www.dao;

import java.util.Set;

import com.websystem.www.entity.User;

public interface UserDao {

	public User getByUserName(String userName);

	public Set<String> getRoles(String userName);

	public Set<String> getPermissions(String userName);

	public Set<User> getUserList(String storeid);

	public Set<String> getTodohukenList();

	public int insUser(User user);

}
