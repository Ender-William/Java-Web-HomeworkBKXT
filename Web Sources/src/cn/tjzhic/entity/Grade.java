package cn.tjzhic.entity;

public class Grade {
    private int gardeid;          //成绩ID
    private String testcardnum;   //准考证号
    private String ccode;         //课程代码
    private int score;            //成绩
    private String note;          //备注：正常、缺考、作弊
    private String status;        //状态标识：0：可录入  1：不可录入

    public int getGardeid() {
        return gardeid;
    }

    public void setGardeid(int gardeid) {
        this.gardeid = gardeid;
    }

    public String getTestcardnum() {
        return testcardnum;
    }

    public void setTestcardnum(String testcardnum) {
        this.testcardnum = testcardnum;
    }

    public String getCcode() {
        return ccode;
    }

    public void setCcode(String ccode) {
        this.ccode = ccode;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}