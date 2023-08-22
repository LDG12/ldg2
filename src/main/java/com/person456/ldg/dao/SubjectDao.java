package com.person456.ldg.dao;

import com.person456.ldg.domain.SubjectDto;

import java.util.List;

public interface SubjectDao {
    List<SubjectDto> selectAll();
}
