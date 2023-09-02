package com.person456.ldg.controller;

import com.person456.ldg.domain.*;
import com.person456.ldg.service.Color_InfoService;
import com.person456.ldg.service.ScheduleService;
import com.person456.ldg.service.ScheduleServiceImpl;
import com.person456.ldg.service.Schedule_InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.security.auth.Subject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
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

    @GetMapping("/AddNewSchedule")
    public ResponseEntity<String> AddNewSchedule(HttpSession session, Model m){
        String sid = (String)session.getAttribute("id");
        System.out.println("sid = " + sid);
        String newName = scheduleService.addNewSchedule(sid);
        System.out.println("newName = " + newName);
        Integer newScheduleSet = scheduleService.addNewSchedule_set(sid);
        System.out.println("newScheduleSet = " + newScheduleSet);
        Schedule_InfoDto schedule_infoDto = new Schedule_InfoDto(newScheduleSet, newName, sid);
        int rowCnt = schedule_infoService.addNewSchedule(schedule_infoDto);
        if(rowCnt==1){
            return ResponseEntity.ok("possible");
        }
        else{
            return ResponseEntity.ok("impossible");
        }
    }
    @GetMapping("/getSchedule_set")
    @ResponseBody
    public Integer getSchedule_set(HttpSession session, String subject_name){
        String sid = (String)session.getAttribute("id");
        Map<String, String> map = new HashMap<>();
        map.put("schedule_name", subject_name);
        map.put("sid", sid);
        Integer getSchedule_set = schedule_infoService.second(map);
        System.out.println("subject_name = " + subject_name);
        System.out.println("getSchedule_set = " + getSchedule_set);
        return getSchedule_set;
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
    public Map<String, List> schedule_readMC(String schedule_name, HttpSession session){
        String sid = (String)session.getAttribute("id");
        Map<String, String> map2 = new HashMap<>();
        map2.put("sid", sid);
        map2.put("schedule_name", schedule_name);
        Integer schedule_set = schedule_infoService.second(map2);
        map2.remove("schedule_name");
        map2.put("schedule_set", String.valueOf(schedule_set));
        List<String> majorList = scheduleService.readMajor(map2);
        List<Integer> creditList = scheduleService.readCredit(map2);
        Map<String, List> map = new HashMap<>();
        map.put("major", majorList);
        map.put("credit", creditList);
        return map;
    }
    @GetMapping("/load")
    public String schedule_load(String schedule_name, HttpSession session){
        String sid = (String)session.getAttribute("id");
        String name = schedule_name;
        Map<String, String>map = new HashMap<>();
        map.put("sid", sid);
        map.put("schedule_name", name);
        System.out.println("Load map = " + map+"\n");
        String loadName = schedule_infoService.initialSecond(map);
        System.out.println("Load Name = " + loadName+"\n");
        try {
            String encodeLoadName = URLEncoder.encode(loadName, "utf-8");
            System.out.println("encodeLoadName = " + encodeLoadName+"\n");
            return "redirect:/schedule/read?schedule_name="+encodeLoadName;
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return "redirect:/";
        }
    }
    @GetMapping("/read")
    @ResponseBody
    public ScheduleWithColor scheduleRead(HttpSession session, Model m, String schedule_name){
        String sid = (String)session.getAttribute("id");
        String loadname = null;
        try {
            loadname = URLDecoder.decode(schedule_name, "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            loadname = "";
        }
        Map<String, String> map = new HashMap<>();
        if(map.containsKey("schedule_name")){
            map.replace("schedule_name", loadname);
        }
        else{
            map.put("schedule_name", loadname);
        }
        map.put("sid", sid);
        Integer schedule_set = schedule_infoService.second(map);
        map.put("schedule_set", String.valueOf(schedule_set));
        List<ScheduleDto> list = scheduleService.loadSchedule(map);
        List<Color_InfoDto> color_infoDtoList = color_infoService.select2(list);
        List<ScheduleDto> scheduleDtoList= scheduleService.selectOneSchedule(sid);
        ScheduleWithColor scheduleWithColor = new ScheduleWithColor(list, color_infoDtoList);
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
    @PostMapping("/deleteSchedule")
    @Transactional
    public ResponseEntity<String> scheduleDelete(String schedule_name,HttpSession session, Model m){
        String sid = (String)session.getAttribute("id");
        Map<String,String>map = new HashMap<>();
        map.put("sid", sid);
        map.put("schedule_name", schedule_name);
        int result = scheduleService.selectDeleteSno(map);
        if(result == 1 || result==-1){
            return ResponseEntity.ok("possible");
        }
        else{
            return ResponseEntity.ok("impossible");
        }
    }
    @PostMapping("/update")
    public ResponseEntity<String> scheduleUpdate(String schedule_name, String old_schedule_name, HttpSession session){
        String sid = (String)session.getAttribute("id");
        Map<String, String> map = new HashMap<>();
        map.put("sid", sid);
        map.put("schedule_name", schedule_name);
        map.put("old_schedule_name", old_schedule_name);
        System.out.println("schedule_name = " + schedule_name);
        System.out.println("old_schedule_name = " + old_schedule_name);
        int rowCnt = schedule_infoService.update(map);
        if(rowCnt == 1){
            return ResponseEntity.ok("possible");
        }
        else{
            return ResponseEntity.ok("impossible");
        }
    }
    @PostMapping("/delete")
    public ResponseEntity<String> subjectDelete(String subject_name, Integer sno){
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
