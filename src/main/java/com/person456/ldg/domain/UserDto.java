package com.person456.ldg.domain;

import java.util.Date;
import java.util.Objects;

public class UserDto {
    private String id;
    private String pwd;
    private String email;
    private Date birth;
    private String username;
    private Date reg_date;

    public UserDto(){}
    public UserDto(String id, String pwd, String email, Date birth, String username, Date reg_date) {
        this.id = id;
        this.pwd = pwd;
        this.email = email;
        this.birth = birth;
        this.username = username;
        this.reg_date = reg_date;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserDto userDto = (UserDto) o;
        return Objects.equals(id, userDto.id) && Objects.equals(pwd, userDto.pwd) && Objects.equals(email, userDto.email) && Objects.equals(birth, userDto.birth) && Objects.equals(username, userDto.username) && Objects.equals(reg_date, userDto.reg_date);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, pwd, email, birth, username, reg_date);
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public String getusername() {
        return username;
    }

    public void setusername(String username) {
        this.username = username;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }
}
