package com.person456.ldg.service;

import com.person456.ldg.dao.ScheduleDao;
import com.person456.ldg.domain.ScheduleDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class ScheduleServiceImpl implements ScheduleService {
    @Autowired
    ScheduleDao scheduleDao;
    @Autowired
    Schedule_InfoService schedule_infoService;
    @Autowired
    Color_InfoService color_infoService;

    @Override
    @Transactional
    public int selectDeleteSno(Map map){
        Integer schedule_set = schedule_infoService.second(map);
        int rowCnt = schedule_infoService.delete(map);
        if(rowCnt == 1){
            map.remove("schedule_name");
            map.put("schedule_set", schedule_set);
            List<Integer> list = scheduleDao.selectDeleteSno(map);
            if(list.isEmpty()){
                return -1; // 비어있는 schedule이었으면 그냥 끝. 삭제 진행 할거도없이 이미 schedule 테이블에 비어있음.
            }
            else{ // 안비어있으니까 color_info랑 schedule_set을 가진 schedule 튜플 지워야함
                int colorCnt = color_infoService.deleteAll(list);
                int schduleCnt = scheduleDao.deleteSchedule(list);
                return 1;
            }
        }
        else{
            return 0;
        }
    }
    @Override
    public List<String> readMajor(Integer set_num){
        return scheduleDao.readMajor(set_num);
    }
    @Override
    public List<Integer> readCredit(Integer set_num){
        return scheduleDao.readCredit(set_num);
    }
    @Override
    public List<ScheduleDto> loadSchedule(Map map){
        return scheduleDao.loadSchedule(map);
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
        Integer schedule_set = scheduleDto.getschedule_set();
        String third_day = scheduleDto.getSubject_third_day();
        Integer third_hour = scheduleDto.getSubject_third_hour();
        String fourth_day = scheduleDto.getSubject_fourth_day();
        Integer fourth_hour = scheduleDto.getSubject_fourth_hour();
        Map<String, String> map = new HashMap<>();
        map.put("sid", scheduleDto.getSid());
        map.put("schedule_set", String.valueOf(schedule_set));
        List<ScheduleDto> list2 = scheduleDao.loadSchedule(map);
        if(third_day.equals("") && fourth_day.equals("")){
            for(ScheduleDto list : list2){
                if(checkOverlap(list, first_day, first_hour)||checkOverlap(list, second_day, second_hour)){
                    return 0;
                }
            }
        }
        else{
            for(ScheduleDto list : list2){
                if(checkOverlap(list, first_day, first_hour)||checkOverlap(list, second_day, second_hour)
                ||checkOverlap(list, third_day, third_hour)||checkOverlap(list, fourth_day, fourth_hour)){
                    return 0;
                }
            }
        }

        return scheduleDao.insert(scheduleDto);
    }
    @Override
    public int deleteAll(Integer sno){
        return scheduleDao.deleteAll(sno);
    }
    @Override
    public int deleteSchedule(List<Integer> list){
        return scheduleDao.deleteSchedule(list);
    }
    @Override
    public int delete(Map map){
        return scheduleDao.delete(map);
    }

    private boolean checkOverlap(ScheduleDto vali, String day, Integer hour) {
        if (day.equals(vali.getSubject_first_day()) && hour.equals(vali.getSubject_first_hour())) {
            return true;
        }

        if (day.equals(vali.getSubject_second_day()) && hour.equals(vali.getSubject_second_hour())) {
            return true;
        }

        if (day.equals(vali.getSubject_third_day()) && hour.equals(vali.getSubject_third_hour())) {
            return true;
        }

        if (day.equals(vali.getSubject_fourth_day()) && hour.equals(vali.getSubject_fourth_hour())) {
            return true;
        }

        return false;
    }

}
