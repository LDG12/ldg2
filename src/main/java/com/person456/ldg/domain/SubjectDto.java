package com.person456.ldg.domain;

import java.util.Objects;

public class SubjectDto {
    private Integer course_num;
    private String subject_name;
    private String major;
    private Integer credit;
    private String professor;
    private String subject_first_day;
    private Integer subject_first_hour;
    private String subject_second_day;
    private Integer subject_second_hour;
    private String place;
    private Integer nop;
    private String etc;

    public SubjectDto(){}
    public SubjectDto(Integer course_num, String subject_name, String major, Integer credit, String professor, String subject_first_day, Integer subject_first_hour, String subject_second_day, Integer subject_second_hour, String place, Integer nop, String etc) {
        this.course_num = course_num;
        this.subject_name = subject_name;
        this.major = major;
        this.credit = credit;
        this.professor = professor;
        this.subject_first_day = subject_first_day;
        this.subject_first_hour = subject_first_hour;
        this.subject_second_day = subject_second_day;
        this.subject_second_hour = subject_second_hour;
        this.place = place;
        this.nop = nop;
        this.etc = etc;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SubjectDto that = (SubjectDto) o;
        return Objects.equals(course_num, that.course_num) && Objects.equals(subject_name, that.subject_name) && Objects.equals(major, that.major) && Objects.equals(credit, that.credit) && Objects.equals(professor, that.professor) && Objects.equals(subject_first_day, that.subject_first_day) && Objects.equals(subject_first_hour, that.subject_first_hour) && Objects.equals(subject_second_day, that.subject_second_day) && Objects.equals(subject_second_hour, that.subject_second_hour) && Objects.equals(place, that.place) && Objects.equals(nop, that.nop) && Objects.equals(etc, that.etc);
    }

    @Override
    public int hashCode() {
        return Objects.hash(course_num, subject_name, major, credit, professor, subject_first_day, subject_first_hour, subject_second_day, subject_second_hour, place, nop, etc);
    }

    @Override
    public String toString() {
        return "SubjectDto{" +
                "course_num=" + course_num +
                ", subject_name='" + subject_name + '\'' +
                ", major='" + major + '\'' +
                ", credit=" + credit +
                ", professor='" + professor + '\'' +
                ", subject_first_day='" + subject_first_day + '\'' +
                ", subject_first_hour=" + subject_first_hour +
                ", subject_second_day='" + subject_second_day + '\'' +
                ", subject_second_hour=" + subject_second_hour +
                ", place='" + place + '\'' +
                ", nop=" + nop +
                ", etc='" + etc + '\'' +
                '}';
    }

    public Integer getCourse_num() {
        return course_num;
    }

    public void setCourse_num(Integer course_num) {
        this.course_num = course_num;
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

    public String getProfessor() {
        return professor;
    }

    public void setProfessor(String professor) {
        this.professor = professor;
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

    public Integer getNop() {
        return nop;
    }

    public void setNop(Integer nop) {
        this.nop = nop;
    }

    public String getEtc() {
        return etc;
    }

    public void setEtc(String etc) {
        this.etc = etc;
    }
}
