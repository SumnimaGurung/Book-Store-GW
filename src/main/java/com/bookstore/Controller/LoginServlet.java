package com.bookstore.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.bookstore.Dao.DatabaseUtil;
import com.bookstore.Util.PasswordUtil;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");

        System.out.println("Login attempt by: " + email); // Debug log

        // Validate input
        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            response.sendRedirect("login.jsp?error=Email and password are required.");
            return;
        }

        String hashPassword = PasswordUtil.hashPassword(password);
        // Check user credentials
        boolean isValidUser = DatabaseUtil.checkUserLogin(email, hashPassword);
        if (isValidUser) {
            HttpSession session = request.getSession();
            session.setAttribute("user", email);

            if ("on".equals(rememberMe)) {
                Cookie userCookie = new Cookie("user", email);
                userCookie.setMaxAge(60 * 60 * 24 * 30);
                userCookie.setPath("/");
                response.addCookie(userCookie);
            } else {
                Cookie userCookie = new Cookie("user", "");
                userCookie.setMaxAge(0);
                userCookie.setPath("/");
                response.addCookie(userCookie);
            }

            response.sendRedirect("Cart.jsp");
        } else {
            response.sendRedirect("login.jsp?error=Invalid email or password.");
        }
    }
}
