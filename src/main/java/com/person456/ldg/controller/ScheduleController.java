package com.person456.ldg.controller;

import com.person456.ldg.domain.ScheduleDto;
import com.person456.ldg.domain.SubjectDto;
import com.person456.ldg.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String scheduleRead(HttpSession session, Model m){
        String sid = (String)session.getAttribute("id");
        return "forward:/schedule/test";
    }
    @PostMapping("/add")
    public ResponseEntity<String> scheduleAdd(ScheduleDto scheduleDto, HttpSession session, Model m){
        String sid = (String)session.getAttribute("id");
        scheduleDto.setSid(sid);
        System.out.println("scheduleDto.getSid() = " + scheduleDto.getSid());
        System.out.println("scheduleDto.getSubject_name() = " + scheduleDto.getSubject_name());
        System.out.println("scheduleDto.getMajor() = " + scheduleDto.getMajor());
        System.out.println("scheduleDto.getSubject_first_day() = " + scheduleDto.getSubject_first_day());
        System.out.println("scheduleDto.getSubject_first_hour() = " + scheduleDto.getSubject_first_hour());
        System.out.println("scheduleDto.getSubject_second_day() = " + scheduleDto.getSubject_second_day());
        System.out.println("scheduleDto.getSubject_second_hour() = " + scheduleDto.getSubject_second_hour());
        System.out.println("scheduleDto.getPlace() = " + scheduleDto.getPlace());
        System.out.println("scheduleDto.getCredit() = " + scheduleDto.getCredit());
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
