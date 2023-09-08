package com.person456.ldg.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.person456.ldg.domain.CalculatorDto;
import com.person456.ldg.service.CalculatorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CalculatorController {
    @Autowired
    CalculatorService calculatorService;

    @GetMapping("/calculator")
    public String readCal(HttpServletRequest request){
        if(!loginCheck(request)){
            return "redirect:/login/login?toURL="+request.getRequestURL();
        }
        return "calculator";
    }
    @GetMapping("/calculator/select")
    @ResponseBody
    public List<CalculatorDto> selectSemester(HttpSession session, String semester){
        String sid = (String)session.getAttribute("id");
        Map<String, String> map = new HashMap<>();
        map.put("sid", sid);
        map.put("semester", semester);
        List<CalculatorDto> list = calculatorService.selectSemester(map);
        return list;
    }
    @PostMapping("/calculator/insert")
    @ResponseBody
    public ResponseEntity<String> insertSemester(HttpSession session, String jsonName, String jsonCredit, String jsonGrade, String jsonMajor, String semester,
                                         String jsonCell_place){
        String sid = (String)session.getAttribute("id");
        int rowCnt=calculatorService.insertSemester(jsonName, jsonCredit, jsonGrade, jsonMajor, semester, sid, jsonCell_place);
        if(rowCnt==1){
            return ResponseEntity.ok("possible");
        }
        else{
            return ResponseEntity.ok("impossible");
        }
    }
    @GetMapping("/calculator/selectAll")
    @ResponseBody
    public String[] selectAll(HttpSession session){
        String sid = (String)session.getAttribute("id");
        String[] allGpa = calculatorService.selectAll(sid);
        System.out.println("allGpa[3] = " + allGpa[3]);
        return allGpa;
    }
    @GetMapping("/calculator/selectGPA")
    @ResponseBody
    public List<String> selectGPA(HttpSession session){
        String sid = (String)session.getAttribute("id");
        List<String> list = calculatorService.selectGPA(sid);
        if(list.isEmpty()){
            list.add("0");
            return list;
        }
        else{
            return list;
        }
    }

    private boolean loginCheck(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return session.getAttribute("id")!=null;
    }

}
