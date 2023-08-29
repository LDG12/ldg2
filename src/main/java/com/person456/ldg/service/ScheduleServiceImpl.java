package com.person456.ldg.service;

import com.person456.ldg.dao.ScheduleDao;
import com.person456.ldg.domain.ScheduleDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class ScheduleServiceImpl implements ScheduleService {
    @Autowired
    ScheduleDao scheduleDao;
    @Autowired
    Schedule_InfoService schedule_infoService;

    @Override
    public List<String> readMajor(Integer set_num){
        return scheduleDao.readMajor(set_num);
    }
    @Override
    public List<Integer> readCredit(Integer set_num){
        return scheduleDao.readCredit(set_num);
    }
    @Override
    public Integer addNewSchedule_set(String sid){
        List<Integer> list = schedule_infoService.schedule_set(sid);
        Collections.sort(list);
        Integer newSchedule_set =0;
        if(list.size()==1){
            Integer tmp = list.get(0);
            if(tmp == 1){
                newSchedule_set = 2;
            }
            else{
                newSchedule_set = 1;
            }
        }
        else{
            for(int i=1; i<=list.size(); i++){
                if(i!=list.get(i-1)){
                    newSchedule_set = i;
                    break;
                }
                if(i == list.size()){
                    newSchedule_set = i+1;
                }
            }
        }
        return newSchedule_set;
    }
    @Override
    public String addNewSchedule(String sid){
        List<String> list = schedule_infoService.initial(sid);
        List<String> valiList = new ArrayList<>();
        Integer[] intSpace = new Integer[list.size()];
        for(String tmp : list){
            if(tmp.startsWith("시간표 ")){
                String[] tmp2 = tmp.split(" ");
                if(tmp2.length ==2){
                    try{
                        Integer.parseInt(tmp2[1]);
                        valiList.add(tmp);
                    }
                    catch(NumberFormatException e){
                        return "fail";
                    }
                }
            }
        }
        for(int i=0; i<valiList.size(); i++){
            String tmp = valiList.get(i);
            String[] tmp2 = tmp.split(" ");
            intSpace[i] = Integer.parseInt(tmp2[1]);
        }
        Arrays.sort(intSpace);
        int next=0;
        if(intSpace.length == 1){
            int tmp = intSpace[0];
            if(tmp == 1){
                next = 2;
            }
            else{
                next = 1;
            }
        }
        else{
            for(int i=1; i<= intSpace.length; i++){
                if(i!=intSpace[i-1]){
                    next=i;
                    break;
                }
                else{
                    if(i == intSpace.length){
                        next=i+1;
                    }
                    continue;
                }
            }
        }
        return "시간표 "+next;
    }
    @Override
    public int count(String sid){
        return scheduleDao.count(sid);
    }
    @Override
    public List<ScheduleDto> selectOneSchedule(String sid){
        return scheduleDao.selectOneSchedule(sid);
    }
    @Override
    public int selectSno(ScheduleDto scheduleDto){
        return scheduleDao.selectSno(scheduleDto);
    }
    @Override
    public int insert(ScheduleDto scheduleDto){
        String first_day = scheduleDto.getSubject_first_day();
        Integer first_hour = scheduleDto.getSubject_first_hour();
        String second_day = scheduleDto.getSubject_second_day();
        Integer second_hour = scheduleDto.getSubject_second_hour();
        List<ScheduleDto> valis = scheduleDao.selectOneSchedule(scheduleDto.getSid());
        for(ScheduleDto vali : valis){
            if(checkOverlap(vali, first_day, first_hour)||checkOverlap(vali, second_day, second_hour)){
                return 0;
            }
        }
        return scheduleDao.insert(scheduleDto);
    }
    @Override
    public int deleteAll(Integer sno){
        return scheduleDao.deleteAll(sno);
    }
    @Override
    public int delete(Map map){
        return scheduleDao.delete(map);
    }

    private boolean checkOverlap(ScheduleDto vali, String day, Integer hour) {
        if (day.equals(vali.getSubject_first_day())) {
            if (hour.equals(vali.getSubject_first_hour())) {
                return true;
            }
        }

        if (day.equals(vali.getSubject_second_day())) {
            if (hour.equals(vali.getSubject_second_hour())) {
                return true;
            }
        }

        return false;
    }

}
