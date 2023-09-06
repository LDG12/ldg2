package com.person456.ldg.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.person456.ldg.dao.CalculatorDao;
import com.person456.ldg.domain.CalculatorDto;
import org.apache.ibatis.javassist.expr.NewArray;
import org.checkerframework.checker.units.qual.C;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CalculatorService {
    @Autowired
    CalculatorDao calculatorDao;

    public List<CalculatorDto> selectSemester(Map map){
        return calculatorDao.selectSemester(map);
    }
    public int insertNewRegister(String sid){
        String[] list  = {"1학년 1학기", "1학년 2학기", "2학년 1학기", "2학년 2학기", "3학년 1학기", "3학년 2학기", "4학년 1학기", "4학년 2학기",
        "5학년 1학기", "5학년 2학기", "6학년 1학기", "6학년 2학기"};
        List<CalculatorDto> list2 = new ArrayList<>();
        for(int i=0; i<12; i++){
            CalculatorDto calculatorDto = new CalculatorDto(sid, list[i], "", 0, "A+", "Yes", 0);
            list2.add(calculatorDto);
        }
        return calculatorDao.insertNewRegister(list2);
    }
    public int insertSemester(String jsonName, String jsonCredit, String jsonGrade, String jsonMajor, String semester, String sid,
                              String jsonCell_place){
        List<CalculatorDto> list = new ArrayList<>();
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, String> map = new HashMap<>();
        int insertCnt, updateCnt = 0;
        map.put("sid", sid);
        map.put("semester", semester);
        try {
            String[] nameArr = objectMapper.readValue(jsonName, String[].class);
            Integer[] creditArr = objectMapper.readValue(jsonCredit, Integer[].class);
            String[] gradeArr = objectMapper.readValue(jsonGrade, String[].class);
            String[] majorArr = objectMapper.readValue(jsonMajor, String[].class);
            Integer[] cell_placeArr = objectMapper.readValue(jsonCell_place, Integer[].class);
            for(int i=0; i< nameArr.length; i++){
                int cell_place = cell_placeArr[i];
                map.put("cell_place", String.valueOf(cell_place));
                CalculatorDto tmp = calculatorDao.selectCell_Place(map);
                if(tmp==null){
                    CalculatorDto insert = new CalculatorDto(sid, semester, nameArr[i], creditArr[i], gradeArr[i], majorArr[i], cell_place);
                    insertCnt = calculatorDao.insertOne(insert);
                }else{
                    tmp.setSubject_name(nameArr[i]);
                    tmp.setCredit(creditArr[i]);
                    tmp.setGrade(gradeArr[i]);
                    tmp.setMajor(majorArr[i]);
                    updateCnt = calculatorDao.updateSemester(tmp);
                }
            }
            if(updateCnt > 0){
                return 1;
            }else{return 0;}
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return 0;
        }
    }
}
