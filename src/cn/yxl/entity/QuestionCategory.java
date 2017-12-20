package cn.yxl.entity;

/**
 * Created by Administrator on 2017/6/19.
 */
public class QuestionCategory {
    private int id;
    private String categoryName;

    public QuestionCategory(int id, String categoryName) {
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
