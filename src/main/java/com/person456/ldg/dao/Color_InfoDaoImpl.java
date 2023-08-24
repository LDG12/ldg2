package com.person456.ldg.dao;

import com.person456.ldg.domain.Color_InfoDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
    public Color_InfoDto select(Integer sno){
        return session.selectOne(namespace+"select", sno);
    }
}
