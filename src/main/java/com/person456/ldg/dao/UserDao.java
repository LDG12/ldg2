package com.person456.ldg.dao;

import com.person456.ldg.domain.BoardDto;
import com.person456.ldg.domain.SearchPage;
import com.person456.ldg.domain.UserDto;

import java.util.List;
import java.util.Map;

public interface UserDao {
    public int count()throws Exception;
    public UserDto selectUser(String id)throws Exception;
    public int insertUser(UserDto user)throws Exception;
    public UserDto selectFindUser(Map map)throws Exception;
    public int updatePwd(UserDto user)throws Exception;
}
