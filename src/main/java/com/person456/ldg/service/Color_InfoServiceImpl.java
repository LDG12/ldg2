package com.person456.ldg.service;

import com.person456.ldg.dao.Color_InfoDao;
import com.person456.ldg.domain.Color_InfoDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Color_InfoServiceImpl implements Color_InfoService {
    @Autowired
    Color_InfoDao color_infoDao;

    @Override
    public int count(){
        return color_infoDao.count();
    }
    @Override
    public List<Color_InfoDto> select(String sid){
        return color_infoDao.select(sid);
    }
    @Override
    public int insert(Color_InfoDto color_infoDto, String sid, Integer sno){
        color_infoDto.setSid(sid);
        color_infoDto.setSno(sno);
        return color_infoDao.insert(color_infoDto);
    }
    @Override
    public int delete(Integer sno){
        return color_infoDao.delete(sno);
    }
}
