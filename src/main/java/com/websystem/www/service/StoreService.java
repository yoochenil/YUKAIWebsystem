package com.websystem.www.service;


import java.util.List;

import com.websystem.www.entity.Store;

public interface StoreService {

	List<Store> getStoreList();

	String getRoomNum(String storeId);
}
