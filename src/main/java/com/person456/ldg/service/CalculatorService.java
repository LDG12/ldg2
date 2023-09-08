package com.person456.ldg.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.person456.ldg.dao.CalculatorDao;
import com.person456.ldg.domain.CalculatorDto;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.javassist.expr.NewArray;
import org.checkerframework.checker.units.qual.C;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
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
    public List<String> selectGPA(String sid){
        String[] semester ={"1학년 1학기", "1학년 2학기", "2학년 1학기", "2학년 2학기", "3학년 1학기",
                "3학년 2학기", "4학년 1학기", "4학년 2학기", "5학년 1학기", "5학년 2학기", "6학년 1학기", "6학년 2학기"};
        List<String> list2 = new ArrayList<>();
        for(int i=0; i<semester.length; i++){
            double sum=0;
            Integer acquisition=0;
            String tmp = semester[i];
            String result="";
            String[] arr = new String[12];
            Map<String,String>map = new HashMap<>();
            map.put("sid", sid);
            map.put("semester", tmp);
            List<CalculatorDto>list= calculatorDao.selectGPA(map);
            for(int j=0; j<list.size(); j++){
                Integer credit = list.get(j).getCredit();
                if(credit!=0){
                    acquisition+=credit;
                    sum+=cal(credit, list.get(j).getGrade());
                }
            }
            DecimalFormat decimalFormat = new DecimalFormat("#.##");
            double convi = sum/acquisition;
            if(Double.isNaN(convi)){
                convi =0;
            }
            if(convi!=0){
                String tmq = decimalFormat.format(convi);
                list2.add(tmq);
            }
        }
        return list2;
    }
    public String[] selectAll(String sid){
        List<CalculatorDto> list = calculatorDao.selectAll(sid);
        Integer acquisition =0;
        double sum=0;
        Integer majorAcquisition=0;
        double majorSum=0;
        String gradeAll="";
        for(int i=0; i<list.size(); i++){
            Integer num = list.get(i).getCredit();
            String grade = list.get(i).getGrade();
            if(num!=0){
                acquisition+=num;
                sum+=cal(num, grade);
                gradeAll+=","+grade;
            }
            if(list.get(i).getMajor().equals("yes")){
                majorAcquisition+=num;
                majorSum+=cal(num,grade);
            }
        }
        DecimalFormat decimalFormat = new DecimalFormat("#.##");
        String gpa = decimalFormat.format((double)(sum/acquisition));
        String majorgpa = decimalFormat.format((double)(majorSum/majorAcquisition));
        String[] arr = {gpa, majorgpa, String.valueOf(acquisition),gradeAll};
        return arr;
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
        ObjectMapper objectMapper = new ObjectMapper();
        List<Integer>list = new ArrayList<>();
        try {
            String[] nameArr = objectMapper.readValue(jsonName, String[].class);
            Integer[] creditArr = objectMapper.readValue(jsonCredit, Integer[].class);
            String[] gradeArr = objectMapper.readValue(jsonGrade, String[].class);
            String[] majorArr = objectMapper.readValue(jsonMajor, String[].class);
            Integer[] cell_placeArr = objectMapper.readValue(jsonCell_place, Integer[].class);
            for(int i=0; i<10; i++){
                Map<String, Object> map = new HashMap<>();
                map.put("sid" ,sid);
                map.put("semester", semester);
                map.put("cell_place", i);
                list.add(calculatorDao.selectCell_Place(map));
                System.out.println(nameArr[i]+" "+creditArr[i]+" "+gradeArr[i]+" "+majorArr[i]+" "+cell_placeArr[i]);
            }
            System.out.println("list = " + list);
            int UpdaterowCnt=0;
            int InsertrowCnt=0;
            // 1학년 1학기는 8까지 있고, 9가 비어있음. insert==1, update==8이 되면 됨
            for(int i=0; i<list.size(); i++){
                Integer num = list.get(i);
                if(num!=null){
                    CalculatorDto calculatorDto = new CalculatorDto(num, sid, semester, nameArr[i], creditArr[i],gradeArr[i], majorArr[i]);
                    // 이러면 cno를 사용하므로 cell_place가 별로 피료없다...
                    UpdaterowCnt+=calculatorDao.updateSemester(calculatorDto);
                }
                else{ //만약 해당 cell_place가 비어있다면....
                    CalculatorDto calculatorDto = new CalculatorDto(sid, semester, nameArr[i], creditArr[i], gradeArr[i], majorArr[i], i);
                    // cno는 자동증가, i가 cell_place의 값...
                    InsertrowCnt+=calculatorDao.insertOne(calculatorDto);
                }
            }
            System.out.println("UpdaterowCnt = " + UpdaterowCnt);
            System.out.println("InsertrowCnt = " + InsertrowCnt);
            if(UpdaterowCnt>0){
                return 1;
            }
            else{
                return 0;
            }
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return 0;
        }
    }
    public double cal(int num, String grade){
        double aver = 0;
        if(grade.equals("A+")){aver = (double)num*4.5;}
        if(grade.equals("A")){aver = (double)num*4.0;}
        if(grade.equals("B+")){aver = (double)num*3.5;}
        if(grade.equals("B")){aver = (double)num*3.0;}
        if(grade.equals("C+")){aver = (double)num*2.5;}
        if(grade.equals("C")){aver = (double)num*2.0;}
        if(grade.equals("D+")){aver = (double)num*1.5;}
        if(grade.equals("D")){aver = (double)num*1;}
        if(grade.equals("F")){aver = 0;}
        return aver;
    }
//    public int insertSemester(String jsonName, String jsonCredit, String jsonGrade, String jsonMajor, String semester, String sid,
//                              String jsonCell_place){
//        // semester는 1-1학기라고 가정했을 때,
//        List<CalculatorDto> list = new ArrayList<>();
//        ObjectMapper objectMapper = new ObjectMapper();
//        int insertCnt=0, updateCnt = 0;
//        try {
//            String[] nameArr = objectMapper.readValue(jsonName, String[].class);
//            Integer[] creditArr = objectMapper.readValue(jsonCredit, Integer[].class);
//            String[] gradeArr = objectMapper.readValue(jsonGrade, String[].class);
//            String[] majorArr = objectMapper.readValue(jsonMajor, String[].class);
//            Integer[] cell_placeArr = objectMapper.readValue(jsonCell_place, Integer[].class);
//            for(int i=0; i< nameArr.length; i++){
//                Map<String, Object> map = new HashMap<>();
//                map.put("sid", sid);
//                map.put("semester", semester);
//                // cell_place는 0, semester는 1-1학기, sid는 ehdrlf0815
//                int cell_place = cell_placeArr[i];
//                map.put("cell_place", cell_place);
//                System.out.println("map = " + map);
//                Integer tmp = calculatorDao.selectCell_Place(map);
//                System.out.println(nameArr[i]+ " "+creditArr[i]+ " "+gradeArr[i]+ " "+majorArr[i]+" "+cell_placeArr[i]);
//                System.out.println("tmp = " + tmp);
//                if(tmp==null){
//                    CalculatorDto insert = new CalculatorDto(sid, semester, nameArr[i], creditArr[i], gradeArr[i], majorArr[i], cell_placeArr[i]);
//                    System.out.println("insert = " + insert);
//                    insertCnt += calculatorDao.insertOne(insert);
//                }else{
//                    CalculatorDto update = new CalculatorDto(sid, semester, nameArr[i], creditArr[i], gradeArr[i], majorArr[i], cell_placeArr[i]);
//                    update.setCno(tmp);
//                }
//            }
//            if(updateCnt > 0){
//                return 1;
//            }else{return 0;}
//        } catch (JsonProcessingException e) {
//            e.printStackTrace();
//            return 0;
//        }
//    }
}
