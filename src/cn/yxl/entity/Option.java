package cn.yxl.entity;

public class Option {
    private String optionCode;//option_code
    private String title;//title
    private String questionCode;//question_code
    private int score;//
    private String nextQuestion;//next_question

    public String getOptionCode() {
        return optionCode;
    }

    public void setOptionCode(String optionCode) {
        this.optionCode = optionCode;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getQuestionCode() {
        return questionCode;
    }

    public void setQuestionCode(String questionCode) {
        this.questionCode = questionCode;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getNextQuestion() {
        return nextQuestion;
    }

    public void setNextQuestion(String nextQuestion) {
        this.nextQuestion = nextQuestion;
    }

    @Override
    public String toString() {
        return "Option [optionCode=" + optionCode + ", title=" + title
                + ", questionCode=" + questionCode + ", score=" + score
                + ", nextQuestion=" + nextQuestion + "]";
    }

}
