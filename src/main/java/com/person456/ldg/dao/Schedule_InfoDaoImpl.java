package com.person456.ldg.dao;

import com.person456.ldg.domain.Schedule_InfoDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class Schedule_InfoDaoImpl implements Schedule_InfoDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.person456.ldg.dao.Schedule_InfoMapper.";

    @Override
    public List<String> initial(String sid){
        return session.selectList(namespace+"initial", sid);
    }
    @Override
    public Integer first(String schedule_name){
        return session.selectOne(namespace+"first", schedule_name);
    }
}
