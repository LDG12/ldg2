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

import java.util.List;

@Controller
@RequestMapping("/subject")
public class SubjectController {
    @Autowired
    SubjectService subjectService;

    @GetMapping("/read")
    public String readAll(Model m){
        List<SubjectDto> list  = subjectService.selectAll();
        m.addAttribute("List", list);
        if(list != null){
            return "forward:/schedule/test";
        }
        else{
            return "redirect:/";
        }
    }
}
