package com.person456.ldg.dao;

import com.person456.ldg.domain.CommentDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})

public class CommentDaoImplTest {
    @Autowired
    CommentDao commentDao;

    @Test
    public void test()throws Exception{
        int rowCnt =commentDao.deleteAll(1);
        assertTrue(rowCnt==1);
    }

    @Test
    public void test2()throws Exception{
        CommentDto commentDto = new CommentDto(1, 1, 0, "1234", "ehdrlf0815", null, null);
        int rowCnt = commentDao.insertComment(commentDto);
        System.out.println("rowCnt = " + rowCnt);
        assertTrue(rowCnt==1);
    }
}