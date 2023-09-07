package com.person456.ldg.domain;

import java.util.Objects;

public class CalculatorDto {
    private Integer cno;
    private String sid;
    private String semester;
    private String subject_name;
    private Integer credit;
    private String grade;
    private String major;
    private Integer cell_place;

    public CalculatorDto(){}
    public CalculatorDto(String sid, String semester, String subject_name, Integer credit, String grade, String major, Integer cell_place) {
        this.sid = sid;
        this.semester = semester;
        this.subject_name = subject_name;
        this.credit = credit;
        this.grade = grade;
        this.major = major;
        this.cell_place = cell_place;
    }
    public CalculatorDto(Integer cno, String sid, String semester, String subject_name, Integer credit, String grade, String major, Integer cell_place) {
        this.cno = cno;
        this.sid = sid;
        this.semester = semester;
        this.subject_name = subject_name;
        this.credit = credit;
        this.grade = grade;
        this.major = major;
        this.cell_place=cell_place;
    }
    public CalculatorDto(Integer cno, String sid, String semester, String subject_name, Integer credit, String grade, String major) {
        this.cno = cno;
        this.sid = sid;
        this.semester = semester;
        this.subject_name = subject_name;
        this.credit = credit;
        this.grade = grade;
        this.major = major;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CalculatorDto that = (CalculatorDto) o;
        return Objects.equals(cno, that.cno) && Objects.equals(sid, that.sid) && Objects.equals(semester, that.semester) && Objects.equals(subject_name, that.subject_name) && Objects.equals(credit, that.credit) && Objects.equals(grade, that.grade) && Objects.equals(major, that.major) && Objects.equals(cell_place, that.cell_place);
    }

    @Override
    public int hashCode() {
        return Objects.hash(cno, sid, semester, subject_name, credit, grade, major, cell_place);
    }

    @Override
    public String toString() {
        return "CalculatorDto{" +
                "cno=" + cno +
                ", sid='" + sid + '\'' +
                ", semester='" + semester + '\'' +
                ", subject_name='" + subject_name + '\'' +
                ", credit=" + credit +
                ", grade='" + grade + '\'' +
                ", major='" + major + '\'' +
                ", cell_place=" + cell_place +
                '}';
    }

    public Integer getCell_place() {
        return cell_place;
    }

    public void setCell_place(Integer cell_place) {
        this.cell_place = cell_place;
    }

    public Integer getCno() {
        return cno;
    }

    public void setCno(Integer cno) {
        this.cno = cno;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public String getSubject_name() {
        return subject_name;
    }

    public void setSubject_name(String subject_name) {
        this.subject_name = subject_name;
    }

    public Integer getCredit() {
        return credit;
    }

    public void setCredit(Integer credit) {
        this.credit = credit;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }
}
