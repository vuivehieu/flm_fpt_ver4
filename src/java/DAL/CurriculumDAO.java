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
import model.Combo;
import model.Curriculum;
import model.Elective;
import model.PLO;
import model.PO;
import model.PaginationModel;
import model.Subject;
import model.SubjectDto;

/**
 *
 * @author PCM
 */
public class CurriculumDAO extends DBContext {

    public List<Curriculum> findAllCurriculum() {
        List<Curriculum> curriculums = new ArrayList<>();
        try {
            String sql = "SELECT *"
                    + "from curriculum c;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Curriculum curriculum = new Curriculum();
                curriculum.setCurid(rs.getInt("curid"));
                curriculum.setCurCode(rs.getString("curCode"));
                curriculum.setCurName_EN(rs.getString("curName_EN"));
                curriculum.setCurName_VI(rs.getString("curName_VI"));
                curriculum.setDescription(rs.getString("description"));
                curriculum.setIsActive(rs.getBoolean("isActive"));
                curriculum.setIsApproved(rs.getBoolean("isApproved"));
                curriculums.add(curriculum);
            }
        } catch (SQLException e) {
            System.out.println("CurriculumDAO -> findAllCurriculum(): " + e);
        }
        return curriculums;
    }

    public void UpdateCurriculum(Curriculum curriculum) {
        try {
            String sql = "UPDATE `swp391_bl5_g6`.`curriculum`\n"
                    + "SET\n"
                    + "`curName_EN` = ?,\n"
                    + "`curName_VI` = ?,\n"
                    + "`description` = ?\n"
                    + "WHERE `curid` = ?;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, curriculum.getCurName_EN());
            ps.setString(2, curriculum.getCurName_VI());
            ps.setString(3, curriculum.getDescription());
            ps.setInt(4, curriculum.getCurid());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("CurriculumDAO -> UpdateCurriculum(): " + e);
        }
    }

    public List<Curriculum> findAllCurriculumByPage(PaginationModel pagination) {
        List<Curriculum> curriculums = new ArrayList<>();
        try {
            String sql = "SELECT *"
                    + "from curriculum c ";
            if (!pagination.getSearch().equals("")) {
                sql += "WHERE (c.curCode LIKE ? OR c.curName_EN LIKE ? OR c.curName_VI LIKE ? OR c.description LIKE ?)";
            }
            sql += " ORDER BY c.curid DESC LIMIT " + (pagination.getPageNo() - 1) * pagination.getPageSize() + "," + pagination.getPageSize() + ";";
            PreparedStatement st = connection.prepareStatement(sql);
            int i = 1;
            if (!pagination.getSearch().equals("")) {
                st.setString(i++, "%" + pagination.getSearch() + "%");
                st.setString(i++, "%" + pagination.getSearch() + "%");
                st.setString(i++, "%" + pagination.getSearch() + "%");
                st.setString(i++, "%" + pagination.getSearch() + "%");
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Curriculum curriculum = new Curriculum();
                curriculum.setCurid(rs.getInt("curid"));
                curriculum.setImage(rs.getString("image"));
                curriculum.setCurCode(rs.getString("curCode"));
                curriculum.setCurName_EN(rs.getString("curName_EN"));
                curriculum.setCurName_VI(rs.getString("curName_VI"));
                curriculum.setDescription(rs.getString("description"));
                curriculum.setIsActive(rs.getBoolean("isActive"));
                curriculum.setIsApproved(rs.getBoolean("isApproved"));
                curriculums.add(curriculum);
            }
        } catch (SQLException e) {
            System.out.println("CurriculumDAO -> findAllCurriculumByPage(): " + e);
        }
        return curriculums;
    }

    public List<Curriculum> findAllNotApprovedCurriculumByPage(PaginationModel pagination) {
        List<Curriculum> curriculums = new ArrayList<>();
        try {
            String sql = "SELECT *"
                    + "from curriculum c Where c.isApproved = 0 ";
            if (!pagination.getSearch().equals("")) {
                sql += "AND (c.curCode LIKE ? OR c.curName_EN LIKE ? OR c.curName_VI LIKE ? OR c.description LIKE ?)";
            }
            sql += "ORDER BY c.curid DESC LIMIT " + (pagination.getPageNo() - 1) * pagination.getPageSize() + "," + pagination.getPageSize() + ";";
            PreparedStatement st = connection.prepareStatement(sql);
            int i = 1;
            if (!pagination.getSearch().equals("")) {
                st.setString(i++, "%" + pagination.getSearch() + "%");
                st.setString(i++, "%" + pagination.getSearch() + "%");
                st.setString(i++, "%" + pagination.getSearch() + "%");
                st.setString(i++, "%" + pagination.getSearch() + "%");
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Curriculum curriculum = new Curriculum();
                curriculum.setCurid(rs.getInt("curid"));
                curriculum.setImage(rs.getString("image"));
                curriculum.setCurCode(rs.getString("curCode"));
                curriculum.setCurName_EN(rs.getString("curName_EN"));
                curriculum.setCurName_VI(rs.getString("curName_VI"));
                curriculum.setDescription(rs.getString("description"));
                curriculum.setIsActive(rs.getBoolean("isActive"));
                curriculum.setIsApproved(rs.getBoolean("isApproved"));
                curriculum.setPo(this.getAllPoByCurriculumID(rs.getInt("curid")));
                curriculum.setPlo(this.getAllPloByCurriculumID(rs.getInt("curid")));
                curriculum.setSubject(this.getAllSubjectByCurriculumID(rs.getInt("curid")));
                curriculum.setCombo(this.getAllComboByCurriculumID(rs.getInt("curid")));
                curriculum.setElective(this.getAllElectiveByCurriculumID(rs.getInt("curid")));
                curriculums.add(curriculum);
            }
        } catch (SQLException e) {
            System.out.println("CurriculumDAO -> findAllCurriculumByPage(): " + e);
        }
        return curriculums;
    }

    public int countAllCurriculum(PaginationModel pagination) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) as count "
                    + "from curriculum c ";
            if (!pagination.getSearch().equals("")) {
                sql += "WHERE (c.curCode LIKE ? OR c.curName_EN LIKE ? OR c.curName_VI LIKE ? OR c.description LIKE ?)";
            }
            PreparedStatement st = connection.prepareStatement(sql);
            int i = 1;
            if (!pagination.getSearch().equals("")) {
                st.setString(i++, "%" + pagination.getSearch() + "%");
                st.setString(i++, "%" + pagination.getSearch() + "%");
                st.setString(i++, "%" + pagination.getSearch() + "%");
                st.setString(i++, "%" + pagination.getSearch() + "%");
            }
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count");
            }
        } catch (SQLException e) {
            System.out.println("CurriculumDAO -> countAllCurriculum(): " + e);
        }
        return (int) Math.ceil((double) count / pagination.getPageSize());
    }

    public int countAllNotApprovedCurriculum(PaginationModel pagination) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) as count "
                    + "from curriculum c WHERE c.isApproved = 0 ";
            if (!pagination.getSearch().equals("")) {
                sql += "AND (c.curCode LIKE ? OR c.curName_EN LIKE ? OR c.curName_VI LIKE ? OR c.description LIKE ?)";
            }
            PreparedStatement st = connection.prepareStatement(sql);
            int i = 1;
            if (!pagination.getSearch().equals("")) {
                st.setString(i++, "%" + pagination.getSearch() + "%");
                st.setString(i++, "%" + pagination.getSearch() + "%");
                st.setString(i++, "%" + pagination.getSearch() + "%");
                st.setString(i++, "%" + pagination.getSearch() + "%");
            }
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count");
            }
        } catch (SQLException e) {
            System.out.println("CurriculumDAO -> countAllCurriculum(): " + e);
        }
        return (int) Math.ceil((double) count / pagination.getPageSize());
    }

    public void addCurriculum(Curriculum curriculum) {
        try {
            String sql = "INSERT INTO `swp391_bl5_g6`.`curriculum`\n"
                    + "(`curid`,\n"
                    + "`curCode`,\n"
                    + "`majorID`,\n"
                    + "`decisionNo`,\n"
                    + "`curName_EN`,\n"
                    + "`curName_VI`,\n"
                    + "`description`,\n"
                    + "`isApproved`,\n"
                    + "`isActive`,\n"
                    + "`image`)\n"
                    + "VALUES\n"
                    + "(null,\n"
                    + "?,\n"
                    + "?,\n"
                    + "?,\n"
                    + "?,\n"
                    + "?,\n"
                    + "?,\n"
                    + "?,\n"
                    + "?,\n"
                    + "?);";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, curriculum.getCurCode());
            ps.setInt(2, curriculum.getMajor().getMajorID());
            ps.setString(3, curriculum.getDecision().getDecisionNo());
            ps.setString(4, curriculum.getCurName_EN());
            ps.setString(5, curriculum.getCurName_VI());
            ps.setString(6, curriculum.getDescription());
            ps.setBoolean(7, curriculum.isIsApproved());
            ps.setBoolean(8, curriculum.isIsActive());
            ps.setString(9, curriculum.getImage());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("CurriculumDAO -> UpdateCurriculum(): " + e);
        }
    }

    public List<PO> getAllPoByCurriculumID(int id) {
        List<PO> pos = new ArrayList<>();
        try {
            String sql = "SELECT * FROM swp391_bl5_g6.po_curriculum pc inner join po p on pc.poid = p.poid Where pc.curid = ?;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                PO po = new PO();
                po.setIsActive(rs.getBoolean("isActive"));
                po.setPoName(rs.getString("poName"));
                po.setPoDescription(rs.getString("poDescription"));
                po.setPoid(rs.getInt("poid"));
                pos.add(po);
            }
        } catch (SQLException e) {
            System.out.println("CurriculumDAO -> getAllPoByCurriculumID(): " + e);
        }
        return pos;
    }

    public List<PLO> getAllPloByCurriculumID(int id) {
        List<PLO> plos = new ArrayList<>();
        try {
            String sql = "SELECT * FROM swp391_bl5_g6.plo_curriculum pc inner join plo p on pc.ploid = p.ploid Where pc.curid = ?;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                PLO plo = new PLO();
                plo.setIsActive(rs.getBoolean("isActive"));
                plo.setPloName(rs.getString("ploName"));
                plo.setPloDescription(rs.getString("ploDescription"));
                plo.setPloid(rs.getInt("ploid"));
                plos.add(plo);
            }
        } catch (SQLException e) {
            System.out.println("CurriculumDAO -> getAllPoByCurriculumID(): " + e);
        }
        return plos;
    }

    public List<SubjectDto> getAllSubjectDtoByCurriculumID(int id) {
        List<SubjectDto> subjects = new ArrayList<>();
        try {
            String sql = "SELECT \n"
                    + "    *\n"
                    + "FROM\n"
                    + "    subject\n"
                    + "        LEFT JOIN\n"
                    + "    curriculum_subject ON subject.subjectCode = curriculum_subject.subjectCode\n"
                    + "        LEFT JOIN\n"
                    + "    prerequisite ON subject.subjectCode = prerequisite.subjectCode\n"
                    + "WHERE\n"
                    + "    curriculum_subject.curid = ?\n"
                    + "GROUP BY subject.subjectCode;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SubjectDto subject = new SubjectDto();
                subject.setComboName(rs.getString("comboName"));
                subject.setElectiveName(rs.getString("electiveName"));
                subject.setNoCredit(rs.getInt("noCredit"));
                subject.setSubjectCode(rs.getString("subjectCode"));
                subject.setSubjectName_VI(rs.getString("subjectName_Vi"));
                subject.setSubjectName_EN(rs.getString("subjectName_En"));
                subject.setNote(rs.getString("note"));
                subject.setSemester(rs.getString("semester"));
                subject.setIsActive(rs.getBoolean("isActive"));
                subject.setPreRequiste(rs.getString("preReqCode"));
                subjects.add(subject);
            }
        } catch (SQLException e) {
            System.out.println("CurriculumDAO -> getAllSubjectDtoByCurriculumID(): " + e);
        }
        return subjects;
    }

    public List<Subject> getAllSubjectByCurriculumID(int id) {
        List<Subject> subjects = new ArrayList<>();
        try {
            String sql = "SELECT DISTINCT *\n"
                    + "FROM subject\n"
                    + "JOIN curriculum_subject ON subject.subjectCode = curriculum_subject.subjectCode\n"
                    + " where curriculum_subject.curid = ?;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject();
                subject.setComboName(rs.getString("comboName"));
                subject.setElectiveName(rs.getString("electiveName"));
                subject.setNoCredit(rs.getInt("noCredit"));
                subject.setSubjectCode(rs.getString("subjectCode"));
                subject.setSubjectName_VI(rs.getString("subjectName_Vi"));
                subject.setSubjectName_EN(rs.getString("subjectName_En"));
                subject.setNote(rs.getString("note"));
                subject.setSemester(rs.getString("semester"));
                subject.setIsActive(rs.getBoolean("isActive"));
                subjects.add(subject);
            }
        } catch (SQLException e) {
            System.out.println("CurriculumDAO -> getAllSubjectByCurriculumID(): " + e);
        }
        return subjects;
    }

    public List<Combo> getAllComboByCurriculumID(int id) {
        List<Combo> combos = new ArrayList<>();
        try {
            String sql = "SELECT * FROM swp391_bl5_g6.curriculum_combo cs inner join combo s on cs.cid = s.cid where cs.curid = ?;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Combo combo = new Combo();
                combo.setTag(rs.getString("tag"));
                combo.setNote(rs.getString("note"));
                combo.setComboName_EN(rs.getString("comboName_En"));
                combo.setComboName_VI(rs.getString("comboName_Vi"));
                combo.setIsActive(rs.getBoolean("isActive"));
                combos.add(combo);
            }
        } catch (SQLException e) {
            System.out.println("CurriculumDAO -> getAllComboByCurriculumID(): " + e);
        }
        return combos;
    }

    public List<Elective> getAllElectiveByCurriculumID(int id) {
        List<Elective> electives = new ArrayList<>();
        try {
            String sql = "SELECT * FROM swp391_bl5_g6.curriculum_elective cs inner join elective s on cs.eid = s.eid where cs.curid = ?;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Elective elective = new Elective();
                elective.setEname(rs.getString("ename"));
                elective.setTag(rs.getString("tag"));
                elective.setNote(rs.getString("note"));
                elective.setSubjectName_VI(rs.getString("subjectName_VI"));
                elective.setSubjectName_EN(rs.getString("subjectName_EN"));
                elective.setIsActive(rs.getBoolean("isActive"));
                electives.add(elective);
            }
        } catch (SQLException e) {
            System.out.println("CurriculumDAO -> getAllComboByCurriculumID(): " + e);
        }
        return electives;
    }

}
