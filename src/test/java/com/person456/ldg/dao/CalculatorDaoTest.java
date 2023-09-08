package com.person456.ldg.dao;

import com.person456.ldg.domain.CalculatorDto;
import org.apache.ibatis.annotations.Update;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.validation.constraints.AssertTrue;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CalculatorDaoTest {
    @Autowired
    CalculatorDao calculatorDao;

    @Test
    public void test(){
        String sid = "ehdrlf0815";
        String semester = "1학년 1학기";
        String[] nameArr = {"123","","","","","","","","",""};
        Integer[] creditArr={0,0,0,0,0,0,0,0,0,0};
        String[] gradeArr={"A+","A+","A+","A+","A+","A+","A+","A+","A+","A+"};
        String[] majorArr={"yes","no","no","no","no","no","no","no","no","no"};
        Integer[] cell_placeArr={0,1,2,3,4,5,6,7,8,9};
        List<Integer> list = new ArrayList<>();
        for(int i=0; i<10; i++){
            Map<String, Object> map = new HashMap<>();
            map.put("sid" ,sid);
            map.put("semester", semester);
            map.put("cell_place", i);
            list.add(calculatorDao.selectCell_Place(map));
            System.out.println(nameArr[i]+" "+creditArr[i]+" "+gradeArr[i]+" "+majorArr[i]+" "+cell_placeArr[i]);
        }
        //list에는 cell_place가 0부터 9까지일떄의 값이 순차적으로 들어있다....
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
        System.out.println("InsertrowCnt = " + InsertrowCnt);
        System.out.println("UpdaterowCnt = " + UpdaterowCnt);
        assertTrue(UpdaterowCnt==8 && InsertrowCnt==1);
    }

    @Test
    public void test2(){
        String sid="ehdrlf0815";
        List<CalculatorDto> list = calculatorDao.selectAll(sid);
        Integer acquisition =0;
        double sum=0;
        Integer majorAcquisition=0;
        double majorSum=0;
        for(int i=0; i<list.size(); i++){
            System.out.println(list.get(i).getCredit()+" "+list.get(i).getGrade()+" "+list.get(i).getMajor());
            Integer num = list.get(i).getCredit();
            String grade = list.get(i).getGrade();
            if(num!=0){
                acquisition+=num;
                sum+=cal(num, grade);
            }
            if(list.get(i).getMajor().equals("yes")){
                majorAcquisition+=num;
                majorSum+=cal(num,grade);
            }
        }
        System.out.println("acquisition = " + acquisition);
        System.out.println("majorAcquisition = " + majorAcquisition);
        DecimalFormat decimalFormat = new DecimalFormat("#.##");
        String gpa = decimalFormat.format((double)(sum/acquisition));
        String majorgpa = decimalFormat.format((double)(majorSum/majorAcquisition));
        System.out.println("gpa = " + gpa);
        System.out.println("majorgpa = " + majorgpa);
    }
    @Test
    public void test3(){
        String sid="ehdrlf0815";
        String[] semester ={"1학년 1학기", "1학년 2학기", "2학년 1학기", "2학년 2학기", "3학년 1학기",
                "3학년 2학기", "4학년 1학기", "4학년 2학기", "5학년 1학기", "5학년 2학기", "6학년 1학기", "6학년 2학기"};
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
            System.out.println("convi = " + convi);
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
}