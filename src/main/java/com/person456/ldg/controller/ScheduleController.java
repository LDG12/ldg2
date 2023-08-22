package com.person456.ldg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
    @RequestMapping("/test")
    public String scheduleMain(){
        return "schedule";
    }
}
