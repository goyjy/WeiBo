package com.yzq.weibo.web.controller;

import com.yzq.weibo.model.Description;
import com.yzq.weibo.model.User;
import com.yzq.weibo.model.WeiboList;
import com.yzq.weibo.service.UserService;
import com.yzq.weibo.service.WeiboListService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("after")
public class AfterController {
    @Autowired
    private UserService userService;
    @Autowired
    private WeiboListService weiboListService;

    @RequestMapping("login")
    public ModelAndView checkLogin(HttpServletRequest request, User user) throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        User u = userService.checkUserLogin(user);

        if(u!=null){
            System.out.println(u);
            List<WeiboList> weiboList = weiboListService.weiboList();
            modelAndView.addObject("weiboList", weiboList);
            Description description = userService.descriptionById(u.getId());
            modelAndView.setViewName("after/mainPage");
            request.getSession().setAttribute("user",u);
            request.getSession().setAttribute("description",description);
        }else{
            modelAndView.addObject("error","用户名或密码错误");
            modelAndView.addObject("user",user);
            modelAndView.setViewName("before/login");
        }

        return modelAndView;
    }

    @RequestMapping("findweibo")
    public ModelAndView findWeiboByContent(HttpServletRequest request, String content) throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        List<WeiboList> weiboList = weiboListService.findWeiboByContent(content);
        modelAndView.addObject("content", content);
        modelAndView.addObject("weiboList", weiboList);
        modelAndView.setViewName("after/mainPage");
        return modelAndView;
    }

    @RequestMapping("mainPage")
    public ModelAndView registerCheck() throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        List<WeiboList> weiboList = weiboListService.weiboList();
        modelAndView.addObject("weiboList", weiboList);
        modelAndView.setViewName("after/mainPage");
        return modelAndView;
    }

    @RequestMapping("register")
    public ModelAndView checkRegister(HttpServletRequest request, User user,Description description) throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        User u = userService.checkUser(user);
        if(u!=null){
            modelAndView.addObject("error","用户名已存在");
            modelAndView.setViewName("before/register");
        }else{
            int id = userService.insertUser(user);
            System.out.println(id);
            description.setUser_id(id);
            userService.insertDescription(description);
            modelAndView.setViewName("before/register");
            modelAndView.addObject("error","注册成功");
        }
        return modelAndView;
    }

}
