/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package admin.curriculum;

import DAL.CurriculumDAO;
import DAL.DAO;
import DAL.DecisionDAO;
import DAL.MajorDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.PaginationModel;

/**
 *
 * @author PCM
 */
@WebServlet(name = "CurriculumPoListController", urlPatterns = {"/curriculumCheck-po"})
public class CurriculumPoListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int curid = Integer.parseInt(request.getParameter("curid"));
        CurriculumDAO curriculumDAO = new CurriculumDAO();
        DAO dao = new DAO();
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("userRole")) {
                    if (Integer.parseInt(cookie.getValue()) != 6 && Integer.parseInt(cookie.getValue()) != 5 && Integer.parseInt(cookie.getValue()) != 7) {
                        response.sendRedirect("home");
                        return;
                    }
                }
            }
        }
        request.setAttribute("curriculum", dao.getCurriculumByCurid(curid));
        request.setAttribute("poList", curriculumDAO.getAllPoByCurriculumID(curid));
        request.getRequestDispatcher("gui/admin/curriculum/list-po.jsp").forward(request, response);
    }

}

