/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author sinan
 */
public class ScheduleLog {
    private int staffID;
    private int WorkSessionID;
    private int dateId;
    public ScheduleLog(int staffID, int WorkSessionID) {
        this.staffID = staffID;
        this.WorkSessionID = WorkSessionID;
    }

    public int getStaffID() {
        return staffID;
    }

    public void setStaffID(int staffID) {
        this.staffID = staffID;
    }

    public int getWorkSessionID() {
        return WorkSessionID;
    }

    public void setWorkSessionID(int WorkSessionID) {
        this.WorkSessionID = WorkSessionID;
    }

    public int getDateId() {
        return dateId;
    }

    public void setDateId(int dateId) {
        this.dateId = dateId;
    }
    
    
}
