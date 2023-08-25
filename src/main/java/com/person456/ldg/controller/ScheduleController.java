package com.person456.ldg.controller;

import com.person456.ldg.domain.Color_InfoDto;
import com.person456.ldg.domain.ScheduleDto;
import com.person456.ldg.domain.ScheduleWithColor;
import com.person456.ldg.domain.SubjectDto;
import com.person456.ldg.service.Color_InfoService;
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
    @Autowired
    Color_InfoService color_infoService;
    @RequestMapping("/test")
    public String scheduleMain(){
        return "schedule";
    }

    @GetMapping("/read")
    @ResponseBody
    public ScheduleWithColor scheduleRead(HttpSession session, Model m){
        String sid = (String)session.getAttribute("id");
        List<Color_InfoDto> color_infoDtoList = color_infoService.select(sid);
        List<ScheduleDto> scheduleDtoList= scheduleService.selectOneSchedule(sid);
        ScheduleWithColor scheduleWithColor = new ScheduleWithColor(scheduleDtoList, color_infoDtoList);
        System.out.println("scheduleWithColor = " + scheduleWithColor);
        return scheduleWithColor;
    }
    @PostMapping("/add")
    public ResponseEntity<String> scheduleAdd(ScheduleDto scheduleDto, @RequestParam String subject_third_hour,
                                              @RequestParam String subject_fourth_hour, Color_InfoDto color_infoDto, HttpSession session, Model m){
        Integer third_hour;
        Integer fourth_hour;
        if(subject_fourth_hour.equals("")&&subject_third_hour.equals("")){
            third_hour = 0;
            fourth_hour = 0;
        }
        else{
            third_hour = Integer.parseInt(subject_third_hour);
            fourth_hour = Integer.parseInt(subject_third_hour);
        }
        scheduleDto.setSubject_third_hour(third_hour);
        scheduleDto.setSubject_fourth_hour(fourth_hour);
        System.out.println("scheduleDto.getSubject_third_hour() = " + scheduleDto.getSubject_third_hour());
        System.out.println("scheduleDto.getSubject_fourth_hour() = " + scheduleDto.getSubject_fourth_hour());
        String sid = (String)session.getAttribute("id");
        scheduleDto.setSid(sid);
        int rowCnt = scheduleService.insert(scheduleDto);
        System.out.println("rowCnt = " + rowCnt);
        if(rowCnt==1){
            Integer sno = scheduleService.selectSno(scheduleDto);
            int colorRow = color_infoService.insert(color_infoDto, sid, sno);
            if(colorRow == 1){
                return ResponseEntity.ok("possible");
            }
            else{
                return ResponseEntity.ok("impossible");
            }
        }
        else if(rowCnt == 0){
            return ResponseEntity.ok("impossible");
        }
        else{
            return ResponseEntity.ok("impossible");
        }
    }
    @PostMapping("/delete")
    public ResponseEntity<String> subjectDelete(String subject_name, Integer sno){
        System.out.println("subject_name = " + subject_name);
        System.out.println("sno = " + sno);
        int colorRow = color_infoService.delete(sno);
        if(colorRow==1){
            int scheduleRow = scheduleService.deleteAll(sno);
            if(scheduleRow == 1){
                return ResponseEntity.ok("possible");
            }
            else{
                return ResponseEntity.ok("impossible");
            }
        }
        else{
            return ResponseEntity.ok("impossible");
        }
    }
}
