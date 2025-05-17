/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Progress {
     private int id;
    private String studentID;
    private int courseID;
    private int lessonID;
    private String completionStatus;
    private String startDate;
    private String endDate;
    private double score;
    private String feedback;

    public Progress(int id, String studentID, int courseID, int lessonID, String completionStatus, String startDate, String endDate, double score, String feedback) {
        this.id = id;
        this.studentID = studentID;
        this.courseID = courseID;
        this.lessonID = lessonID;
        this.completionStatus = completionStatus;
        this.startDate = startDate;
        this.endDate = endDate;
        this.score = score;
        this.feedback = feedback;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public int getLessonID() {
        return lessonID;
    }

    public void setLessonID(int lessonID) {
        this.lessonID = lessonID;
    }

    public String getCompletionStatus() {
        return completionStatus;
    }

    public void setCompletionStatus(String completionStatus) {
        this.completionStatus = completionStatus;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    @Override
    public String toString() {
        return "Progress{" + "id=" + id + ", studentID=" + studentID + ", courseID=" + courseID + ", lessonID=" + lessonID + ", completionStatus=" + completionStatus + ", startDate=" + startDate + ", endDate=" + endDate + ", score=" + score + ", feedback=" + feedback + '}';
    }

}
