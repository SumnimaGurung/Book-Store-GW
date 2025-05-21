package com.bookstore.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.bookstore.Dao.DatabaseUtil;
import com.bookstore.Util.PasswordUtil;

@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to the register.jsp page
        request.getRequestDispatcher("Register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get parameters (Note: match HTML 'name' attributes)
        String name = request.getParameter("name");  // Changed from "fullName" to "name"
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String address = request.getParameter("address");  // New field added

        // Debug logging
        System.out.println("Attempting registration for: " + name + " | Email: " + email + " | Address: " + address);

        // Basic validation
        if (name == null || email == null || password == null || confirmPassword == null || address == null ||
            name.isEmpty() || email.isEmpty() || password.isEmpty() || confirmPassword.isEmpty() || address.isEmpty()) {
            response.sendRedirect("Register.jsp?error=All fields are required.");
            return;
        }

        if (!password.equals(confirmPassword)) {
            response.sendRedirect("Register.jsp?error=Passwords do not match.");
            return;
        }

        // Check if user already exists
        if (DatabaseUtil.checkUserExists(email)) {
            response.sendRedirect("Register.jsp?error=Email already exists.");
            return;
        }

        // Hash password
        String hashedPassword = PasswordUtil.hashPassword(password);

        // Register user (Include address in registration logic)
        boolean success = DatabaseUtil.registerUser(name, email, hashedPassword, address);

        if (success) {
            System.out.println("User Registered successfully: " + email);
            response.sendRedirect("login.jsp?message=Registration successful. Please log in.");
        } else {
            System.out.println("Registration failed for: " + email);
            response.sendRedirect("Register.jsp?error=Registration failed. Try again.");
        }
    }
}
