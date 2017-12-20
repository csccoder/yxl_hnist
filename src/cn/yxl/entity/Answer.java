package cn.yxl.entity;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * Created by Administrator on 2017/6/20.
 * 问题模块回答类
 */

public class Answer implements Serializable{
    private int id;
    private Question question;
    private User user;
    private String answerContent;
    private Timestamp createTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getAnswerContent() {
        return answerContent;
    }

    public void setAnswerContent(String answerContent) {
        this.answerContent = answerContent;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Answer{" +
                "id=" + id +
                ", question=" + question +
                ", user=" + user +
                ", answerContent='" + answerContent + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}
