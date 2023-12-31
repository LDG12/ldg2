package com.person456.ldg.dao;

import com.person456.ldg.domain.Schedule_InfoDto;

import java.util.List;
import java.util.Map;

public interface Schedule_InfoDao {
    int count(String sid);
    List<String> initial(Map map);
    String initialSecond(Map map);
    Integer first(String schedule_name);
    List<Integer> schedule_set(Map map);
    int secondSemester(Map map);
    int addNewSchedule(Schedule_InfoDto schedule_infoDto);
    int addNewSchedule2(Schedule_InfoDto schedule_infoDto);
    int second(Map map);
    int delete(Map map);
    List<String> selectScheduleName(Map map);
    int update(Map map);
}
