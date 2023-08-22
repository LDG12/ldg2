package com.person456.ldg.dao;

import com.person456.ldg.domain.SubjectDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SubjectDaoImpl implements SubjectDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.person456.ldg.dao.SubjectMapper.";

    @Override
    public List<SubjectDto> selectAll(){
        return session.selectList(namespace+"selectAll");
    }
}
