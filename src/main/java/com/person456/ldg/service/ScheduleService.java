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
    List<String> readMajor(Integer set_num);
    List<ScheduleDto> loadSchedule(Map map);
    List<Integer> readCredit(Integer set_num);
    String addNewSchedule(String sid);
    Integer addNewSchedule_set(String sid);
    int deleteSchedule(List<Integer> list);
    int selectDeleteSno(Map map);
}
