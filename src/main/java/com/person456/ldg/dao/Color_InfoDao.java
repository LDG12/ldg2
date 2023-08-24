package com.person456.ldg.dao;

import com.person456.ldg.domain.Color_InfoDto;

public interface Color_InfoDao {
    int count();

    Color_InfoDto select(Integer sno);
}
