/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package common.syllabus;

import DAL.DAO;
import DAL.PLODAO;
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
import model.PLO;
import model.Role;
import model.Syllabus;

/**
 *
 * @author ADMIN
 */
@WebServlet(name="CurriculumEditPloController", urlPatterns={"/curriculum-ploEdit"})
public class CurriculumEditPloController extends HttpServlet{
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
        int ploid = Integer.parseInt(request.getParameter("ploid"));
        int curid = Integer.parseInt(request.getParameter("curid"));
        request.setAttribute("plo",new DAO().getPLOByID(ploid));
        request.setAttribute("curid", curid);
        request.getRequestDispatcher("gui/common/curriculum/plo/edit-plo.jsp").forward(request, response);
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
        PLODAO plodao = new PLODAO();  
        PLO plo = new PLO();
        String name = request.getParameter("inputPloName");
        String description = request.getParameter("inputDescription");
        boolean isActive = false;
        if(request.getParameter("inputStatus")!=null){
            isActive = Integer.parseInt(request.getParameter("inputStatus"))==1;
        }
        //r.setStatus(status);
        int ploid = Integer.parseInt(request.getParameter("inputPloId"));
        int curid = Integer.parseInt(request.getParameter("inputCurid"));
        plodao.update(name,description,isActive,ploid);
        response.sendRedirect(request.getContextPath() + "/ploDetailView?id="+curid+"&type=null");   
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
