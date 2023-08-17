package com.person456.ldg.service;

import com.person456.ldg.dao.BoardDaoImpl;
import com.person456.ldg.domain.BoardDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired
    BoardDaoImpl boardDao;

    public int getCount() throws Exception{
        return boardDao.count();
    }

    public List<BoardDto> getAllBoard(Map map) throws Exception{
        return boardDao.selectAll(map);
    }
    public BoardDto getOneBoard(Integer bno) throws Exception{
        return boardDao.select(bno);
    }
    public int insertBoard(BoardDto boardDto) throws Exception{
        return boardDao.insertAllBoard(boardDto);
    }
}
