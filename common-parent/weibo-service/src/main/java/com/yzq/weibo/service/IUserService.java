package com.yzq.weibo.service;

import com.yzq.weibo.model.User;
import com.yzq.weibo.service.base.IBaseService;

public interface IUserService extends IBaseService<User>{

    //特有的方法
    public User login(String username, String password);
}
