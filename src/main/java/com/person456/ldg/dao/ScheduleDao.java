package com.person456.ldg.dao;

import com.person456.ldg.domain.ScheduleDto;

import java.util.Map;

public interface ScheduleDao {
    int count(String sid);

    ScheduleDto selectOneSchedule(String sid);

    int insert(ScheduleDto scheduleDto);

    int deleteAll(Integer sno);

    int delete(Map map);
}
