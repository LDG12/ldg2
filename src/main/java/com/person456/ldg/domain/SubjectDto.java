package com.person456.ldg.domain;

import java.util.Objects;

public class SubjectDto {
    private Integer course_num;
    private String subject_name;
    private String major;
    private Integer credit;
    private String professor;
    private String subject_time;
    private String subject_place;
    private Integer subject_nop;
    private String etc;

    public SubjectDto(){}
    public SubjectDto(Integer course_num, String subject_name, String major, Integer credit, String professor, String subject_time, String subject_place, Integer subject_nop, String etc) {
        this.course_num = course_num;
        this.subject_name = subject_name;
        this.major = major;
        this.credit = credit;
        this.professor = professor;
        this.subject_time = subject_time;
        this.subject_place = subject_place;
        this.subject_nop = subject_nop;
        this.etc = etc;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SubjectDto that = (SubjectDto) o;
        return Objects.equals(course_num, that.course_num) && Objects.equals(subject_name, that.subject_name) && Objects.equals(major, that.major) && Objects.equals(credit, that.credit) && Objects.equals(professor, that.professor) && Objects.equals(subject_time, that.subject_time) && Objects.equals(subject_place, that.subject_place) && Objects.equals(subject_nop, that.subject_nop) && Objects.equals(etc, that.etc);
    }

    @Override
    public int hashCode() {
        return Objects.hash(course_num, subject_name, major, credit, professor, subject_time, subject_place, subject_nop, etc);
    }

    @Override
    public String toString() {
        return "SubjectDto{" +
                "course_num=" + course_num +
                ", subject_name='" + subject_name + '\'' +
                ", major='" + major + '\'' +
                ", credit=" + credit +
                ", professor='" + professor + '\'' +
                ", subject_time='" + subject_time + '\'' +
                ", subject_place='" + subject_place + '\'' +
                ", subject_nop=" + subject_nop +
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

    public String getSubject_time() {
        return subject_time;
    }

    public void setSubject_time(String subject_time) {
        this.subject_time = subject_time;
    }

    public String getSubject_place() {
        return subject_place;
    }

    public void setSubject_place(String subject_place) {
        this.subject_place = subject_place;
    }

    public Integer getSubject_nop() {
        return subject_nop;
    }

    public void setSubject_nop(Integer subject_nop) {
        this.subject_nop = subject_nop;
    }

    public String getEtc() {
        return etc;
    }

    public void setEtc(String etc) {
        this.etc = etc;
    }
}
