package com.yzq.weibo.web.controller;

import com.yzq.weibo.model.User;
import com.yzq.weibo.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("before")
public class BeforeController {

    @Autowired
    private IUserService userService;

    @RequestMapping("find")
    public String find(int id){
        User user = userService.findById(id);
        System.out.println(user);
        return null;
    }

}
