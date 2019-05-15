package com.yzq.weibo.service;

import com.yzq.weibo.model.Description;
import com.yzq.weibo.model.User;

public interface UserService {

    public User checkUserLogin(User user) throws Exception;

    public Description descriptionById(int user_id) throws Exception;

}
