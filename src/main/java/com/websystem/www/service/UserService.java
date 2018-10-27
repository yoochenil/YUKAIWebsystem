package com.websystem.www.service;


import java.util.Set;

import com.websystem.www.entity.Course;
import com.websystem.www.entity.User;

public interface UserService {

	User getByUserName(String userName);

	Set<String> getRoles(String account);

	Set<String> getPermissions(String account);

	Set<User> getUserList(String storeid);

	Set<String> getTodohukenList();

	int insUser(User user);

}
