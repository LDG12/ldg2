package com.person456.ldg.dao;

import com.person456.ldg.domain.CommentDto;

import java.util.List;

public interface CommentDao {
    public int deleteAll(Integer bno)throws Exception;
    public int insertComment(CommentDto commentDto)throws Exception;
    public List<CommentDto> selectComment(Integer bno) throws Exception;
    public CommentDto selectOneComment(CommentDto commentDto)throws Exception;
}
