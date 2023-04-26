/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package admin.curriculum;

import DAL.AccountDAO;
import DAL.CurriculumDAO;
import DAL.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Account;
import model.Curriculum;

/**
 *
 * @author PCM
 */
@WebServlet(name = "CurriculumUpdateController", urlPatterns = {"/update-curriculum"})
public class CurriculumUpdateController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("curriculum", new DAO().getCurriculumByCurid(Integer.parseInt(request.getParameter("id"))));
        request.setAttribute("decisions", new DAO().getAllDecision());
        request.getRequestDispatcher("gui/admin/curriculum/edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        CurriculumDAO dao = new CurriculumDAO();
        Curriculum curriculum = new Curriculum();
        String nameEn = request.getParameter("updateNameEn");
        String nameVi = request.getParameter("updateNameVi");
        String description = request.getParameter("updateDescription");
        int id = Integer.parseInt(request.getParameter("updateId"));
        curriculum.setCurName_EN(nameEn);
        curriculum.setCurName_VI(nameVi);
        curriculum.setDescription(description);
        curriculum.setCurid(id);
        dao.UpdateCurriculum(curriculum);
        response.sendRedirect(request.getContextPath() + "/curriculumList");
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
