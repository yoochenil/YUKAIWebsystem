package com.websystem.www.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.websystem.www.dao.StoreDao;
import com.websystem.www.entity.Store;
import com.websystem.www.service.StoreService;

@Service("storeService")
public class StoreServiceImpl implements StoreService {

	@Resource
	private StoreDao storeDao;

	@Override
	public List<Store> getStoreList() {
		return storeDao.getStoreList();
	}

	@Override
	public String getRoomNum(String storeId) {
		return storeDao.getRoomNum(storeId);
	}

}
