package com.person456.ldg.dao;

import com.person456.ldg.domain.Color_InfoDto;

import java.util.List;

public interface Color_InfoDao {
    int count();
    List<Color_InfoDto> select(String sid);
    List<Color_InfoDto> select2(List<Integer> list);
    int delete(Integer sno);
    int insert(Color_InfoDto color_infoDto);
}
