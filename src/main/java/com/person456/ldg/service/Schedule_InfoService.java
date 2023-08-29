package com.person456.ldg.service;

import com.person456.ldg.dao.Schedule_InfoDao;
import com.person456.ldg.domain.Schedule_InfoDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Schedule_InfoService {
    @Autowired
    Schedule_InfoDao schedule_infoDao;

    public int count(String sid){
        return schedule_infoDao.count(sid);
    }
    public List<String> initial(String sid){
        return schedule_infoDao.initial(sid);
    }
    public Integer first(String schedule_name){
        return schedule_infoDao.first(schedule_name);
    }
    public List<Integer> schedule_set(String sid){
        return schedule_infoDao.schedule_set(sid);
    }
    public int addNewSchedule(Schedule_InfoDto schedule_infoDto){
        return schedule_infoDao.addNewSchedule(schedule_infoDto);
    }
}
