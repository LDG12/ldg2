package com.person456.ldg.domain;

import java.util.Objects;

public class Schedule_InfoDto {
    private Integer pno;
    private Integer schedule_set;
    private String schedule_name;
    private String sid;

    public Schedule_InfoDto(){}
    public Schedule_InfoDto(Integer pno, Integer schedule_set, String schedule_name, String sid) {
        this.pno = pno;
        this.schedule_set = schedule_set;
        this.schedule_name = schedule_name;
        this.sid = sid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Schedule_InfoDto that = (Schedule_InfoDto) o;
        return Objects.equals(pno, that.pno) && Objects.equals(schedule_set, that.schedule_set) && Objects.equals(schedule_name, that.schedule_name) && Objects.equals(sid, that.sid);
    }

    @Override
    public int hashCode() {
        return Objects.hash(pno, schedule_set, schedule_name, sid);
    }

    @Override
    public String toString() {
        return "Schedule_InfoDto{" +
                "pno=" + pno +
                ", schedule_set=" + schedule_set +
                ", schedule_name='" + schedule_name + '\'' +
                ", sid='" + sid + '\'' +
                '}';
    }

    public Integer getPno() {
        return pno;
    }

    public void setPno(Integer pno) {
        this.pno = pno;
    }

    public Integer getSchedule_set() {
        return schedule_set;
    }

    public void setSchedule_set(Integer schedule_set) {
        this.schedule_set = schedule_set;
    }

    public String getSchedule_name() {
        return schedule_name;
    }

    public void setSchedule_name(String schedule_name) {
        this.schedule_name = schedule_name;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }
}
