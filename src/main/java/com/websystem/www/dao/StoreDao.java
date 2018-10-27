package com.websystem.www.dao;


import java.util.List;

import com.websystem.www.entity.Store;

public interface StoreDao {

	List<Store> getStoreList();

	String getRoomNum(String storeId);
}
