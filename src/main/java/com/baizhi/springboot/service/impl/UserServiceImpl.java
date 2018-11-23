package com.baizhi.springboot.service.impl;

import com.baizhi.springboot.dao.UserDao;
import com.baizhi.springboot.entity.User;
import com.baizhi.springboot.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;


    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public User login(String user_name, String user_password) {
        User user=userDao.login(user_name, user_password);
        return user;
    }

    @Override
    public boolean reg(User user) {
        System.out.println(user);
        userDao.reg(user);
        return true;
    }

}
