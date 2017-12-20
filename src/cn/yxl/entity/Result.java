package cn.yxl.entity;

/**
 * Created by Administrator on 2017/6/20.
 */
public class Result {
    private String resultCode;
    private int minScore;
    private int maxScore;
    private String resultDesc;
    private Suite suite;
    private String miaoshu;

    public String getResultCode() {
        return resultCode;
    }

    public void setResultCode(String resultCode) {
        this.resultCode = resultCode;
    }

    public int getMinScore() {
        return minScore;
    }

    public void setMinScore(int minScore) {
        this.minScore = minScore;
    }

    public int getMaxScore() {
        return maxScore;
    }

    public void setMaxScore(int maxScore) {
        this.maxScore = maxScore;
    }

    public String getResultDesc() {
        return resultDesc;
    }

    public void setResultDesc(String resultDesc) {
        this.resultDesc = resultDesc;
    }

    public Suite getSuite() {
        return suite;
    }

    public void setSuite(Suite suite) {
        this.suite = suite;
    }

    public String getMiaoshu() {
        return miaoshu;
    }

    public void setMiaoshu(String miaoshu) {
        this.miaoshu = miaoshu;
    }

    @Override
    public String toString() {
        return "Result{" +
                "resultCode='" + resultCode + '\'' +
                ", minScore=" + minScore +
                ", maxScore=" + maxScore +
                ", resultDesc='" + resultDesc + '\'' +
                ", suite=" + suite +
                ", miaoshu='" + miaoshu + '\'' +
                '}';
    }
}
