/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package admin.setting;

import DAL.AccountDAO;
import DAL.DAO;
import DAL.DecisionDAO;
import DAL.PLODAO;
import DAL.RoleDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Date;
import model.Decision;
import model.PLO;
import model.PaginationModel;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "DecisionEditController", urlPatterns = {"/decision-edit"})
public class DecisionEditController extends HttpServlet {

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
            out.println("<title>Servlet AdminAllUserController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminAllUserController at " + request.getContextPath() + "</h1>");
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
        request.setAttribute("decision", new DAO().getDecisionByDecisionNo(request.getParameter("decisionNo")));
        request.getRequestDispatcher("gui/admin/decision/edit.jsp").forward(request, response);
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
        boolean status = false;
        DecisionDAO decisionDAO = new DecisionDAO();
        Decision decision = new Decision();
        String decNo = request.getParameter("oldNo");
        Decision oldDec = new DAO().getDecisionByDecisionNo(decNo);
        if (request.getParameter("inputStatus") != null) {
            status = Integer.parseInt(request.getParameter("inputStatus")) == 1;
            if (status != oldDec.getIsActive() && status) {
                decision.setApprovedDate(new java.sql.Date(new java.util.Date().getTime()));
            }
        } else {
            status = oldDec.getIsActive();
        }
        if (oldDec.getApprovedDate() != null) {
            decision.setApprovedDate(oldDec.getApprovedDate());
        }
        String name = request.getParameter("inputDecisionName");
        String note = request.getParameter("inputNote");
        decision.setDecisionName(name);
        decision.setDecisionNo(decNo);
        decision.setNote(note);
        decision.setIsActive(status);
        decisionDAO.update(decision);
        response.sendRedirect(request.getContextPath() + "/admin-decisions?message=" + URLEncoder.encode("Update decision successfully", "UTF-8"));
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
