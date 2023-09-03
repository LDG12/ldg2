package com.person456.ldg.service;

import com.person456.ldg.dao.Schedule_InfoDao;
import com.person456.ldg.domain.Schedule_InfoDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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
    public List<String> selectScheduleName(Map map){
        List<String> test = schedule_infoDao.selectScheduleName(map);
        if(test.isEmpty()){ // 해당 학기 이름(2023 2학기), 해당 id("ehdrlf0815")로 된 시간표가 존재하지 않는다면.
            Schedule_InfoDto schedule_infoDto = new Schedule_InfoDto();
            schedule_infoDto.setSchedule_set(1);
            schedule_infoDto.setSchedule_name("시간표 1");
            schedule_infoDto.setSid((String)map.get("sid"));
            schedule_infoDto.setSchedule_semester((String)map.get("schedule_semester"));
            int rowCnt = schedule_infoDao.addNewSchedule2(schedule_infoDto);
            test.add(schedule_infoDto.getSchedule_name());
            return test;
        }
        else{
            return schedule_infoDao.selectScheduleName(map);
        }
    }
    public String initialSecond(Map map){
        return schedule_infoDao.initialSecond(map);
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
    public int addNewSchedule2(Schedule_InfoDto schedule_infoDto){
        return schedule_infoDao.addNewSchedule2(schedule_infoDto);
    }
    public int second(Map map){
        return schedule_infoDao.second(map);
    }
    public int update(Map map){
        return schedule_infoDao.update(map);
    }
    public int delete(Map map){
        return schedule_infoDao.delete(map);
    }
}
