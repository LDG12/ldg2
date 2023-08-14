package com.person456.ldg.controller;

import com.person456.ldg.dao.UserDao;
import com.person456.ldg.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

@Controller
@RequestMapping("/register")
public class RegisterController {
    @Autowired
    UserDao userDao;

    @GetMapping("/add")
    public String registerForm(){
        return "registerForm";
    }

    @PostMapping("/add")
    public String registerAdd(String id, String pwd, String email, String birth, String name,
                              HttpServletRequest request, Model m)throws Exception{
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date realbirth = dateFormat.parse(birth);
        UserDto user = new UserDto(id, pwd, email, realbirth, name, realbirth);
        if(checkRegister(user)){
            String regMsg = URLEncoder.encode("회원가입이 완료되었습니다.", "utf-8");
            return "redirect:/?regMsg="+regMsg;
        }
        else{
            String regMsg = URLEncoder.encode("다시 확인해주세요.", "utf-8");
            return "redirect:/register/add?regMsg="+regMsg;
        }
    }
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
    private boolean checkRegister(UserDto user)throws Exception{
        int rowCnt = userDao.insertUser(user);
        if(rowCnt == 1) return true;
        else return false;
    }
}
