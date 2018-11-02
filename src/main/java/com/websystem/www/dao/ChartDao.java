package com.websystem.www.dao;

import com.websystem.www.entity.Work;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ChartDao {

	List<HashMap<String,String>> ajaxGetMonthlySalesAndCost(HashMap<String, String> paramMap);

}
