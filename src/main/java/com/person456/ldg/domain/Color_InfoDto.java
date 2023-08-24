package com.person456.ldg.domain;

import java.util.Objects;

public class Color_InfoDto {
    private Integer cid;
    private String sid;
    private Integer sno;
    private String cell_color;

    public Color_InfoDto(){}
    public Color_InfoDto(Integer cid, String sid, Integer sno, String cell_color) {
        this.cid = cid;
        this.sid = sid;
        this.sno = sno;
        this.cell_color = cell_color;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Color_InfoDto that = (Color_InfoDto) o;
        return Objects.equals(cid, that.cid) && Objects.equals(sid, that.sid) && Objects.equals(sno, that.sno) && Objects.equals(cell_color, that.cell_color);
    }

    @Override
    public int hashCode() {
        return Objects.hash(cid, sid, sno, cell_color);
    }

    @Override
    public String toString() {
        return "Color_InfoDto{" +
                "cid=" + cid +
                ", sid='" + sid + '\'' +
                ", sno=" + sno +
                ", cell_color='" + cell_color + '\'' +
                '}';
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public Integer getSno() {
        return sno;
    }

    public void setSno(Integer sno) {
        this.sno = sno;
    }

    public String getCell_color() {
        return cell_color;
    }

    public void setCell_color(String cell_color) {
        this.cell_color = cell_color;
    }
}
