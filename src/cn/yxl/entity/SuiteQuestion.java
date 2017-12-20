package cn.yxl.entity;

import java.util.List;

/**
 * Created by Administrator on 2017/6/20.
 */
public class SuiteQuestion {

    private String questionCode;//question_code
    private String title;//suite_code
    private String suiteCode;
    private int orderNo;

    private List<Option> options;

    public String getQuestionCode() {
        return questionCode;
    }

    public void setQuestionCode(String questionCode) {
        this.questionCode = questionCode;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSuiteCode() {
        return suiteCode;
    }

    public void setSuiteCode(String suiteCode) {
        this.suiteCode = suiteCode;
    }

    public int getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(int orderNo) {
        this.orderNo = orderNo;
    }

    public List<Option> getOptions() {
        return options;
    }

    public void setOptions(List<Option> options) {
        this.options = options;
    }

    @Override
    public String toString() {
        return "SuiteQuestion{" +
                "questionCode='" + questionCode + '\'' +
                ", questionTitle='" + title + '\'' +
                ", suiteCode='" + suiteCode + '\'' +
                ", orderNo=" + orderNo +
                ", options=" + options +
                '}';
    }
}
