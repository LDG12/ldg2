package com.person456.ldg.controller;

import com.person456.ldg.service.Schedule_InfoService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ScheduleControllerTest {
    @Autowired
    Schedule_InfoService schedule_infoService;

    @Test
    public void test(){
        String sid = "ehdrlf0815";
        String schedule_name = "시간표 1";
        List<String> schedule_nameList = schedule_infoService.initial(sid);
        System.out.println("schedule_nameList = " + schedule_nameList);
        String[] arr = new String[schedule_nameList.size()];
        Integer[] arr2 = new Integer[schedule_nameList.size()];
        List<String> testArr = new ArrayList<>();
        for(String test : schedule_nameList){
            if(test.startsWith("시간표 ")){
                String[] tmp = test.split(" ");
                if(tmp.length == 2){
                    try{
                        Integer.parseInt(tmp[1]);
                        testArr.add(test);
                    }
                    catch(NumberFormatException e){
                        System.out.println("\"error\" = " + "error");
                    }
                }
            }
        }
        System.out.println("testArr = " + testArr);
        for(int i=0; i<testArr.size(); i++){
            String tmp = testArr.get(i);
            String arr3[] = tmp.split(" ");
            arr[i] = arr3[0];
            arr2[i] = Integer.parseInt(arr3[1]);
            System.out.println("arr[i] = " + arr[i]);
            System.out.println("arr2[i] = " + arr2[i]);
        }
        Arrays.sort(arr2);
        int newNum = 0;
        for(int i=1; i<=arr2.length; i++){
            if(i != arr2[i-1]){
                newNum = i;
                break;
            }
        }
        String newSchedule = "시간표 "+newNum;
        System.out.println("newSchedule = " + newSchedule);
    }
}