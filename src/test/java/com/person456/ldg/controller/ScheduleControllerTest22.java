package com.person456.ldg.controller;

import com.person456.ldg.domain.Color_InfoDto;
import com.person456.ldg.domain.ScheduleDto;
import com.person456.ldg.service.Color_InfoService;
import com.person456.ldg.service.Color_InfoServiceImpl;
import com.person456.ldg.service.ScheduleService;
import com.person456.ldg.service.Schedule_InfoService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ScheduleControllerTest22 {
    @Autowired
    Color_InfoService color_infoService;
    @Autowired
    ScheduleService scheduleService;
    @Autowired
    Schedule_InfoService schedule_infoService;

    @Test
    public void test(){
        Map<String, String> map = new HashMap<>();
        String schedule_set = "2";
        String sid="ehdrlf0815";
        map.put("sid", sid);
        map.put("schedule_set", schedule_set);
        List<ScheduleDto> list = scheduleService.loadSchedule(map);
        List<Color_InfoDto> list2 = color_infoService.select2(list);
        System.out.println("list = " + list);
        System.out.println("list2 = " + list2);
    }
    @Test
    public void test2(){
        String sid = "ehdrlf0815";
        String schedule_name = "testtest";
        String old_schedule_name = "시간표 3";
        Map<String,String>map = new HashMap<>();
        map.put("sid", sid);
        map.put("schedule_name", schedule_name);
        map.put("old_schedule_name", old_schedule_name);
        int rowCnt = schedule_infoService.update(map);
        assertTrue(rowCnt == 1);
    }
}