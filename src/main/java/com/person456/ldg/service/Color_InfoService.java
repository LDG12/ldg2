package com.person456.ldg.service;

import com.person456.ldg.domain.Color_InfoDto;

import java.util.List;

public interface Color_InfoService {
    int count();

    List<Color_InfoDto> select(String sid);
    int insert(Color_InfoDto color_infoDto, String sid, Integer sno);
}
