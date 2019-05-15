package com.yzq.weibo.web.controller;

import com.yzq.weibo.model.CommentList;
import com.yzq.weibo.model.Description;
import com.yzq.weibo.model.WeiboList;
import com.yzq.weibo.service.WeiboListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("before")
public class BeforeController {

    @Autowired
    private WeiboListService weiboListService;

    @RequestMapping("homePage")
    public ModelAndView registerCheck() throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        List<WeiboList> weiboList = weiboListService.weiboList();
        modelAndView.addObject("weiboList", weiboList);
        modelAndView.setViewName("before/homePage");
        return modelAndView;
    }

    @RequestMapping("comment")
    public ModelAndView commentShow(HttpServletRequest request,Integer id) throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        List<CommentList> commentList = weiboListService.commentList(id);
        WeiboList weibo = weiboListService.weibo(id);
        modelAndView.addObject("weibo", weibo);
        modelAndView.addObject("commentList", commentList);
        modelAndView.setViewName("before/comment");
        return modelAndView;
    }

    @RequestMapping("findweibo")
    public ModelAndView findWeiboByContent(HttpServletRequest request, String content) throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        List<WeiboList> weiboList = weiboListService.findWeiboByContent(content);
        modelAndView.addObject("content", content);
        modelAndView.addObject("weiboList", weiboList);
        modelAndView.setViewName("before/homePage");
        return modelAndView;
    }

    @RequestMapping("finduser")
    public ModelAndView findUser() throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        List<Description> userlist = weiboListService.findUser();
        modelAndView.addObject("userlist", userlist);
        modelAndView.setViewName("before/finduser");
        return modelAndView;
    }

    @RequestMapping("finduserbynickname")
    public ModelAndView finduserbynickname(HttpServletRequest request,String nickname) throws Exception{
        System.out.println(nickname);
        ModelAndView modelAndView = new ModelAndView();
        List<Description> userlist = weiboListService.findUserBynickname(nickname);
        modelAndView.addObject("userlist", userlist);
        modelAndView.setViewName("before/finduser");
        return modelAndView;
    }

}
