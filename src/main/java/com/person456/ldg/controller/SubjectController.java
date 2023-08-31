package com.person456.ldg.controller;

import com.person456.ldg.domain.SubjectDto;
import com.person456.ldg.service.SubjectService;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

@Controller
@RequestMapping("/subject")
public class SubjectController {
    @Autowired
    SubjectService subjectService;

    @GetMapping("/read")
    @ResponseBody
    public List<SubjectDto> readAll(String schedule_name){
        List<SubjectDto> list = subjectService.selectAll();
        return list;
    }
//    @GetMapping("/read")
//    public String readAll(String schedule_name, Model m){
//        String realName = schedule_name;
//        System.out.println("realName = " + realName);
//        try {
//            String decodeSchedule_name = URLDecoder.decode(realName, "utf-8");
//            String encodeSchedule_name = URLEncoder.encode(decodeSchedule_name, "utf-8");
//            List<SubjectDto> list  = subjectService.selectAll();
//            m.addAttribute("List", list);
//            if(list != null){
//                return "forward:/schedule/read?schedule_name="+encodeSchedule_name;
//            }
//            else{
//                return "redirect:/";
//            }
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//            return "redirect:/";
//        }
//    }
}
