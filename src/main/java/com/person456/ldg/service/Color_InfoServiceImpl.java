package com.person456.ldg.service;

import com.person456.ldg.dao.Color_InfoDao;
import com.person456.ldg.domain.Color_InfoDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Color_InfoServiceImpl implements Color_InfoService {
    @Autowired
    Color_InfoDao color_infoDao;

    @Override
    public int count(){
        return color_infoDao.count();
    }
    @Override
    public Color_InfoDto select(Integer sno){
        return color_infoDao.select(sno);
    }
}
