package cn.yxl.entity;

import java.beans.Transient;
import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2017/6/18.
 */
public class PageTool<T>  implements Serializable {
    private int curPage;
    private int pageSize;
    private int firstPage=1;
    private int lastPage;
    private int prePage;
    private int nextPage;
    private int count;
    private List<T> contents;

    public int getCurPage() {
        return curPage;
    }

    public void setCurPage(int curPage) {
        this.curPage = curPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getFirstPage() {
        return firstPage;
    }

    public void setFirstPage(int firstPage) {
        this.firstPage = firstPage;
    }

    public int getLastPage() {
         lastPage=(int)Math.ceil(count*1.0/getPageSize());
        if(lastPage==0){
            return 1;
        }else{
            return lastPage;
        }
    }

    public void setLastPage(int lastPage) {
        this.lastPage = lastPage;
    }

    public List<T> getContents() {
        return contents;
    }

    public void setContents(List<T> contents) {
        this.contents = contents;
    }

    public void setPrePage(int prePage) {
        this.prePage = prePage;
    }

    public void setNextPage(int nextPage) {
        this.nextPage = nextPage;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
    @Transient
    public int getPrePage() {
       if(curPage-1>=1){
           return curPage-1;
       }else{
           return 1;
       }
    }
    @Transient
    public int getNextPage() {
        if(curPage+1<=getLastPage()){
            return curPage+1;
        }else {
            return lastPage;
        }
    }
}
