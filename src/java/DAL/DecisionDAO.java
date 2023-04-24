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
import model.Decision;

/**
 *
 * @author phanh
 */
public class DecisionDAO extends DBContext {
    
    public List<Decision> findAll() {
        List<Decision> list = new ArrayList<>();
        try {

            String sql = "Select * from decision;";

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Decision decision = new Decision();
                decision.setDecisionNo(rs.getString("decisionNo"));
                decision.setDecisionName(rs.getString("decisionName"));
                list.add(decision);
            }

        } catch (SQLException e) {
            System.out.println("DecisionDAO -> findAll(): " + e);
        }
        return list;
    }
    
    public void add(Decision dec) {
        try {

            String sql = "INSERT INTO `decision` (`decisionNo`, `decisionName`, `approveDate`, `note`, `createDate`, `isActive`, `fileName`)\n"
                    + "VALUES (?, ?, ?, ?, ?, ?, ?);";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, dec.getDecisionNo());
            st.setString(2, dec.getDecisionName());
            st.setDate(3, dec.getApprovedDate());
            st.setString(4, dec.getNote());
            st.setDate(5, dec.getCreateDate());
            st.setBoolean(6, dec.getIsActive());
            st.setString(7, dec.getFileName());

            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println("DecisionDAO -> add(): " + e);
        }
    }

    public void update(Decision dec) {
        try {

            String sql = "UPDATE `swp391_bl5_g6`.`decision` SET\n"
                    + "`decisionName` = ?,\n"
                    + "`approveDate` = ?,\n"
                    + "`note` = ?,\n"
                    + "`isActive` = ?,\n"
                    + "`fileName` = ?\n"
                    + "WHERE `decisionNo` = ?;";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, dec.getDecisionName());
            st.setDate(2, dec.getApprovedDate());
            st.setString(3, dec.getNote());
            st.setBoolean(4, dec.getIsActive());
            st.setString(5, dec.getFileName());
            st.setString(6, dec.getDecisionNo());

            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println("DecisionDAO -> update(): " + e);
        }
    }

    public boolean checkExits(String decisionNo) {
        try {
            String sql = "SELECT `decision`.`decisionNo` FROM `decision` WHERE `decisionNo` = ?;";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, decisionNo);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return true;
            }

        } catch (SQLException e) {
            System.out.println("DecisionDAO -> checkExits(): " + e);
        }
        return false;
    }

}
