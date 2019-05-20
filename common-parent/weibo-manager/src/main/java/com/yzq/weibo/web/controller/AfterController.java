package com.yzq.weibo.web.controller;

import com.yzq.weibo.model.Description;
import com.yzq.weibo.model.User;
import com.yzq.weibo.model.Weibo;
import com.yzq.weibo.model.WeiboList;
import com.yzq.weibo.service.UserService;
import com.yzq.weibo.service.WeiboListService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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
            List<WeiboList> weiboList = weiboListService.weiboList();
            modelAndView.addObject("weiboList", weiboList);
            Description description = userService.descriptionById(u.getId());
            modelAndView.setViewName("after/mainPage");
            request.getSession().setAttribute("description",description);
            request.getSession().setAttribute("user",u);
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
            userService.insertUser(user);
            int id = user.getId();
            description.setUser_id(id);
            userService.insertDescription(description);
            modelAndView.setViewName("before/register");
            modelAndView.addObject("error","注册成功");
        }
        return modelAndView;
    }

    @RequestMapping("findUser")
    public ModelAndView findUser() throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        List<Description> userlist = weiboListService.findUser();
        modelAndView.addObject("userlist", userlist);
        modelAndView.setViewName("after/finduser");
        return modelAndView;
    }

    @RequestMapping("writeWeibo")
    public ModelAndView writeWeibo(HttpServletRequest request, Weibo weibo, MultipartFile picture)throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        Description description = (Description) request.getSession().getAttribute("description");
        weibo.setUser_id(description.getUser_id());
        weibo.setDatetime(new Date());
        //原始名称
        String originalFilename = picture.getOriginalFilename();
        //上传图片
        if(picture!=null && originalFilename!=null && originalFilename.length()>0){

            //存储图片的物理路径
            String pic_path = "E:\\项目\\weibo_pic\\pic\\";


            //新的图片名称
            String newFileName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
            //新图片
            File newFile = new File(pic_path+newFileName);

            //将内存中的数据写入磁盘
            picture.transferTo(newFile);

            //将新图片名称写到itemsCustom中
            weibo.setImage(newFileName);
        }
        userService.writeWeibo(weibo);
        List<WeiboList> weiboList = weiboListService.weiboList();
        modelAndView.addObject("weiboList", weiboList);
        modelAndView.setViewName("after/mainPage");
        return modelAndView;
    }

    @RequestMapping("personalPage")
    public ModelAndView personalPage(int user_id) throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        List<WeiboList> list = weiboListService.findWeiboByUser_id(user_id);
        Description d = userService.descriptionById(user_id);
        modelAndView.addObject("d",d);
        modelAndView.addObject("weiboList", list);
        modelAndView.setViewName("after/personalPage");
        return modelAndView;
    }

    @RequestMapping("personalInfo")
    public ModelAndView personalInfo(HttpServletRequest request,int user_id) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        Description description = (Description) request.getSession().getAttribute("description");
        if(user_id==description.getUser_id()){
            modelAndView.addObject("d",description);
            modelAndView.setViewName("after/personalInfo");
        }else{
            Description d = userService.descriptionById(user_id);
            modelAndView.addObject("d",d);
            modelAndView.setViewName("after/personalInfo_other");
        }

        return modelAndView;
    }

    @RequestMapping("save")
    public ModelAndView save(HttpServletRequest request,Description description, MultipartFile picture,String birth) throws Exception{
        System.out.println(birth);
        ModelAndView modelAndView = new ModelAndView();
        User user = (User) request.getSession().getAttribute("user");
        description.setUser_id(user.getId());
        //原始名称
        String originalFilename = picture.getOriginalFilename();
        //上传图片
        if(picture!=null && originalFilename!=null && originalFilename.length()>0){

            //存储图片的物理路径
            String pic_path = "E:\\项目\\weibo_pic\\pic\\";

            //新的图片名称
            String newFileName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
            //新图片
            File newFile = new File(pic_path+newFileName);

            //将内存中的数据写入磁盘
            picture.transferTo(newFile);

            //将新图片名称写到itemsCustom中
            description.setHeadimage(newFileName);
        }
        modelAndView.addObject("d",description);
        modelAndView.setViewName("after/personalInfo");
        return modelAndView;
    }
}
