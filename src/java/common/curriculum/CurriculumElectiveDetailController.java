/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package common.curriculum;

import DAL.CurriculumDAO;
import DAL.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import model.Curriculum;
import model.Subject_Mapping_PLO;

/**
 *
 * @author PCM
 */
@WebServlet(name = "CurriculumElectiveDetailController", urlPatterns = {"/electiveDetailView"})
public class CurriculumElectiveDetailController extends HttpServlet{
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CurriculumDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CurriculumDetailController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO dao = new DAO();
        CurriculumDAO curriculumDAO = new CurriculumDAO();
        String curid_raw = request.getParameter("id");

        try {
            int curid = Integer.parseInt(curid_raw);
            Curriculum cur = dao.getCurriculumByCurid(curid);
            request.setAttribute("curCode", cur.getCurCode());
            request.setAttribute("curid", cur.getCurid());
            request.setAttribute("list", curriculumDAO.getAllElectiveByCurriculumID(curid));

        } catch (NumberFormatException e) {
            System.out.println("common.curriculum -> CurriculumPoDetailController -> doGet(): " + e);
        }

        request.getRequestDispatcher("gui/common/curriculum/elective-detail.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
