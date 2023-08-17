package com.person456.ldg.dao;

import com.person456.ldg.domain.BoardDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.person456.ldg.dao.BoardMapper.";

    public int count() throws Exception{
        return session.selectOne(namespace+"count");
    }
    public int deleteAll() throws Exception{
        return session.delete(namespace+"deleteAll");
    }
    public BoardDto select(Integer bno) throws  Exception{
        return session.selectOne(namespace+"select", bno);
    }
    public List<BoardDto> selectAll() throws Exception{
        return session.selectList(namespace+"selectAll");
    }
}
