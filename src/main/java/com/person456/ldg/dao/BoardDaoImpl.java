package com.person456.ldg.dao;

import com.person456.ldg.domain.BoardDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Base64;
import java.util.List;
import java.util.Map;

@Repository
public class BoardDaoImpl implements BoardDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.person456.ldg.dao.BoardMapper.";

    public int count() throws Exception{
        return session.selectOne(namespace+"count");
    }
    public int deleteAll() throws Exception{
        return session.delete(namespace+"deleteAll");
    }
    public int delete(Map map) throws Exception{
        return session.delete(namespace+"delete", map);
    }
    public BoardDto select(Integer bno) throws Exception{
        return session.selectOne(namespace+"select", bno);
    }
    public List<BoardDto> selectAll(Map map) throws Exception{
        return session.selectList(namespace+"selectPage", map);
    }
    public int insertBoard(BoardDto boardDto)throws Exception{
        return session.insert(namespace+"insert", boardDto);
    }
    public int insertAllBoard(BoardDto boardDto)throws Exception{
        return session.insert(namespace+"insertAll", boardDto);
    }
    public int updateBoard(BoardDto boardDto)throws Exception{
        return session.update(namespace+"update", boardDto);
    }
}
