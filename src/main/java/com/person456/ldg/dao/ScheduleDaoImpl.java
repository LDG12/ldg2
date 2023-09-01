package com.person456.ldg.dao;

import com.person456.ldg.domain.ScheduleDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ScheduleDaoImpl implements ScheduleDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.person456.ldg.dao.ScheduleMapper.";

    @Override
    public List<String> readMajor(Integer set_num){
        return session.selectList(namespace+"selectMajor", set_num);
    }
    @Override
    public List<Integer> readCredit(Integer set_num){
        return session.selectList(namespace+"selectCredit", set_num);
    }
    @Override
    public int count(String sid){
        return session.selectOne(namespace+"count", sid);
    }
    @Override
    public List<ScheduleDto> loadSchedule(Map map){
        return session.selectList(namespace+"selectLoadSchedule", map);
    }
    @Override
    public List<ScheduleDto> selectOneSchedule(String sid){
        return session.selectList(namespace+"selectOneSchedule", sid);
    }
    @Override
    public int selectSno(ScheduleDto scheduleDto){
        System.out.println("scheduleDto = " + scheduleDto);
        return session.selectOne(namespace+"selectSno", scheduleDto);
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
    @Override
    public int deleteSchedule(List<Integer> list){
        return session.delete(namespace+"deleteSchedule", list);
    }
    @Override
    public List<Integer> selectDeleteSno(Map map){
        return session.selectList(namespace+"selectDeleteSno", map);
    }
}
