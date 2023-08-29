package com.person456.ldg.dao;

import com.person456.ldg.domain.Schedule_InfoDto;

import java.util.List;

public interface Schedule_InfoDao {
    int count(String sid);
    List<String> initial(String sid);
    Integer first(String schedule_name);
    List<Integer> schedule_set(String sid);
    int addNewSchedule(Schedule_InfoDto schedule_infoDto);
}
