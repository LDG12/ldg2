package com.person456.ldg.dao;

import com.person456.ldg.domain.ScheduleDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ScheduleDaoImplTest {
    @Autowired
    ScheduleDao scheduleDao;

    @Test
    public void test(){
        ScheduleDto user = new ScheduleDto();
        user.setSno(1);
        user.setSid("ehdrlf0815");
        user.setBegin_class(9);
        user.setEnd_class(11);
        user.setClass_name("컴퓨터공학개론");
        user.setClass_date("월");
        int rowCnt = scheduleDao.insert(user);
        assertTrue(rowCnt==1);
    }
    @Test
    public void test2(){
        int rowCnt = scheduleDao.deleteAll(1);
        System.out.println("rowCnt = " + rowCnt);
        assertTrue(rowCnt==1);
    }
}