package com.baizhi.springboot.service;

import com.baizhi.springboot.entity.User;

public interface UserService {
    //登录
    User login(String user_name, String user_password);
    //注册
    boolean reg(User user);
}
