package com.person456.ldg.service;

import com.person456.ldg.domain.CommentDto;
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
public class CommentServiceImplTest {
    @Autowired
    CommentService commentService;

    @Test
    public void test()throws Exception{
        int count = commentService.getCount(1);
        assertTrue(count==14);
    }
    @Test
    public void test2()throws Exception{
        int rowCnt = commentService.deleteAll(1);
        System.out.println("rowCnt = " + rowCnt);
        assertTrue(rowCnt==14);
    }
    @Test
    public void test3()throws Exception{
        Map map =new HashMap();
        map.put("cno", 15);
        map.put("commenter", "ehdrlf0815");
        int rowCnt = commentService.delete(map);
        assertTrue(rowCnt==1);
    }


}