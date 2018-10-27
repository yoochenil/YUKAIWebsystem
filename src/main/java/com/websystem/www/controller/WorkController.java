package com.websystem.www.controller;

import java.util.*;

import com.websystem.www.entity.Course;
import com.websystem.www.entity.Store;
import com.websystem.www.entity.User;
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

import com.google.gson.GsonBuilder;
import com.websystem.www.entity.Work;


@Controller
@RequestMapping("/work")
public class WorkController {

    private static final Logger logger = LoggerFactory.getLogger(WorkController.class);

    @Autowired
    StoreService storeService;

    @Autowired
    WorkService workService;

    @Autowired
    UserService userService;

    @Autowired
    CourseService courseService;

    @RequestMapping("/store-1")
    public ModelAndView store1(ModelAndView mav) {
        List<Store> storeList = storeService.getStoreList();
        mav.addObject("STORELIST", storeList);

        Set<User> userList = userService.getUserList("1");
        mav.addObject("USERLIST",userList);

        List<Course> courseList = courseService.getCourseList();
        mav.addObject("COURSELIST",courseList);

        mav.addObject("STOREID","1");
        mav.setViewName("calendar");
    	return mav;
    }

    @RequestMapping("/store-2")
    public ModelAndView store2(ModelAndView mav) {
        List<Store> storeList = storeService.getStoreList();
        mav.addObject("STORELIST", storeList);

        Set<User> userList = userService.getUserList("2");
        mav.addObject("USERLIST",userList);

        List<Course> courseList = courseService.getCourseList();
        mav.addObject("COURSELIST",courseList);

        mav.addObject("STOREID","2");
        mav.setViewName("calendar");
        return mav;
    }

    @RequestMapping(value="/getWork",produces="text/plain; charset=UTF-8")
    @ResponseBody
    public String getWork(String date,String storeid) {
        HashMap<String,String> paramMap = new HashMap<String, String>();
        paramMap.put("date",date);
        paramMap.put("storeid",storeid);
    	List<Work> works = workService.ajaxGetWork(paramMap);

    	String json = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().toJson(works);

    	logger.debug(json);
        return json;
    }

    @RequestMapping(value="/insWork",method = RequestMethod.POST)
    public ModelAndView insWork(Work work,ModelAndView mav) {
    	String storeId = work.getStoreid();
    	String roomId = work.getRoomid();
        String resourceId = "store" + storeId + "room" + roomId;
        work.setResourceid(resourceId);
        workService.insWork(work);
        String id = work.getId();

        mav.setViewName("redirect:/work/store-" + storeId);
    	return mav;
    }

    @RequestMapping(value="/updWork",method = RequestMethod.POST)
    public ModelAndView updWork(Work work,ModelAndView mav){
        String storeId = work.getStoreid();
        String roomId = work.getRoomid();
        String resourceId = "store" + storeId + "room" + roomId;
        work.setResourceid(resourceId);

        workService.updWork(work);

        mav.setViewName("redirect:/work/store-" + storeId);
        return mav;
    }

    @RequestMapping(value="/delWork",method = RequestMethod.POST)
    public ModelAndView delWork(Work work,ModelAndView mav){
        String storeId = work.getStoreid();
        String id = work.getId();
        int result = workService.delWork(id);

        mav.setViewName("redirect:/work/store-" + storeId);
        return mav;
    }

    @RequestMapping(value="/getRoomnum",produces="text/plain; charset=UTF-8")
    @ResponseBody
    public String getRoomnum(String storeId){
        String roomNum = storeService.getRoomNum(storeId);
        String json = new GsonBuilder().create().toJson(roomNum);
        return json;
    }

    @RequestMapping(value="/board")
    public ModelAndView board(ModelAndView mav,Work work){
        mav.setViewName("board");
        return mav;
    }
}