package com.person456.ldg.dao;

import com.person456.ldg.domain.ScheduleDto;

import java.util.List;
import java.util.Map;

public interface ScheduleDao {
    int count(String sid);

    List<ScheduleDto> selectOneSchedule(String sid);

    int insert(ScheduleDto scheduleDto);
    List<ScheduleDto> loadSchedule(Map map);
    int deleteAll(Integer sno);
    int selectSno(ScheduleDto scheduleDto);
    int delete(Map map);
    List<String> readMajor(Integer set_num);
    List<Integer> readCredit(Integer set_num);
}
