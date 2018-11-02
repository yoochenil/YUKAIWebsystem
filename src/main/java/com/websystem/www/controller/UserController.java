package com.websystem.www.controller;

import java.util.List;
import java.util.Locale;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.websystem.www.entity.Hanyo;
import com.websystem.www.entity.Store;
import com.websystem.www.entity.User;
import com.websystem.www.service.HanyoService;
import com.websystem.www.service.StoreService;
import com.websystem.www.service.UserService;


@Controller
public class UserController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    UserService userService;

    @Autowired
    StoreService storeService;

    @Autowired
    HanyoService hanyoService;


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView home(Locale locale, ModelAndView modelAndView){
		Set<String> todohuken = userService.getTodohukenList();
		modelAndView.addObject("TODOHUKEN",todohuken);

		List<Store> storeList = storeService.getStoreList();
		modelAndView.addObject("STORE", storeList);

		List<Hanyo> work_timeList = hanyoService.getHanyoByKb("WORK_TIME");
		modelAndView.addObject("WORK_TIME",work_timeList);

		List<Hanyo> genderList = hanyoService.getHanyoByKb("GENDER");
		modelAndView.addObject("GENDER",genderList);

    	modelAndView.setViewName("index");
        return modelAndView;
    }

	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String login(User user, HttpServletRequest request){
		Subject subject=SecurityUtils.getSubject();
		UsernamePasswordToken token=new UsernamePasswordToken(user.getUserName(), user.getPassword());
		try{
			subject.login(token);
			Session session=subject.getSession();
			System.out.println("sessionId:"+session.getId());
			System.out.println("sessionHost:"+session.getHost());
			System.out.println("sessionTimeout:"+session.getTimeout());
			session.setAttribute("info", "ログイン成功");
			return "redirect:/work/board";
		}catch(Exception e) {
            e.printStackTrace();
            request.setAttribute("user", user);
            request.setAttribute("errorMsg", "ログイン失敗");
            return "index";
        }
	}

	@RequestMapping(value = "/logout")
	public String logout(User user, HttpServletRequest request){
    	Subject subject = SecurityUtils.getSubject();
    	subject.logout();
    	return "redirect:/";
	}

	@RequestMapping(value = "/register",method = RequestMethod.POST)
	public ModelAndView register(User user,ModelAndView modelAndView) {
        try {
            userService.insUser(user);
        }catch(Exception e) {
            e.printStackTrace();
        }

		modelAndView.setViewName("redirect:/");
		return modelAndView;
	}

    @RequestMapping("/terms")
    public String terms(User user, HttpServletRequest request){
        return "terms";
    }



}