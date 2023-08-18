package com.person456.ldg.dao;

import com.person456.ldg.domain.BoardDto;

import java.util.List;
import java.util.Map;

public interface BoardDao {
    public int count() throws Exception;
    public int delete(Map map) throws Exception;
    public int deleteAll() throws Exception;
    public BoardDto select(Integer bno) throws Exception;
    public List<BoardDto> selectAll(Map map) throws Exception;
    public int insertBoard(BoardDto boardDto)throws Exception;
    public int insertAllBoard(BoardDto boardDto)throws Exception;
    public int updateBoard(BoardDto boardDto)throws Exception;
}
