/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package common.syllabus;

import DAL.DAO;
import DAL.DecisionDAO;
import DAL.RoleDAO;
import DAL.SyllabusDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import model.Account;
import model.Decision;
import model.Role;
import model.Syllabus;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "EditSyllabusController", urlPatterns = {"/syllabusEdit"})
public class EditSyllabusController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SyllabusDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SyllabusDetailController at " + request.getContextPath() + "</h1>");
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
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("syllabus", new DAO().getSyllabusBySlbID(id));
        request.setAttribute("decisions", new DecisionDAO().findAll());
        request.getRequestDispatcher("gui/common/subject/editSyllabus.jsp").forward(request, response);
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
        SyllabusDAO syllabusDAO = new SyllabusDAO();
        boolean check = false;
        Syllabus syllabus = new Syllabus();
        int id = Integer.parseInt(request.getParameter("inputId"));
        String nameEn = request.getParameter("inputNameEn");
        String nameVi = request.getParameter("inputNameVi");
        String nameEnOld = request.getParameter("inputNameEnOld");
        String nameViOld = request.getParameter("inputNameViOld");
        if (!nameEn.equals(nameEnOld)) {
            check = syllabusDAO.checkNameEn(nameEn);
        }
        if (!nameVi.equals(nameViOld)) {
            if (!check) {
                check = syllabusDAO.checkNameVi(nameVi);
            }
        }
        if (check) {
            request.setAttribute("errorMessage", "Name already exist!!!");
            request.setAttribute("syllabus", new DAO().getSyllabusBySlbID(id));
            request.setAttribute("decisions", new DecisionDAO().findAll());
            request.getRequestDispatcher("gui/common/subject/editSyllabus.jsp").forward(request, response);
        } else {
            String decision = request.getParameter("inputDecision");
            boolean isActive = Integer.parseInt(request.getParameter("inputStatus")) != 0;
            String degree = request.getParameter("inputDegree");
            String timeAllocation = request.getParameter("inputTime");
            String description = request.getParameter("inputDescription");
            String task = request.getParameter("inputTask");
            //r.setStatus(status);
            HttpSession session = request.getSession();
            syllabus.setAccountID(((Account) session.getAttribute("account")).getAccountID());
            syllabus.setDegreeLevel(degree);
            syllabus.setDescription(description);
            syllabus.setStudentTask(task);
            syllabus.setSlbName_EN(nameEn);
            syllabus.setDecision(new Decision(decision, null, null, null, null, null, null));
            syllabus.setSlbName_VI(nameVi);
            syllabus.setTimeAllocation(timeAllocation);
            syllabus.setIsActive(isActive);
            syllabus.setSlbid(id);
            syllabus.setIsApproved(false);
            syllabusDAO.update(syllabus);
            Syllabus syllabusA = new DAO().getSyllabusBySlbID(id);
            request.setAttribute("syllabus", syllabus);
            request.getRequestDispatcher("gui/common/subject/syllabus.jsp").forward(request, response);
        }
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
