package com.person456.ldg.service;

import com.person456.ldg.domain.ScheduleDto;

import java.util.List;
import java.util.Map;

public interface ScheduleService {
    public int count(String sid);
    public List<ScheduleDto> selectOneSchedule(String sid);
    public int selectSno(ScheduleDto scheduleDto);
    public int insert(ScheduleDto scheduleDto);
    public int deleteAll(Integer sno);
    public int delete(Map map);
    List<String> readMajor(Map map);
    List<ScheduleDto> loadSchedule(Map map);
    List<Integer> readCredit(Map map);
    String addNewSchedule(String sid, String schedule_semester);
    Integer addNewSchedule_set(String sid, String schedule_semester);
    int deleteSchedule(List<Integer> list);
    int selectDeleteSno(Map map);
}
