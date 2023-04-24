/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package admin.user;

import DAL.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.HashSet;
import java.util.Set;
import model.Account;
import model.Role;

/**
 *
 * @author phanh
 */
@WebServlet(name = "AdminAddUserController", urlPatterns = {"/admin-adduser"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AdminAddUserController extends HttpServlet {
   
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("gui/admin/user/add.jsp").forward(request, response);
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
//        processRequest(request, response);
        AccountDAO accountDAO = new AccountDAO();
        String userName = request.getParameter("inputUsername");
        String fullName = request.getParameter("inputFullName");
        String email = request.getParameter("inputEmail");
        String password = request.getParameter("inputPassword");
//        String avatar = request.getParameter("inputAvatar");
        int status = Integer.parseInt(request.getParameter("inputStatus"));
//        int role = Integer.parseInt(request.getParameter("inputRole"));

        Set<Role> rolesSet = new HashSet<>();
        String[] roleIds = request.getParameterValues("states[]");
        Part file = request.getPart("inputAvatar");
        String fileName = extractFileName(file);
        // refines the fileName in case it is an absolute path
        fileName = new File(fileName).getName();
        file.write(this.getFolderUpload().getAbsolutePath() + File.separator + fileName);
        String avatar = "images\\avatar" + File.separator + fileName;

        // Kiểm tra roles không null và không rỗng
        if (roleIds != null && roleIds.length > 0) {
            // Lặp qua các phần tử trong mảng roles
            for (String roleId : roleIds) {
                int roleId1 = Integer.parseInt(roleId);
                // Tạo đối tượng Role từ chuỗi role
                Role role = accountDAO.findRoleByRoleId(roleId1);
                // Thêm roleObj vào Set<Role>
                rolesSet.add(role);
            }
        }
        
        
        Account a = new Account();
        a.setDisplayName(fullName);
        a.setEmail(email);
        a.setPassword(Custom.ConvertMD5.convertPassToMD5(password));
        a.setIsBlock(false);
        a.setAvatar(avatar);
        a.setStatus(status);
        a.setCreateDate(new java.sql.Date(System.currentTimeMillis()));
//        a.setRole(new Role(role, null));
        a.setRoles(rolesSet);
        
        a.setUserName(userName);
        if (a.getAvatar().equals("")) {
            a.setAvatar("images/avatar/default.png");
        }
        if(accountDAO.checkByUsernameAndEmail(a.getUserName(), a.getEmail())){
            int addAccount = accountDAO.addUser(a);
            if(addAccount > 0){
                Account newAccount = accountDAO.findAccountByEmail(email);
                if (roleIds != null && roleIds.length > 0) {
                    for (String roleId : roleIds) {
                        int roleId1 = Integer.parseInt(roleId);
                        accountDAO.addAccountRole(newAccount.getAccountID(), roleId1, 1);
                    }
                } 
            } 
        }
        response.sendRedirect(request.getContextPath() + "/admin-alluser");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    public File getFolderUpload() {
//        File folderUpload = new File(System.getProperty("user.home") + "/Uploads");
        File folderUpload = new File(getServletContext().getRealPath("/") + "images/avatar/");
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }
}
