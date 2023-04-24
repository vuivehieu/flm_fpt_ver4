/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package admin.user;

import DAL.AccountDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Set;
import model.Account;
import model.Role;

/**
 *
 * @author ADMIN
 */
@WebServlet(name="AdminUpdateUserController", urlPatterns={"/admin-updateuser"})
public class AdminUpdateUserController extends HttpServlet{

 protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminAddUserController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminAddUserController at " + request.getContextPath () + "</h1>");
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

        AccountDAO accountDAO = new AccountDAO();
        String userName = request.getParameter("updateUsername");
        String updateEmail = request.getParameter("updateEmail");
        int id = Integer.parseInt(request.getParameter("updateId"));
        int status = Integer.parseInt(request.getParameter("updateStatus"));
        int uid = 0;
        int roleId = 0;
//        Cookie[] cookies = request.getCookies();
//                if(cookies!=null){
//            for(Cookie cookie:cookies){
//                if(cookie.getName().equals("userId")){
//                    uid = Integer.parseInt(cookie.getValue());
//                }
//                if(cookie.getName().equals("userRole")){
//                    roleId = Integer.parseInt(cookie.getValue());
//                }
//            }
//        }
//        int role = Integer.parseInt(request.getParameter("updateRole"));
        
        Set<Role> rolesSet = new HashSet<>();
        String[] roleIds = request.getParameterValues("states[]");

        if (roleIds != null && roleIds.length > 0) {
            for (String roleIdUpdate : roleIds) {
                int roleId1 = Integer.parseInt(roleIdUpdate);
                Role role = accountDAO.findRoleByRoleId(roleId1);
                rolesSet.add(role);
            }
        }
        
        
        Account a = new Account();
        a.setStatus(status);
        a.setUserName(userName);
        a.setRoles(rolesSet);
        
        // xoa role cu trong bang account_role
        // update lai trong bang acount role (account_id role_id)
        
        
        int aupdateAccount = accountDAO.updateStatus(a);
        if(aupdateAccount > 0){
            if (roleIds != null && roleIds.length > 0) {
                int deleteRole = accountDAO.deleteRole(id);
                
                for (String roleId2 : roleIds) {
                    int roleId1 = Integer.parseInt(roleId2);
                    if(deleteRole > 0){
                        accountDAO.addAccountRole(id, roleId1, 1);
                    }
                }
                
            } 
        } 
 
//        String page = "";
//        if(id == uid && roleId != role){
//            page = "/logout";
//        }else{
//            page = "/admin-alluser";
//        }

        String page =  "/admin-alluser";
        response.sendRedirect(request.getContextPath() + page);
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
