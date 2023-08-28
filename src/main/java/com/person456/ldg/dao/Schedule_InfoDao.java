package com.person456.ldg.dao;

import com.person456.ldg.domain.Schedule_InfoDto;

import java.util.List;

public interface Schedule_InfoDao {
    List<String> initial(String sid);
    Integer first(String schedule_name);
}
