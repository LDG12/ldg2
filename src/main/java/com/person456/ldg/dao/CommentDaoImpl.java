package com.person456.ldg.dao;

import com.person456.ldg.domain.CommentDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class CommentDaoImpl implements CommentDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.person456.ldg.dao.CommentMapper.";

    public int deleteAll(Integer bno)throws Exception{
        return session.delete(namespace+"deleteAll", bno);
    }
    public int delete(Map map) throws Exception{
        return session.delete(namespace+"delete", map);
    }
    public int insertComment(CommentDto commentDto)throws Exception{
        return session.insert(namespace+"insertComment", commentDto);
    }
    public List<CommentDto> selectComment(Integer bno) throws Exception{
        return session.selectList(namespace+"selectComment", bno);
    }
    public CommentDto selectOneComment(CommentDto commentDto)throws Exception{
        return session.selectOne(namespace+"selectOneComment", commentDto);
    }
    public int count(Integer bno)throws Exception{
        return session.selectOne(namespace+"count", bno);
    }
}
