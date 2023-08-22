package com.person456.ldg.service;

import com.person456.ldg.dao.ScheduleDao;
import com.person456.ldg.domain.ScheduleDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class ScheduleServiceImpl implements ScheduleService {
    @Autowired
    ScheduleDao scheduleDao;

    public int count(String sid){
        return scheduleDao.count(sid);
    }
    public ScheduleDto selectOneSchedule(String sid){
        return scheduleDao.selectOneSchedule(sid);
    }
    public int insert(ScheduleDto scheduleDto){
        return scheduleDao.insert(scheduleDto);
    }
    public int deleteAll(Integer sno){
        return scheduleDao.deleteAll(sno);
    }
    public int delete(Map map){
        return scheduleDao.delete(map);
    }
}
