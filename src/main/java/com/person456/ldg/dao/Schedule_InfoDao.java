package com.person456.ldg.dao;

import com.person456.ldg.domain.Schedule_InfoDto;

import java.util.List;
import java.util.Map;

public interface Schedule_InfoDao {
    int count(String sid);
    List<String> initial(String sid);
    String initialSecond(Map map);
    Integer first(String schedule_name);
    List<Integer> schedule_set(String sid);
    int addNewSchedule(Schedule_InfoDto schedule_infoDto);
    int second(Map map);
}
