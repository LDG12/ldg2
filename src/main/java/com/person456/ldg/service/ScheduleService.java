package com.person456.ldg.service;

import com.person456.ldg.domain.ScheduleDto;

import java.util.Map;

public interface ScheduleService {
    public int count(String sid);
    public ScheduleDto selectOneSchedule(String sid);
    public int insert(ScheduleDto scheduleDto);
    public int deleteAll(Integer sno);
    public int delete(Map map);
}
