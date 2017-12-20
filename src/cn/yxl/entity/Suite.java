package cn.yxl.entity;

import java.sql.Timestamp;
import java.util.List;

/**
 * Created by Administrator on 2017/6/20.
 */
public class Suite {
    private String suiteCode;//suite_Code
    private String title;//title
    private String description;//discription
    private String photo;
    private int testnum;
    private int issuggest;
    private int questionCount;
    private String moduleCode;
    private Timestamp creatTime;

    private List<SuiteQuestion> suiteQuestions;

    public String getSuiteCode() {
        return suiteCode;
    }

    public void setSuiteCode(String suiteCode) {
        this.suiteCode = suiteCode;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public int getTestnum() {
        return testnum;
    }

    public void setTestnum(int testnum) {
        this.testnum = testnum;
    }

    public int getIssuggest() {
        return issuggest;
    }

    public void setIssuggest(int issuggest) {
        this.issuggest = issuggest;
    }

    public int getQuestionCount() {
        return questionCount;
    }

    public void setQuestionCount(int questionCount) {
        this.questionCount = questionCount;
    }

    public String getModuleCode() {
        return moduleCode;
    }

    public void setModuleCode(String moduleCode) {
        this.moduleCode = moduleCode;
    }

    public Timestamp getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(Timestamp creatTime) {
        this.creatTime = creatTime;
    }

    public List<SuiteQuestion> getSuiteQuestions() {
        return suiteQuestions;
    }

    public void setSuiteQuestions(List<SuiteQuestion> suiteQuestions) {
        this.suiteQuestions = suiteQuestions;
    }

    @Override
    public String toString() {
        return "Suite{" +
                "suiteCode='" + suiteCode + '\'' +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", photo='" + photo + '\'' +
                ", testnum=" + testnum +
                ", issuggest=" + issuggest +
                ", questionCount=" + questionCount +
                ", moduleCode='" + moduleCode + '\'' +
                ", creatTime=" + creatTime +
                ", suiteQuestions=" + suiteQuestions +
                '}';
    }
}
