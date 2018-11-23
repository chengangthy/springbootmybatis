package com.baizhi.springboot.dao;

import com.baizhi.springboot.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserDao {
    //登录
    User login(@Param("user_name") String user_name, @Param("user_password") String user_password);
    //注册
    void reg(User user);

}
