package cn.yxl.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

/**
 * Created by Administrator on 2017/6/19.
 */
public class Question implements Serializable{
    private int id;
    private String name;
    private String content;
    private String img;
    private User user;
    private QuestionCategory category;
    private Timestamp createTime;
    private int flag;
    private int answerNum;

    private List<Answer> answers;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public QuestionCategory getCategory() {
        return category;
    }

    public void setCategory(QuestionCategory category) {
        this.category = category;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public List<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(List<Answer> answers) {
        this.answers = answers;
    }

    public int getAnswerNum() {
        return answerNum;
    }

    public void setAnswerNum(int answerNum) {
        this.answerNum = answerNum;
    }

    @Override
    public String toString() {
        return "Question{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", content='" + content + '\'' +
                ", img='" + img + '\'' +
                ", user=" + user +
                ", category=" + category +
                ", createTime=" + createTime +
                ", flag=" + flag +
                ", answerNum=" + answerNum +
                ", answers=" + answers +
                '}';
    }
}
