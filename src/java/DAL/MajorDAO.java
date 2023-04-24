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
import model.Major;

/**
 *
 * @author PCM
 */
public class MajorDAO extends DBContext {
    
    public List<Major> findAll() {
        List<Major> list = new ArrayList<>();
        try {

            String sql = "Select * from major;";

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Major major = new Major();
                major.setMajorID(rs.getInt("majorId"));
                major.setMajorName_VI(rs.getString("majorName_Vi"));
                list.add(major);
            }

        } catch (SQLException e) {
            System.out.println("MajorDAO -> findAll(): " + e);
        }
        return list;
    }
}
