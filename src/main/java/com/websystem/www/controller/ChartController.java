package com.websystem.www.controller;

import com.google.gson.GsonBuilder;
import com.websystem.www.entity.Course;
import com.websystem.www.entity.Store;
import com.websystem.www.entity.User;
import com.websystem.www.entity.Work;
import com.websystem.www.service.*;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;


@Controller
@RequestMapping("/chart")
public class ChartController {

    private static final Logger logger = LoggerFactory.getLogger(ChartController.class);

    @Autowired
    StoreService storeService;

    @Autowired
    WorkService workService;

    @Autowired
    UserService userService;

    @Autowired
    CourseService courseService;

    @Autowired
    ChartService chartService;

    @RequestMapping("/main")
    public ModelAndView store1(ModelAndView mav) {
        mav.setViewName("chart-main");
    	return mav;
    }

    @RequestMapping("/data-chart")
    public ModelAndView dataChart(ModelAndView mav) {
        mav.setViewName("datachart");
        return mav;
    }

    @ResponseBody
    @RequestMapping(value="/ajaxGetMonthlySalesAndCost",produces="text/plain; charset=UTF-8")
    public String ajaxGetMonthlySalesAndCost(String from,String to,String storeid) throws RuntimeException{
        HashMap<String,String> param = new HashMap<String, String>();
        param.put("from",from);
        param.put("to",to);
        param.put("storeid",storeid);

        String json = new GsonBuilder().create().toJson(chartService.ajaxGetMonthlySalesAndCost(param));
        return json;
    }
}