package com.person456.ldg.dao;

import com.person456.ldg.domain.ScheduleDto;
import com.person456.ldg.domain.Schedule_InfoDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class Schedule_InfoDaoImpl implements Schedule_InfoDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.person456.ldg.dao.Schedule_InfoMapper.";

    @Override
    public int count(String sid){
        return session.selectOne(namespace+"count", sid);
    }
    @Override
    public List<String> initial(String sid){
        return session.selectList(namespace+"initial", sid);
    }
    @Override
    public String initialSecond(Map map){
        return session.selectOne(namespace+"initialSecond", map);
    }
    @Override
    public Integer first(String schedule_name){
        return session.selectOne(namespace+"first", schedule_name);
    }
    @Override
    public List<Integer> schedule_set(String sid){
        return session.selectList(namespace+"schedule_setArr", sid);
    }
    @Override
    public int second(Map map){
        return session.selectOne(namespace+"second", map);
    }
    @Override
    public int addNewSchedule(Schedule_InfoDto schedule_infoDto){
        return session.insert(namespace+"addNewSchedule", schedule_infoDto);
    }
}
