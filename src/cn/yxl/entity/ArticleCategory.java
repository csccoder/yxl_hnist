package cn.yxl.entity;

/**
 * Created by Administrator on 2017/6/18.
 */
public class ArticleCategory {
    private int id;
    private String categoryName;

    public ArticleCategory() {
    }

    public ArticleCategory(int id, String categoryName) {
        this.id = id;
        this.categoryName = categoryName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}
