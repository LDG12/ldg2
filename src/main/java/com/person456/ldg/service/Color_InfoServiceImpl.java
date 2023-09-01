package com.person456.ldg.service;

import com.person456.ldg.dao.Color_InfoDao;
import com.person456.ldg.domain.Color_InfoDto;
import com.person456.ldg.domain.ScheduleDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class Color_InfoServiceImpl implements Color_InfoService {
    @Autowired
    Color_InfoDao color_infoDao;

    @Override
    public  int deleteAll(List<Integer> list){
        return color_infoDao.deleteAll(list);
    }
    @Override
    public int count(){
        return color_infoDao.count();
    }

    @Override
    public List<Color_InfoDto> select2(List<ScheduleDto> scheduleDtoList){
        if(scheduleDtoList.isEmpty()){
            return Collections.emptyList();
        }
        else{
            List<Integer> list = new ArrayList<>();
            for(int i=0; i<scheduleDtoList.size(); i++){
                Integer tmpSno =scheduleDtoList.get(i).getSno();
                list.add(tmpSno);
            }
            return color_infoDao.select2(list);
        }
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
