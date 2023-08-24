package com.person456.ldg.service;

import com.person456.ldg.domain.Color_InfoDto;

public interface Color_InfoService {
    int count();

    Color_InfoDto select(Integer sno);
}
