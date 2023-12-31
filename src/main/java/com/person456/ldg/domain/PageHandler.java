package com.person456.ldg.domain;

public class PageHandler {
    private int totalCnt;
    private int pageSize=10;
    private int naviSize =10;
    private int totalPage;
    private  int page;
    private int beginPage;
    private int endPage;
    private boolean showPrev;
    private boolean showNext;
    private SearchPage sp;



    public PageHandler(int totalCnt, SearchPage sp){
        this.totalCnt=totalCnt;
        this.sp = sp;

        doPaging(totalCnt, sp);
    }
    public void doPaging(int totalCnt, SearchPage sp){
        this.totalCnt=totalCnt;
        this.page=sp.getPage();
        this.pageSize=sp.getPageSize();

        totalPage = (int)Math.ceil(totalCnt / (double)sp.getPageSize());
        beginPage = (page-1)/naviSize *naviSize+1;
        endPage = Math.min((beginPage+naviSize)-1, totalPage);
        showPrev = beginPage!=1;
        showNext = endPage != totalPage;
    }
    void print(){
        System.out.println("page = " + page);
        System.out.print(showPrev?"[PREV]":"");
        for(int i=beginPage; i<=endPage; i++){
            System.out.print(i+" ");
        }
        System.out.println(showNext?"[NEXT]":"");
    }

    public int getTotalCnt() {
        return totalCnt;
    }

    public void setTotalCnt(int totalCnt) {
        this.totalCnt = totalCnt;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getNaviSize() {
        return naviSize;
    }

    public void setNaviSize(int naviSize) {
        this.naviSize = naviSize;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getBeginPage() {
        return beginPage;
    }

    public void setBeginPage(int beginPage) {
        this.beginPage = beginPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public boolean isShowPrev() {
        return showPrev;
    }

    public void setShowPrev(boolean showPrev) {
        this.showPrev = showPrev;
    }

    public boolean isShowNext() {
        return showNext;
    }

    public void setShowNext(boolean showNext) {
        this.showNext = showNext;
    }

    public SearchPage getSp() {
        return sp;
    }

    public void setSp(SearchPage sp) {
        this.sp = sp;
    }

    @Override
    public String toString() {
        return "PageHandler{" +
                "totalCnt=" + totalCnt +
                ", pageSize=" + pageSize +
                ", naviSize=" + naviSize +
                ", totalPage=" + totalPage +
                ", page=" + page +
                ", beginPage=" + beginPage +
                ", endPage=" + endPage +
                ", showPrev=" + showPrev +
                ", showNext=" + showNext +
                ", sp=" + sp +
                '}';
    }
}
