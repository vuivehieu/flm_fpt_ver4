/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Decision;
import model.PaginationModel;
import model.Role;

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

    public List<Decision> getAllDecisionByPageAndFilter(PaginationModel pagination) {

        List<Decision> list = new ArrayList<>();
        try {
            String sql = "Select * from decision WHERE decision.isDelete=0\n";
            if (pagination.getFilterStatus() != 3 || !pagination.getSearch().equals("")) {
                sql += " AND";
                if (pagination.getFilterStatus() != 3) {
                    sql += " decision.isActive = ?";
                }
                if (!pagination.getSearch().equals("")) {
                    if (pagination.getFilterStatus() != 3) {
                        sql += " AND";
                    }
                    sql += " (decision.decisionNo LIKE ? OR decision.decisionName LIKE ? OR decision.note LIKE ?)";
                }
            }
            sql += " LIMIT " + (pagination.getPageNo() - 1) * pagination.getPageSize() + "," + pagination.getPageSize() + ";";
            PreparedStatement st = connection.prepareStatement(sql);
            int i = 1;
            if (pagination.getFilterStatus() != 3) {
                st.setBoolean(i++, pagination.getFilterStatus() == 1);
            }
            if (!pagination.getSearch().equals("")) {
                st.setString(i++, "%" + pagination.getSearch() + "%");
                st.setString(i++, "%" + pagination.getSearch() + "%");
                st.setString(i++, "%" + pagination.getSearch() + "%");
            }
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Decision decision = new Decision();
                decision.setDecisionNo(rs.getString("decisionNo"));
                decision.setApprovedDate(rs.getDate("approveDate"));
                decision.setNote(rs.getString("note"));
                decision.setIsActive(rs.getBoolean("isActive"));
                decision.setDecisionName(rs.getString("decisionName"));
                list.add(decision);
            }

        } catch (SQLException e) {
            System.out.println("DecisionDAO -> getAllDecisionByPageAndFilter(): " + e);

        }
        return list;
    }

    public int countAllDecisionByPageAndFilter(PaginationModel pagination) {

        int count = 0;
        try {
            String sql = "Select COUNT(*) as count from decision WHERE decision.isDelete=0\n";
            if (pagination.getFilterStatus() != 3 || !pagination.getSearch().equals("")) {
                sql += " AND";
                if (pagination.getFilterStatus() != 3) {
                    sql += " decision.isActive = ?";
                }
                if (!pagination.getSearch().equals("")) {
                    if (pagination.getFilterStatus() != 3) {
                        sql += " AND";
                    }
                    sql += " (decision.decisionNo LIKE ? OR decision.decisionName LIKE ? OR decision.note LIKE ?)";
                }
            }
            sql += ";";
            PreparedStatement st = connection.prepareStatement(sql);
            int i = 1;
            if (pagination.getFilterStatus() != 3) {
                st.setBoolean(i++, pagination.getFilterStatus() == 1);
            }
            if (!pagination.getSearch().equals("")) {
                st.setString(i++, "%" + pagination.getSearch() + "%");
                st.setString(i++, "%" + pagination.getSearch() + "%");
                st.setString(i++, "%" + pagination.getSearch() + "%");
            }
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count");
            }

        } catch (SQLException e) {
            System.out.println("DecisionDAO -> countAllDecisionByPageAndFilter(): " + e);

        }
        return (int) Math.ceil((double) count / pagination.getPageSize());
    }

    public void softDeleteDecision(String id) {
           try {

            String sql = "UPDATE `swp391_bl5_g6`.`decision` SET\n"
                    + "`isDelete` = 1\n"
                    + "WHERE `decisionNo` = ?;";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("DecisionDAO -> softDeleteDecision(): " + e);
        }
    }

    public void add(Decision dec) {
        try {

            String sql = "INSERT INTO `decision` (`decisionNo`, `decisionName`, `approveDate`, `note`, `createDate`, `isActive`, `fileName`)\n"
                    + "VALUES (?, ?, ?, ?, ?, ?, ?);";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, dec.getDecisionNo());
            st.setString(2, dec.getDecisionName());
            st.setDate(3, dec.getIsActive() ? new java.sql.Date(new Date().getTime()) : null);
            st.setString(4, dec.getNote());
            st.setDate(5, new java.sql.Date(new Date().getTime()));
            st.setBoolean(6, dec.getIsActive());
            st.setString(7, dec.getFileName());

            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println("DecisionDAO -> add(): " + e);
        }
    }

    public boolean checkNo(String decNo) {
        boolean check = false;
        try {

            String sql = "Select Count(*) as count from decision where decision.decisionNo = ? and decision.isDelete = 0;";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, decNo);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                check = rs.getInt("count") > 0;
            }

        } catch (SQLException e) {
            System.out.println("DecisionDAO -> add(): " + e);
        }
        return check;
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
