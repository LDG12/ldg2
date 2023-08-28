package com.person456.ldg.controller;

import com.person456.ldg.domain.*;
import com.person456.ldg.service.Color_InfoService;
import com.person456.ldg.service.ScheduleService;
import com.person456.ldg.service.Schedule_InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.security.auth.Subject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
    @Autowired
    ScheduleService scheduleService;
    @Autowired
    Color_InfoService color_infoService;
    @Autowired
    Schedule_InfoService schedule_infoService;
    @RequestMapping("/test")
    public String scheduleMain(HttpServletRequest request){
        if(!loginCheck(request)){
            return "redirect:/login/login?toURL="+request.getRequestURL();
        }
        return "schedule";
    }

    @GetMapping("/readSchedule_name")
    @ResponseBody
    public List<String>  schedule_nameRead(HttpSession session){
        String sid = (String)session.getAttribute("id");
        List<String> schedule_infoDtoList = schedule_infoService.initial(sid);
        return schedule_infoDtoList;
    }
    @PostMapping("/readMC")
    @ResponseBody
    public Map<String, List> schedule_readMC(String schedule_name){
        Integer schedule_set = schedule_infoService.first(schedule_name);
        List<String> majorList = scheduleService.readMajor(schedule_set);
        List<Integer> creditList = scheduleService.readCredit(schedule_set);
        Map<String, List> map = new HashMap<>();
        map.put("major", majorList);
        map.put("credit", creditList);
        return map;
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
            fourth_hour = Integer.parseInt(subject_fourth_hour);
        }
        scheduleDto.setSubject_third_hour(third_hour);
        scheduleDto.setSubject_fourth_hour(fourth_hour);
        String sid = (String)session.getAttribute("id");
        scheduleDto.setSid(sid);
        int rowCnt = scheduleService.insert(scheduleDto);
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
    private boolean loginCheck(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return session.getAttribute("id")!=null;
    }
}
