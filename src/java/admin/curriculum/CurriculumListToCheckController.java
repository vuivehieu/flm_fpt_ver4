/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package admin.curriculum;

import DAL.CurriculumDAO;
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
@WebServlet(name = "CurriculumListToCheckController", urlPatterns = {"/curriculumCheck"})
public class CurriculumListToCheckController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageNo = 1;
        int pageSize = 5;
        String search = "";

        if (request.getParameter("pageNo") != null) {
            if (Integer.parseInt(request.getParameter("pageNo")) != 0) {
                pageNo = Integer.parseInt(request.getParameter("pageNo"));
            }
        }
        if (request.getParameter("search") != null) {
            if (!request.getParameter("search").equals("")) {
                search = request.getParameter("search");
            }
        }
        PaginationModel paginationModel = new PaginationModel(pageNo, pageSize, search);
        CurriculumDAO curriculumDAO = new CurriculumDAO();
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
        request.setAttribute("totalPages", curriculumDAO.countAllNotApprovedCurriculum(paginationModel));
        request.setAttribute("search", paginationModel.getSearch());
        request.setAttribute("pagination", paginationModel);
        request.setAttribute("curriculums", curriculumDAO.findAllNotApprovedCurriculumByPage(paginationModel));
        request.getRequestDispatcher("gui/admin/curriculum/list-to-check.jsp").forward(request, response);
    }

}

