package com.person456.ldg.domain;

import java.util.List;
import java.util.Objects;

public class ScheduleWithColor {
    private List<ScheduleDto> scheduleDtoList;
    private List<Color_InfoDto> color_infoDtoList;

    public ScheduleWithColor(){}
    public ScheduleWithColor(List<ScheduleDto> scheduleDtoList, List<Color_InfoDto> color_infoDtoList) {
        this.scheduleDtoList = scheduleDtoList;
        this.color_infoDtoList = color_infoDtoList;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ScheduleWithColor that = (ScheduleWithColor) o;
        return Objects.equals(scheduleDtoList, that.scheduleDtoList) && Objects.equals(color_infoDtoList, that.color_infoDtoList);
    }

    @Override
    public int hashCode() {
        return Objects.hash(scheduleDtoList, color_infoDtoList);
    }

    @Override
    public String toString() {
        return "ScheduleWithColor{" +
                "scheduleDtoList=" + scheduleDtoList +
                ", color_infoDtoList=" + color_infoDtoList +
                '}';
    }

    public List<ScheduleDto> getScheduleDtoList() {
        return scheduleDtoList;
    }

    public void setScheduleDtoList(List<ScheduleDto> scheduleDtoList) {
        this.scheduleDtoList = scheduleDtoList;
    }

    public List<Color_InfoDto> getColor_infoDtoList() {
        return color_infoDtoList;
    }

    public void setColor_infoDtoList(List<Color_InfoDto> color_infoDtoList) {
        this.color_infoDtoList = color_infoDtoList;
    }
}
