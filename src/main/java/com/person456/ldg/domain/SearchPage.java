package com.person456.ldg.domain;

import org.springframework.web.util.UriComponentsBuilder;

import java.util.Objects;

public class SearchPage {
    private Integer page = 1;
    private Integer pageSize = DEFAULT_PAGE_SIZE;
    private String option="";
    private String keyword="";


    public static final int DEFAULT_PAGE_SIZE=10;

    public SearchPage(){}
    public SearchPage(Integer page, Integer pageSize, String option, String keyword) {
        this.page = page;
        this.pageSize = pageSize;
        this.option = option;
        this.keyword = keyword;
    }

    public String getQueryString(Integer page){
        return UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .queryParam("pageSize", pageSize)
                .queryParam("option", option)
                .queryParam("keyword", keyword)
                .build().toString();
    }
    public String getQueryString(){
        return getQueryString(page);
    }
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SearchPage that = (SearchPage) o;
        return Objects.equals(page, that.page) && Objects.equals(pageSize, that.pageSize) && Objects.equals(option, that.option) && Objects.equals(keyword, that.keyword);
    }

    @Override
    public int hashCode() {
        return Objects.hash(page, pageSize, option, keyword);
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    @Override
    public String toString() {
        return "SearchPage{" +
                "page=" + page +
                ", pageSize=" + pageSize +
                ", option='" + option + '\'' +
                ", keyword='" + keyword + '\'' +
                '}';
    }

    public Integer getOffset() {
        return (page-1)*pageSize;
    }

}
