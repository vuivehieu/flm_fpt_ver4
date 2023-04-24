/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author phanh
 */
public class Decision {
    private String decisionNo;
    private String decisionName;
    private Date approvedDate;
    private String note;
    private Date createDate;
    private String fileName;
    private Boolean isActive;

    public Decision() {
    }

    public Decision(String decisionNo, String decisionName, Date approvedDate, String note, Date createDate, String fileName, Boolean isActive) {
        this.decisionNo = decisionNo;
        this.decisionName = decisionName;
        this.approvedDate = approvedDate;
        this.note = note;
        this.createDate = createDate;
        this.fileName = fileName;
        this.isActive = isActive;
    }
    
    

    public String getDecisionNo() {
        return decisionNo;
    }

    public void setDecisionNo(String decisionNo) {
        this.decisionNo = decisionNo;
    }

    public String getDecisionName() {
        return decisionName;
    }

    public void setDecisionName(String decisionName) {
        this.decisionName = decisionName;
    }

    public Date getApprovedDate() {
        return approvedDate;
    }

    public void setApprovedDate(Date approvedDate) {
        this.approvedDate = approvedDate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

    

    
    
    
}
