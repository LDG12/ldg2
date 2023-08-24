package com.person456.ldg.dao;

import com.person456.ldg.domain.Color_InfoDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class Color_InfoDaoImpl implements Color_InfoDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.person456.ldg.dao.Color_InfoMapper.";

    @Override
    public int count(){
        return session.selectOne(namespace+"count");
    }
    @Override
    public List<Color_InfoDto> select(String sid){
        return session.selectList(namespace+"select", sid);
    }
    @Override
    public int insert(Color_InfoDto color_infoDto){
        return session.insert(namespace+"insert", color_infoDto);
    }
}
