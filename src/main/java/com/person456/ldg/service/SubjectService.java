package com.person456.ldg.service;

import com.person456.ldg.dao.SubjectDao;
import com.person456.ldg.domain.SubjectDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubjectService {
    @Autowired
    SubjectDao subjectDao;

    public List<SubjectDto> selectAll(){
        return subjectDao.selectAll();
    }
}
