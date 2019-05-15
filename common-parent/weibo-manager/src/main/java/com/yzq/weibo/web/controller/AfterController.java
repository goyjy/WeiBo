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
        List<WeiboList> weiboList = weiboListService.weiboList();
        modelAndView.addObject("weiboList", weiboList);

        if(user!=null){
            Description description = userService.descriptionById(u.getId());
            modelAndView.addObject("description", description);
            modelAndView.setViewName("after/mainPage");
            request.getSession().setAttribute("user",u);
            return modelAndView;
        }

        return modelAndView;
    }

}
