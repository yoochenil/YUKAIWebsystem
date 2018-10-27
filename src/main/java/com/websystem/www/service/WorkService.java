package com.websystem.www.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.websystem.www.entity.Work;

public interface WorkService {

	List<Map<String,String>> getTodayWork(String today);

	List<Work> ajaxGetWork(HashMap<String, String> paramMap);

	int insWork(Work work);

    int updWork(Work work);

    int delWork(String id);
}