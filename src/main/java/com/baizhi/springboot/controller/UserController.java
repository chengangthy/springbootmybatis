package com.baizhi.springboot.controller;


import com.baizhi.springboot.entity.User;
import com.baizhi.springboot.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    Logger logger= LoggerFactory.getLogger(AuctionController.class);


    @RequestMapping("/login")
    public String login(String user_name,String user_password,String kaptcha,HttpSession session){
        //取session验证码
        String kaptcha1=(String) session.getAttribute("kaptcha");
        //登录查询
        User user=userService.login(user_name, user_password);
        //比较
        boolean b=kaptcha.equalsIgnoreCase(kaptcha1);
        if(user!=null&&b){
            session.setAttribute("user", user);
            return "redirect:/selectAll.action";
        }
        return "login";
    }
    @RequestMapping("/reg")
    public String reg(User user,String kaptcha,HttpSession session){
        //取session验证码
        String kaptcha1=(String) session.getAttribute("kaptcha");
        boolean b=kaptcha.equalsIgnoreCase(kaptcha);
        boolean a=userService.reg(user);
        if(a&&b){
            return "index";
        }
        return "reg";
    }

}