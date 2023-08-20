package com.person456.ldg.service;

import com.person456.ldg.dao.CommentDao;
import com.person456.ldg.domain.CommentDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    CommentDao commentDao;

    @Override
    public int getCount(Integer bno)throws Exception{
        return commentDao.count(bno);
    }
    @Override
    public int deleteAll(Integer bno)throws Exception{
        return commentDao.deleteAll(bno);
    }
    @Override
    public int delete(Map map)throws Exception{
        return commentDao.delete(map);
    }
    @Override
    public List<CommentDto> selectComment(Integer bno)throws Exception{
        return commentDao.selectComment(bno);
    }
    @Override
    public CommentDto selectOneComment(CommentDto commentDto)throws Exception{
        return commentDao.selectOneComment(commentDto);
    }
    @Override
    public int insertComment(CommentDto commentDto)throws Exception{
        if(commentDto.getReg_date()==null && commentDto.getUp_date()==null){
            commentDto.setReg_date(new Date());
            commentDto.setUp_date(new Date());
        }
        commentDto.setPcno(0);
        return commentDao.insertComment(commentDto);
    }
}
