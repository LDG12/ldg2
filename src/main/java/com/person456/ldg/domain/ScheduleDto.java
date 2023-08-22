package com.person456.ldg.domain;

import java.util.Date;
import java.util.Objects;

public class ScheduleDto {
    private Integer sno;
    private String sid;
    private Integer begin_class;
    private Integer end_class;
    private String class_name;
    private Date reg_date;
    private String class_date;

    public ScheduleDto(){}
    public ScheduleDto(Integer sno, String sid, Integer begin_class, Integer end_class, String class_name, Date reg_date, String class_date) {
        this.sno = sno;
        this.sid = sid;
        this.begin_class = begin_class;
        this.end_class = end_class;
        this.class_name = class_name;
        this.reg_date = reg_date;
        this.class_date = class_date;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ScheduleDto that = (ScheduleDto) o;
        return Objects.equals(sno, that.sno) && Objects.equals(sid, that.sid) && Objects.equals(begin_class, that.begin_class) && Objects.equals(end_class, that.end_class) && Objects.equals(class_name, that.class_name) && Objects.equals(reg_date, that.reg_date) && Objects.equals(class_date, that.class_date);
    }

    @Override
    public int hashCode() {
        return Objects.hash(sno, sid, begin_class, end_class, class_name, reg_date, class_date);
    }

    @Override
    public String toString() {
        return "ScheduleDto{" +
                "sno=" + sno +
                ", sid='" + sid + '\'' +
                ", begin_class=" + begin_class +
                ", end_class=" + end_class +
                ", class_name='" + class_name + '\'' +
                ", reg_date=" + reg_date +
                ", class_date='" + class_date + '\'' +
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

    public Integer getBegin_class() {
        return begin_class;
    }

    public void setBegin_class(Integer begin_class) {
        this.begin_class = begin_class;
    }

    public Integer getEnd_class() {
        return end_class;
    }

    public void setEnd_class(Integer end_class) {
        this.end_class = end_class;
    }

    public String getClass_name() {
        return class_name;
    }

    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    public String getClass_date() {
        return class_date;
    }

    public void setClass_date(String class_date) {
        this.class_date = class_date;
    }
}
