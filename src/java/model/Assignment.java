/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Assignment {
     private int id;
    private int courseID;
    private String title;
    private String description;
    private String dueDate;
    private boolean isActive;

    public Assignment(int id, int courseID, String title, String description, String dueDate, boolean isActive) {
        this.id = id;
        this.courseID = courseID;
        this.title = title;
        this.description = description;
        this.dueDate = dueDate;
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

    public String getDueDate() {
        return dueDate;
    }

    public void setDueDate(String dueDate) {
        this.dueDate = dueDate;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    @Override
    public String toString() {
        return "Assignment{" + "id=" + id + ", courseID=" + courseID + ", title=" + title + ", description=" + description + ", dueDate=" + dueDate + ", isActive=" + isActive + '}';
    }
    
}
