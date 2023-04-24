/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.PLO;

public class PLODAO extends DBContext {

    public void add(String name, String description, boolean isActive) {
        try {

            String sql = "INSERT INTO `swp391_bl5_g6`.`plo` (`ploName`,`ploDescription`,`isActive`)\n"
                    + "VALUES (?, ?, ?);";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, description);
            st.setBoolean(3, isActive);

            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println("PLODAO -> add(): " + e);
        }
    }

    public int insert(String name, String description, boolean isActive) {
        int id = 0;
        try {

            String sql = "INSERT INTO `swp391_bl5_g6`.`plo` (`ploName`,`ploDescription`,`isActive`)\n"
                    + "VALUES (?, ?, ?);";

            PreparedStatement st = connection.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            st.setString(1, name);
            st.setString(2, description);
            st.setBoolean(3, isActive);

            st.executeUpdate();

            ResultSet rs = st.getGeneratedKeys();
            if (rs.next()) {
                id = rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println("PLODAO -> add(): " + e);
        }
        return id;
    }

    public void addConstraint(int curid, int ploid) {
        try {

            String sql = "INSERT INTO `swp391_bl5_g6`.`plo_curriculum`\n"
                    + "(`curid`,\n"
                    + "`ploid`)\n"
                    + "VALUES\n"
                    + "(?,\n"
                    + "?);";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, curid);
            st.setInt(2, ploid);

            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println("PLODAO -> addConstraint(): " + e);
        }
    }

    public void update(String name, String description, boolean isActive, int ploid) {
        try {

            String sql = "UPDATE `swp391_bl5_g6`.`plo` SET\n"
                    + "`ploName` = ?,\n"
                    + "`ploDescription` = ?,\n"
                    + "`isActive` = ?\n"
                    + "WHERE `ploid` = ?;";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, description);
            st.setBoolean(3, isActive);
            st.setInt(4, ploid);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println("PLODAO -> update(): " + e);
        }
    }

    public boolean checkExist(String name, String oldName) {
        try {

            String sql = "SELECT `plo`.`ploName` FROM `plo` WHERE `plo`.`ploName` like ? and `plo`.`ploName` not in (SELECT `plo`.`ploName` FROM `plo` WHERE `plo`.`ploName` like ?);";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            st.setString(2, "%" + oldName + "%");

            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return true;
            }

        } catch (SQLException e) {
            System.out.println("PLODAO -> checkExist(): " + e);
        }
        return false;
    }
}
