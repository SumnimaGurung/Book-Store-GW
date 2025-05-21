package com.bookstore.Controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/bookstore";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "your_password";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Session check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminUser") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int categoriesCount = 0;
        int ordersCount = 0;
        int transactionsCount = 0;
        int usersCount = 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {

                // Categories
                try (PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM categories");
                     ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) categoriesCount = rs.getInt(1);
                }

                // Orders
                try (PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM orders");
                     ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) ordersCount = rs.getInt(1);
                }

                // Transactions
                try (PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM transactions");
                     ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) transactionsCount = rs.getInt(1);
                }

                // Users
                try (PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM users");
                     ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) usersCount = rs.getInt(1);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error fetching dashboard data.");
        }

        // Send data to JSP
        request.setAttribute("categoriesCount", categoriesCount);
        request.setAttribute("ordersCount", ordersCount);
        request.setAttribute("transactionsCount", transactionsCount);
        request.setAttribute("usersCount", usersCount);

        request.getRequestDispatcher("Admin.jsp").forward(request, response);
    }
}