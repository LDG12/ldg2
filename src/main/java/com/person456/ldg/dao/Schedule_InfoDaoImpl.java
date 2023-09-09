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
    public int secondSemester(Map map){
        System.out.println("Schedule_InfoDao map = " + map);
        System.out.println("Schedule_InfoDao session.selectOne(namespace+\"secondSemester\", map) = " + session.selectOne(namespace + "secondSemester", map));
        return session.selectOne(namespace+"secondSemester", map);
    }
    public List<String> selectScheduleName(Map map){
        return session.selectList(namespace+"selectScheduleName", map);
    }
    @Override
    public List<String> initial(Map map){
        return session.selectList(namespace+"initial", map);
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
    public List<Integer> schedule_set(Map map){
        return session.selectList(namespace+"schedule_setArr", map);
    }
    @Override
    public int second(Map map){
        return session.selectOne(namespace+"second", map);
    }
    @Override
    public int addNewSchedule(Schedule_InfoDto schedule_infoDto){
        return session.insert(namespace+"addNewSchedule", schedule_infoDto);
    }
    @Override
    public int addNewSchedule2(Schedule_InfoDto schedule_infoDto){
        return session.insert(namespace+"addNewSchedule2", schedule_infoDto);
    }
    @Override
    public int update(Map map){
        return session.update(namespace+"update", map);
    }
    @Override
    public int delete(Map map){
        return session.delete(namespace+"delete", map);
    }
}
