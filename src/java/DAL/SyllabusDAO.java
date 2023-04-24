/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Syllabus;

/**
 *
 * @author phanh
 */
public class SyllabusDAO extends DBContext {

    public void update(Syllabus s) {
        try {

            String sql = "UPDATE `syllabus` SET \n"
                    + "`subjectCode` = ?,\n"
                    + "`decisionNo` = ?,\n"
                    + "`slbName_EN` = ?,\n"
                    + "`slbName_VI` = ?,\n"
                    + "`degreeLevel` = ?,\n"
                    + "`timeAllocation` = ?,\n"
                    + "`description` = ?,\n"
                    + "`studentTask` = ?,\n"
                    + "`tool` = ?,\n"
                    + "`isApproved` = ?,\n"
                    + "`isActive` = ?,\n"
                    + "`note` = ?,\n"
                    + "`MinAvgMarkToPass` = ?\n"
                    + "WHERE `slbid` = ?;";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, s.getSubjectCode());
            st.setString(2, s.getDecision()==null ? null :s.getDecision().getDecisionNo());
            st.setString(3, s.getSlbName_EN());
            st.setString(4, s.getSlbName_VI());
            st.setString(5, s.getDegreeLevel());
            st.setString(6, s.getTimeAllocation());
            st.setString(7, s.getDescription());
            st.setString(8, s.getStudentTask());
            st.setString(9, s.getTool());
            st.setBoolean(10, s.isIsApproved());
            st.setBoolean(11, s.isIsActive());
            st.setString(12, s.getNote());
            st.setInt(13, s.getMinAvgMarkToPass());
            st.setInt(14, s.getSlbid());

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("SyllabusDAO -> update(): " + e);
        }
    }

    public void add(Syllabus s) {
        try {

            String sql = "INSERT INTO `syllabus`\n"
                    + "(`accountID`, `subjectCode`, `decisionNo`, `slbName_EN`, `slbName_VI`, `degreeLevel`, `timeAllocation`, `description`,\n"
                    + "`studentTask`, `tool`, `isApproved`, `isActive`, `approvedDate`, `note`, `MinAvgMarkToPass`)\n"
                    + "VALUES\n"
                    + "(?,\n"
                    + "?,\n"
                    + "?,\n"
                    + "?,\n"
                    + "?,\n"
                    + "?,\n"
                    + "?,\n"
                    + "?,\n"
                    + "?,\n"
                    + "?,\n"
                    + "?,\n"
                    + "?,\n"
                    + "?,\n"
                    + "?,\n"
                    + "?);";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, s.getAccountID());
            st.setString(2, s.getSubjectCode());
            st.setString(3, s.getDecision()==null? null :s.getDecision().getDecisionNo());
            st.setString(4, s.getSlbName_EN());
            st.setString(5, s.getSlbName_VI());
            st.setString(6, s.getDegreeLevel());
            st.setString(7, s.getTimeAllocation());
            st.setString(8, s.getDescription());
            st.setString(9, s.getStudentTask());
            st.setString(10, s.getTool());
            st.setBoolean(11, s.isIsApproved());
            st.setBoolean(12, s.isIsActive());
            st.setDate(13, s.getApprovedDate());

            st.setString(14, s.getNote());
            st.setInt(15, s.getMinAvgMarkToPass());

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("SyllabusDAO -> add(): " + e);
        }
    }
    
     public void deleteSyllabus(int id) {
        try {

            String sql = "DELETE from syllabus where slbid = ?";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.execute();
        } catch (SQLException e) {
            System.out.println(" AccountDAO -> deleteUser(): " + e);

        }
    }
     public boolean checkNameEn(String en){
        boolean check = false;
        try {

            String sql = "SELECT * FROM swp391_bl5_g6.syllabus where slbName_EN = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, en);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                check = true;
            }
        } catch (SQLException e) {
            System.out.println(" AccountDAO -> deleteUser(): " + e);
        }
        return check;
     }
     public boolean checkNameVi(String vi){
        boolean check = false;
        try {

            String sql = "SELECT * FROM swp391_bl5_g6.syllabus where slbName_VI = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, vi);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                check = true;
            }
        } catch (SQLException e) {
            System.out.println(" AccountDAO -> deleteUser(): " + e);
        }
        return check;
     }

}
