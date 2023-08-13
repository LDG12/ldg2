package com.person456.ldg.controller;

import com.person456.ldg.dao.UserDao;
import com.person456.ldg.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/register")
public class RegisterController {
    @Autowired
    UserDao userDao;

    @GetMapping("/add")
    public String registerForm(){
        return "registerForm";
    }
//    @PostMapping("/add")
//    public String registerAdd(){
//        return "index";
//    }
    @PostMapping("/check")
    public ResponseEntity<String> registerCheck(String id)throws Exception{
        UserDto user = userDao.selectUser(id);
        if(user==null){
            return ResponseEntity.ok("possible");
        }
        else{
            return ResponseEntity.ok("impossible");
        }
    }
}
