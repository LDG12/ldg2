package com.person456.ldg.dao;

import com.person456.ldg.domain.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class UserDaoImpl implements UserDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.person456.ldg.dao.UserMapper.";

    public int count()throws Exception{
        return session.selectOne(namespace+"count");
    }
    public UserDto selectUser(String id)throws Exception{
        return session.selectOne(namespace+"selectUser", id);
    }
    public int insertUser(UserDto user){
        return session.insert(namespace+"insertUser", user);
    }
    public UserDto selectFindUser(Map map)throws Exception{
        return session.selectOne(namespace+"selectFindUser", map);
    }
    public int updateUser(Map map)throws Exception{

    }
}
