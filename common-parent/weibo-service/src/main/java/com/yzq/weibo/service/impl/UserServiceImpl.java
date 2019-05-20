package com.yzq.weibo.service.impl;

import com.yzq.weibo.mapper.UserMapper;
import com.yzq.weibo.model.Description;
import com.yzq.weibo.model.User;
import com.yzq.weibo.model.Weibo;
import com.yzq.weibo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User checkUserLogin(User user) throws Exception {
        User u = userMapper.checkUserLogin(user);
        return u;
    }

    @Override
    public Description descriptionById(int user_id) throws Exception {
        Description description = userMapper.descriptionById(user_id);
        return description;
    }

    @Override
    public void insertUser(User user) throws Exception {
        userMapper.insertUser(user);
    }

    @Override
    public void insertDescription(Description description) throws Exception {
        userMapper.insertDescription(description);
    }

    @Override
    public User checkUser(User user) throws Exception {
        User u = userMapper.checkUser(user);
        return u;
    }

    @Override
    public void writeWeibo(Weibo weibo) throws Exception {
        userMapper.writeWeibo(weibo);
    }

    @Override
    public void updateDescription(Description description) throws Exception {
        userMapper.updateDescription(description);
    }
}
