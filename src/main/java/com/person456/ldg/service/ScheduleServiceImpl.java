package com.person456.ldg.service;

import com.person456.ldg.dao.ScheduleDao;
import com.person456.ldg.domain.ScheduleDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ScheduleServiceImpl implements ScheduleService {
    @Autowired
    ScheduleDao scheduleDao;

    @Override
    public List<String> readMajor(Integer set_num){
        return scheduleDao.readMajor(set_num);
    }
    @Override
    public List<Integer> readCredit(Integer set_num){
        return scheduleDao.readCredit(set_num);
    }
    @Override
    public int count(String sid){
        return scheduleDao.count(sid);
    }
    @Override
    public List<ScheduleDto> selectOneSchedule(String sid){
        return scheduleDao.selectOneSchedule(sid);
    }
    @Override
    public int selectSno(ScheduleDto scheduleDto){
        return scheduleDao.selectSno(scheduleDto);
    }
    @Override
    public int insert(ScheduleDto scheduleDto){
        String first_day = scheduleDto.getSubject_first_day();
        Integer first_hour = scheduleDto.getSubject_first_hour();
        String second_day = scheduleDto.getSubject_second_day();
        Integer second_hour = scheduleDto.getSubject_second_hour();
        List<ScheduleDto> valis = scheduleDao.selectOneSchedule(scheduleDto.getSid());
        for(ScheduleDto vali : valis){
            if(checkOverlap(vali, first_day, first_hour)||checkOverlap(vali, second_day, second_hour)){
                return 0;
            }
        }
        return scheduleDao.insert(scheduleDto);
    }
    @Override
    public int deleteAll(Integer sno){
        return scheduleDao.deleteAll(sno);
    }
    @Override
    public int delete(Map map){
        return scheduleDao.delete(map);
    }

    private boolean checkOverlap(ScheduleDto vali, String day, Integer hour) {
        if (day.equals(vali.getSubject_first_day())) {
            if (hour.equals(vali.getSubject_first_hour())) {
                return true;
            }
        }

        if (day.equals(vali.getSubject_second_day())) {
            if (hour.equals(vali.getSubject_second_hour())) {
                return true;
            }
        }

        return false;
    }

}
