/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Lesson {
      private int id;
    private int courseID;
    private String skill;
    private String title;
    private String description;
    private String content;
    private String mediaUrl;
    private int duration;
    private int lessonOrder;
    private boolean isActive;

    public Lesson(int id, int courseID, String skill, String title, String description, String content, String mediaUrl, int duration, int lessonOrder, boolean isActive) {
        this.id = id;
        this.courseID = courseID;
        this.skill = skill;
        this.title = title;
        this.description = description;
        this.content = content;
        this.mediaUrl = mediaUrl;
        this.duration = duration;
        this.lessonOrder = lessonOrder;
        this.isActive = isActive;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        this.skill = skill;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getMediaUrl() {
        return mediaUrl;
    }

    public void setMediaUrl(String mediaUrl) {
        this.mediaUrl = mediaUrl;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public int getLessonOrder() {
        return lessonOrder;
    }

    public void setLessonOrder(int lessonOrder) {
        this.lessonOrder = lessonOrder;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    @Override
    public String toString() {
        return "Lesson{" + "id=" + id + ", courseID=" + courseID + ", skill=" + skill + ", title=" + title + ", description=" + description + ", content=" + content + ", mediaUrl=" + mediaUrl + ", duration=" + duration + ", lessonOrder=" + lessonOrder + ", isActive=" + isActive + '}';
    }
}
