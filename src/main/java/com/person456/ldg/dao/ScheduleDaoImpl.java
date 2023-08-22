package com.person456.ldg.dao;

import com.person456.ldg.domain.ScheduleDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class ScheduleDaoImpl implements ScheduleDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.person456.ldg.dao.ScheduleMapper.";

    @Override
    public int count(String sid){
        return session.selectOne(namespace+"count", sid);
    }
    @Override
    public ScheduleDto selectOneSchedule(String sid){
        return session.selectOne(namespace+"selectOneSchedule", sid);
    }
    @Override
    public int insert(ScheduleDto scheduleDto){
        return session.insert(namespace+"insert", scheduleDto);
    }
    @Override
    public int deleteAll(Integer sno){
        return session.delete(namespace+"deleteAll", sno);
    }
    @Override
    public int delete(Map map){
        return session.delete(namespace+"delete", map);
    }
}
