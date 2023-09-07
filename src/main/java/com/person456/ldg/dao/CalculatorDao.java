package com.person456.ldg.dao;

import com.person456.ldg.domain.CalculatorDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class CalculatorDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.person456.ldg.dao.CalculatorMapper.";

    public List<CalculatorDto> selectSemester(Map map){
        return session.selectList(namespace+"selectSemester", map);
    }
    public List<CalculatorDto> selectAll(String sid){
        return session.selectList(namespace+"selectAll", sid);
    }
    public Integer selectCell_Place(Map map){
        return session.selectOne(namespace+"selectCell_Place", map);
    }
    public int insertSemester(List<CalculatorDto> list){
        return session.insert(namespace+"insertSemester", list);
    }
    public int insertOne(CalculatorDto calculatorDto){
        return session.insert(namespace+"insertOne", calculatorDto);
    }
    public int insertNewRegister(List<CalculatorDto> list){
        return session.insert(namespace+"insertNewRegister", list);
    }
    public int updateSemester(CalculatorDto calculatorDto){
        return session.update(namespace+"updateSemester", calculatorDto);
    }
}
