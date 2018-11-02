package com.websystem.www.service;


import com.websystem.www.entity.Work;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ChartService {

	List<HashMap<String,String>> ajaxGetMonthlySalesAndCost(HashMap<String, String> paramMap);
}
