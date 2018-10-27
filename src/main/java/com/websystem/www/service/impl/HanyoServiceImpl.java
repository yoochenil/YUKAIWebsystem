package com.websystem.www.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.websystem.www.dao.HanyoDao;
import com.websystem.www.entity.Hanyo;
import com.websystem.www.service.HanyoService;

@Service("hanyoService")
public class HanyoServiceImpl implements HanyoService {

	@Resource
	private HanyoDao hanyoDao;

	@Override
	public List<Hanyo> getHanyoByKb(String kb_hanyo) {
		return hanyoDao.getHanyoByKb(kb_hanyo);
	}



}
