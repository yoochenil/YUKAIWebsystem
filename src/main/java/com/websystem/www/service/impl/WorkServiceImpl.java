package com.websystem.www.service.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import com.websystem.www.dao.WorkDao;
import com.websystem.www.entity.Work;
import com.websystem.www.service.WorkService;

@Service("workService")
public class WorkServiceImpl implements WorkService {


	@Resource
	private WorkDao workDao;

	@Override
	public List<Map<String, String>> getTodayWork(String today) {

		return workDao.getTodayWork(today);
	}

    @Override
	@ResponseBody
	public List<Work> ajaxGetWork(HashMap<String, String> paramMap) {
		return workDao.ajaxGetWork(paramMap);

	}

    @Override
    public int insWork(Work work) {
        return workDao.insWork(work);
    }

    @Override
	public int updWork(Work work){
		return workDao.updWork(work);
	}

	@Override
    public int delWork(String id){
	    return workDao.delWork(id);
    }

    @Override
    public List<HashMap<String,String>> ajaxGetWorkDataTable(HashMap<String, String> paramMap) {
        return workDao.ajaxGetWorkDataTable(paramMap);
    }

}
