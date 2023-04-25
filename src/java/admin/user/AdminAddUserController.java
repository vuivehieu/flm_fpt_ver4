/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package admin.user;

import DAL.AccountDAO;
import DAL.RoleDAO;
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
import java.util.List;
import java.util.Properties;
import java.util.Random;
import java.util.Set;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
        
        RoleDAO roleDAO = new RoleDAO();
        List<Role> roleList = roleDAO.getAllRole();
        request.setAttribute("roles", roleList);
        
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
        AccountDAO accountDAO = new AccountDAO();
        String userName = request.getParameter("inputUsername");
        String fullName = request.getParameter("inputFullName");
        String mobile = request.getParameter("inputMobile");
        String email = request.getParameter("inputEmail");
        int status = Integer.parseInt(request.getParameter("inputStatus"));

        Set<Role> rolesSet = new HashSet<>();
        String[] roleIds = request.getParameterValues("states[]");
        Part file = request.getPart("inputAvatar");
        String fileName = extractFileName(file);
        // refines the fileName in case it is an absolute path
        fileName = new File(fileName).getName();
        if(!"".equals(fileName)){
             file.write(this.getFolderUpload().getAbsolutePath() + File.separator + fileName);
        }
        String avatar = "images/avatar" + File.separator + fileName;

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
        
        a.setIsBlock(false);
        a.setAvatar(avatar);
        a.setStatus(status);
        a.setCreateDate(new java.sql.Date(System.currentTimeMillis()));
        a.setMobile(mobile);
        a.setRoles(rolesSet);
        a.setUserName(userName);
        if (a.getAvatar().equals("images/avatar\\")) {
            a.setAvatar("images/avatar/default.png");
        }
        
        if(accountDAO.checkByUsernameAndEmail(a.getUserName(), a.getEmail())){
            String ramdomPass = this.sendMail(request, response, email, userName);
            if(ramdomPass != null){
                a.setPassword(Custom.ConvertMD5.convertPassToMD5(ramdomPass));
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
        }else {
            RoleDAO roleDAO = new RoleDAO();
            List<Role> roleList = roleDAO.getAllRole();
            request.setAttribute("roles", roleList);
            request.setAttribute("error", "UserName or Email is already registered, please enter another userName or email");
            request.getRequestDispatcher("/gui/admin/user/add.jsp").forward(request, response);
//            response.sendRedirect(request.getContextPath() + "/admin-alluser");
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
    
    private String sendMail(HttpServletRequest request, HttpServletResponse response, String email, String userName) throws ServletException, IOException {

        String ramdomPass = this.generateRandomString(8);

        final String from = "dothang4477@gmail.com";
        final String password = "irlsqjizsiwfwnzu";
        String host = "smtp.gmail.com";
        int port = 587;
        String to = email;
        String subject = "New account notification: " + userName;
        String content = "The password for your account is: " + ramdomPass;

        // Thiết lập các thuộc tính email
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);

        // Tạo phiên gửi email và thiết lập thông tin người gửi
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        try {
            // Tạo đối tượng MimeMessage và thiết lập các thuộc tính email
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(content);

            // Gửi email
            Transport.send(message);
            
            return ramdomPass;

            // Chuyển hướng đến trang xác nhận email
        } catch (MessagingException e) {
            throw new RuntimeException("error: " + e);
        }
    }
    
    public static String generateRandomString(int length) {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder sb = new StringBuilder(length);
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(characters.length());
            sb.append(characters.charAt(index));
        }
        return sb.toString();
    }
}
