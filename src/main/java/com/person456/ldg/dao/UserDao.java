package com.person456.ldg.dao;

import com.person456.ldg.domain.UserDto;

public interface UserDao {
    public int count()throws Exception;
    public UserDto selectUser(String id)throws Exception;
}
