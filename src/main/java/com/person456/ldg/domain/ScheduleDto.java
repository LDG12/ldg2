package com.person456.ldg.domain;

import java.util.Date;
import java.util.Objects;

public class ScheduleDto {
    private Integer sno;
    private String sid;
    private String subject_name;
    private String major;
    private Integer credit;
    private String subject_first_day;
    private Integer subject_first_hour;
    private String subject_second_day;
    private Integer subject_second_hour;
    private String place;
    private String subject_third_day;
    private Integer subject_third_hour;
    private String subject_fourth_day;
    private Integer subject_fourth_hour;

    public ScheduleDto(){}
    public ScheduleDto(Integer sno, String sid, String subject_name, String major, Integer credit, String subject_first_day, Integer subject_first_hour, String subject_second_day, Integer subject_second_hour, String place, String subject_third_day, Integer subject_third_hour, String subject_fourth_day, Integer subject_fourth_hour) {
        this.sno = sno;
        this.sid = sid;
        this.subject_name = subject_name;
        this.major = major;
        this.credit = credit;
        this.subject_first_day = subject_first_day;
        this.subject_first_hour = subject_first_hour;
        this.subject_second_day = subject_second_day;
        this.subject_second_hour = subject_second_hour;
        this.place = place;
        this.subject_third_day = subject_third_day;
        this.subject_third_hour = subject_third_hour;
        this.subject_fourth_day = subject_fourth_day;
        this.subject_fourth_hour = subject_fourth_hour;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ScheduleDto that = (ScheduleDto) o;
        return Objects.equals(sno, that.sno) && Objects.equals(sid, that.sid) && Objects.equals(subject_name, that.subject_name) && Objects.equals(major, that.major) && Objects.equals(credit, that.credit) && Objects.equals(subject_first_day, that.subject_first_day) && Objects.equals(subject_first_hour, that.subject_first_hour) && Objects.equals(subject_second_day, that.subject_second_day) && Objects.equals(subject_second_hour, that.subject_second_hour) && Objects.equals(place, that.place) && Objects.equals(subject_third_day, that.subject_third_day) && Objects.equals(subject_third_hour, that.subject_third_hour) && Objects.equals(subject_fourth_day, that.subject_fourth_day) && Objects.equals(subject_fourth_hour, that.subject_fourth_hour);
    }

    @Override
    public int hashCode() {
        return Objects.hash(sno, sid, subject_name, major, credit, subject_first_day, subject_first_hour, subject_second_day, subject_second_hour, place, subject_third_day, subject_third_hour, subject_fourth_day, subject_fourth_hour);
    }

    @Override
    public String toString() {
        return "ScheduleDto{" +
                "sno=" + sno +
                ", sid='" + sid + '\'' +
                ", subject_name='" + subject_name + '\'' +
                ", major='" + major + '\'' +
                ", credit=" + credit +
                ", subject_first_day='" + subject_first_day + '\'' +
                ", subject_first_hour=" + subject_first_hour +
                ", subject_second_day='" + subject_second_day + '\'' +
                ", subject_second_hour=" + subject_second_hour +
                ", place='" + place + '\'' +
                ", subject_third_day='" + subject_third_day + '\'' +
                ", subject_third_hour=" + subject_third_hour +
                ", subject_fourth_day='" + subject_fourth_day + '\'' +
                ", subject_fourth_hour=" + subject_fourth_hour +
                '}';
    }

    public Integer getSno() {
        return sno;
    }

    public void setSno(Integer sno) {
        this.sno = sno;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getSubject_name() {
        return subject_name;
    }

    public void setSubject_name(String subject_name) {
        this.subject_name = subject_name;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public Integer getCredit() {
        return credit;
    }

    public void setCredit(Integer credit) {
        this.credit = credit;
    }

    public String getSubject_first_day() {
        return subject_first_day;
    }

    public void setSubject_first_day(String subject_first_day) {
        this.subject_first_day = subject_first_day;
    }

    public Integer getSubject_first_hour() {
        return subject_first_hour;
    }

    public void setSubject_first_hour(Integer subject_first_hour) {
        this.subject_first_hour = subject_first_hour;
    }

    public String getSubject_second_day() {
        return subject_second_day;
    }

    public void setSubject_second_day(String subject_second_day) {
        this.subject_second_day = subject_second_day;
    }

    public Integer getSubject_second_hour() {
        return subject_second_hour;
    }

    public void setSubject_second_hour(Integer subject_second_hour) {
        this.subject_second_hour = subject_second_hour;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getSubject_third_day() {
        return subject_third_day;
    }

    public void setSubject_third_day(String subject_third_day) {
        this.subject_third_day = subject_third_day;
    }

    public Integer getSubject_third_hour() {
        return subject_third_hour;
    }

    public void setSubject_third_hour(Integer subject_third_hour) {
        this.subject_third_hour = subject_third_hour;
    }

    public String getSubject_fourth_day() {
        return subject_fourth_day;
    }

    public void setSubject_fourth_day(String subject_fourth_day) {
        this.subject_fourth_day = subject_fourth_day;
    }

    public Integer getSubject_fourth_hour() {
        return subject_fourth_hour;
    }

    public void setSubject_fourth_hour(Integer subject_fourth_hour) {
        this.subject_fourth_hour = subject_fourth_hour;
    }
}
