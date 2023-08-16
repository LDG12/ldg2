package com.person456.ldg.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.person456.ldg.dao.UserDao;
import com.person456.ldg.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="/login", produces = "text/html;charset=UTF-8")
public class LoginController {
    @Autowired
    UserDao userDao;
    @GetMapping("/findID")
    public String findID(){
        return "findID";
    }

    @PostMapping(value="/findID", produces = "text/html;charset=UTF-8")
    public String findID2(String username, String email, HttpServletRequest request, Model m)throws Exception{
        String test = "아에이오우";
        System.out.println("test = " + test);
        System.out.println("name = " + username);
        String resultId = idCheck(username, email);
        m.addAttribute("id", resultId);
        System.out.println("resultId = " + resultId);
        System.out.println("email = " + email);
        return "findResult";
    }

    @GetMapping("/findPwd")
    public String findPwd(){
        return "findPwd";
    }

    @PostMapping("/findPwd")
    public String findPwd2(String id, String email, Model m)throws Exception{
        m.addAttribute("id", id);
        m.addAttribute("email", email);
        return "newPwd";
    }
    @PostMapping("/updatePwd")
    public String updatePwd(String id, String email, String pwd, Model m)throws Exception{

    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/";
    }
    @GetMapping("/login")
    public String loginForm() {
        return "loginForm";
    }

    @PostMapping("/login")
    public String login(String id, String pwd, boolean rememberId, HttpServletResponse response,
                        HttpServletRequest request) throws Exception {
        // 1. id와 pwd를 확인
        if(!loginCheck(id, pwd)) {
            // 2-1   일치하지 않으면, loginForm으로 이동
            String msg = URLEncoder.encode("id 또는 pwd가 일치하지 않습니다.", "utf-8");
            return "redirect:/login/login?msg="+msg;
        }

        // 2-2. id와 pwd가 일치하면,
        if(rememberId) {
            //     1. 쿠키를 생성
            Cookie cookie = new Cookie("id", id); // ctrl+shift+o 자동 import
//		       2. 응답에 저장
            response.addCookie(cookie);
        } else {
// 		       1. 쿠키를 삭제
            Cookie cookie = new Cookie("id", id); // ctrl+shift+o 자동 import
            cookie.setMaxAge(0); // 쿠키를 삭제
//		       2. 응답에 저장
            response.addCookie(cookie);
        }
        HttpSession session = request.getSession();
        session.setAttribute("id", id);
        System.out.println("session.getAttribute(\"id\") = " + session.getAttribute("id"));
//		3. 홈으로 이동
        return "redirect:/";
    }

    private boolean loginCheck(String id, String pwd) throws Exception{
        UserDto user = userDao.selectUser(id);
        if(user==null){
            return false;
        }
        String realpwd = user.getPwd();
        return realpwd.equals(pwd);
    }
    private String pwdCheck(String id)throws Exception{
        UserDto user = userDao.selectUser(id);
        String errormsg = "해당 id는 존재하지 않습니다.";
        if(user==null) return "errormsg";
        return user.getId();
    }
    private String idCheck(String name, String email)throws Exception{
        Map<String, Object> map = new HashMap<>();
        map.put("name", name);
        map.put("email", email);
        UserDto user = userDao.selectFindUser(map);
        String errorStr = "해당 이름과 이메일로 등록된 계정이 없습니다.";
        if(user == null) return errorStr;
        String userId = user.getId();
        return userId;
    }

    private String updateNewPwd(String id, String email, String pwd)throws Exception{
        Map<String, Object> map = new HashMap<>();
        map.put("id", id);
        map.put("email", email);
        map.put("pwd", pwd);
        int rowCnt = userDao.(map);
    }
}