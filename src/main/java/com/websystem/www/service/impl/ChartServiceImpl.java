package com.websystem.www.service.impl;


import com.websystem.www.dao.ChartDao;
import com.websystem.www.dao.WorkDao;
import com.websystem.www.entity.Work;
import com.websystem.www.service.ChartService;
import com.websystem.www.service.WorkService;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("chartService")
public class ChartServiceImpl implements ChartService {

	@Resource
	ChartDao chartDao;

	@Override
	public List<HashMap<String, String>> ajaxGetMonthlySalesAndCost(HashMap<String, String> paramMap) {
		return chartDao.ajaxGetMonthlySalesAndCost(paramMap);
	}
}
