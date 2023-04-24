/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package common.syllabus;

import DAL.DAO;
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
import model.Role;
import model.Syllabus;

/**
 *
 * @author ADMIN
 */
@WebServlet(name="AddSyllabusController", urlPatterns={"/syllabusAdd"})
public class AddSyllabusController extends HttpServlet{
        /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SyllabusDetailController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SyllabusDetailController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {        
        request.getRequestDispatcher("gui/common/subject/addSyllabus.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        boolean check = false;
        SyllabusDAO syllabusDAO = new SyllabusDAO();  
        Syllabus syllabus = new Syllabus();
        String nameEn = request.getParameter("inputNameEn");
        String nameVi = request.getParameter("inputNameVi");
        check = syllabusDAO.checkNameEn(nameEn);
        if(!check){
            check = syllabusDAO.checkNameVi(nameVi);
        }
        if(check){
            request.setAttribute("errorMessage", "Name already exist!!!");
            request.getRequestDispatcher("gui/common/subject/addSyllabus.jsp").forward(request, response);
        }else{
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
        syllabus.setSlbName_VI(nameVi);
        syllabus.setTimeAllocation(timeAllocation);
        syllabus.setIsActive(false);
        syllabus.setIsApproved(false);
        syllabusDAO.add(syllabus);
        response.sendRedirect(request.getContextPath() + "/search?type=syllabus&keysearch=&filter=subjectcode");   
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
