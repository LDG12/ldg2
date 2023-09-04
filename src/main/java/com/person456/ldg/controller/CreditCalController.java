package com.person456.ldg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class CreditCalController {

    @RequestMapping("/calculator")
    public String readCal(HttpServletRequest request){
        if(!loginCheck(request)){
            return "redirect:/login/login?toURL="+request.getRequestURL();
        }
        return "calculator";
    }

    private boolean loginCheck(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return session.getAttribute("id")!=null;
    }

}
