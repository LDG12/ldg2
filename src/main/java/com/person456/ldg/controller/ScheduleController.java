package com.person456.ldg.controller;

import com.person456.ldg.domain.ScheduleDto;
import com.person456.ldg.domain.SubjectDto;
import com.person456.ldg.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.security.auth.Subject;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
    @Autowired
    ScheduleService scheduleService;

    @RequestMapping("/test")
    public String scheduleMain(){
        return "schedule";
    }

    @GetMapping("/read")
    @ResponseBody
    public List<ScheduleDto> scheduleRead(HttpSession session, Model m){
        String sid = (String)session.getAttribute("id");
        List<ScheduleDto> list = scheduleService.selectOneSchedule(sid);
        System.out.println("list = " + list);
        return list;
    }
    @PostMapping("/add")
    public ResponseEntity<String> scheduleAdd(ScheduleDto scheduleDto, HttpSession session, Model m){
        String sid = (String)session.getAttribute("id");
        scheduleDto.setSid(sid);
        int rowCnt = scheduleService.insert(scheduleDto);
        System.out.println("rowCnt = " + rowCnt);
        if(rowCnt==1){
            return ResponseEntity.ok("possible");
        }
        else if(rowCnt == 0){
            return ResponseEntity.ok("impossible");
        }
        else{
            return ResponseEntity.ok("impossible");
        }
    }
}
