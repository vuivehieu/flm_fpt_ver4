/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package admin.curriculum;

import DAL.CurriculumDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import model.Curriculum;
import model.Decision;
import model.Major;

/**
 *
 * @author PCM
 */
@WebServlet(name = "CurriculumAddController", urlPatterns = {"/add-curriculum"})
public class CurriculumAddController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("gui/admin/curriculum/add.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        CurriculumDAO dao = new CurriculumDAO();
        Curriculum curriculum = new Curriculum();
        String code = request.getParameter("inputCode");
        String nameEn = request.getParameter("inputNameEn");
        String nameVi = request.getParameter("inputNameVi");
        String description = request.getParameter("inputDescription");
        if (dao.checkNo(code)) {
            request.setAttribute("errorMessage", "Curriculum code already exist!!!");
            request.getRequestDispatcher("gui/admin/curriculum/add.jsp").forward(request, response);
        } else {
            curriculum.setCurName_EN(nameEn);
            curriculum.setCurName_VI(nameVi);
            curriculum.setDescription(description);
            curriculum.setCurCode(code);
//        curriculum.setDecision(new Decision(decision, null, null, null, null, null, null));
//        curriculum.setMajor(new Major(major, null, null, null, null));
            curriculum.setIsActive(true);
            curriculum.setIsApproved(false);
            curriculum.setImage("images/ev-bg.jpg");
            dao.addCurriculum(curriculum);
            response.sendRedirect(request.getContextPath() + "/curriculumList?message=" + URLEncoder.encode("Add new curriculum successfully", "UTF-8"));
        }
//        int major = Integer.parseInt(request.getParameter("inputMajor"));
//        String decision = request.getParameter("inputDecision");

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
