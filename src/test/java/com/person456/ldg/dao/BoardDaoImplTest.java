package com.person456.ldg.dao;

import com.person456.ldg.domain.BoardDto;
import com.person456.ldg.service.BoardService;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BoardDaoImplTest {
    @Autowired
    private BoardDaoImpl boardDao;
    @Autowired
    private BoardService boardService;

    @Test
    public void test()throws Exception{
        BoardDto user = boardService.getOneBoard(1);
        System.out.println("user.getBno() = " + user.getBno());
        System.out.println("user.getTitle() = " + user.getTitle());
        System.out.println("user.getContent() = " + user.getContent());
    }
    @Test
    public void test2()throws Exception{
        Map map = new HashMap();
        map.put("offset", 0);
        map.put("pageSize", 10);
        List<BoardDto> list = boardDao.selectAll(map);
        for(BoardDto test : list){
            System.out.println("test.getBno() = " + test.getBno());
            System.out.println("test.getWriter() = " + test.getWriter());
            System.out.println("test.getTitle() = " + test.getTitle());
            System.out.println();
            System.out.println();
        }
    }
    @Test
    public void test3()throws Exception{
        for(Integer i=1; i<=220; i++){
            BoardDto boardDto = new BoardDto(i, "title"+i, "no content", "ehdrlf0815", 0, 0, null, null);
            boardService.insertBoard(boardDto);
        }
    }
}