package com.websystem.www.controller;


import com.google.gson.Gson;
import com.websystem.www.service.HanyoService;
import com.websystem.www.service.StoreService;
import com.websystem.www.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;


@Controller
public class StoreController {

    private static final Logger logger = LoggerFactory.getLogger(StoreController.class);

    @Autowired
    UserService userService;

    @Autowired
    StoreService storeService;

    @Autowired
    HanyoService hanyoService;


    @RequestMapping(value = "/get-store-info", produces="text/plain; charset=UTF-8")
	@ResponseBody
    public String getStoreInfo(String storeId){
        int roomNum = Integer.parseInt(storeService.getRoomNum(storeId));

        Map<String,String> storeMap;
        List<Map<String,String>> storeInfo = new ArrayList<Map<String,String>>();

        for(int i = 1;i <= roomNum;i++){
            storeMap =  new HashMap<String, String>();
            storeMap.put("id","store" + storeId + "room" + i);
            storeMap.put("store",storeId + "号店");
            storeMap.put("title",i + "号室");
            storeMap.put("eventColor","");
            storeMap.put("eventBackgroundColor","");
            storeMap.put("eventBorderColor","");
            storeMap.put("eventTextColor","");
            storeMap.put("eventClassName","");
            storeMap.put("businessHours","");
            storeInfo.add(storeMap);
        }

        String jsonStoreInfo = new Gson().toJson(storeInfo);

        return jsonStoreInfo;
    }



}