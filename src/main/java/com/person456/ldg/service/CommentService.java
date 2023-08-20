package com.person456.ldg.service;

import com.person456.ldg.domain.CommentDto;

import java.util.List;
import java.util.Map;

public interface CommentService {
    int getCount(Integer bno) throws Exception;

    int deleteAll(Integer bno) throws Exception;

    int delete(Map map) throws Exception;

    List<CommentDto> selectComment(Integer bno) throws Exception;

    CommentDto selectOneComment(CommentDto commentDto) throws Exception;
    int insertComment(CommentDto commentDto)throws Exception;
}
