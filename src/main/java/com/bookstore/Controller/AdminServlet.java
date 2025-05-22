package com.bookstore.Controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/bookstore";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("editProduct".equals(action)) {
            getProductById(request, response);
        } else if ("deleteProduct".equals(action)) {
            deleteProduct(request, response);
        } else {
            listProducts(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("addProduct".equals(action)) {
            addProduct(request, response);
        } else if ("updateProduct".equals(action)) {
            updateProduct(request, response);
        } else {
            doGet(request, response);
        }
    }

    // List all products with their categories
    private void listProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Map<String, Object>> products = new ArrayList<>();
        List<String> categoryList = new ArrayList<>();
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            // Fetch products with category names
            String sql = "SELECT p.id, p.name, p.price, c.name AS categoryName " +
                         "FROM products p JOIN categories c ON p.category_id = c.id";
            try (PreparedStatement stmt = conn.prepareStatement(sql);
                 ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> product = new HashMap<>();
                    product.put("id", rs.getInt("id"));
                    product.put("name", rs.getString("name"));
                    product.put("price", rs.getDouble("price"));
                    product.put("category", rs.getString("categoryName"));
                    products.add(product);
                }
            }

            // Fetch all categories
            String catSql = "SELECT name FROM categories";
            try (PreparedStatement catStmt = conn.prepareStatement(catSql);
                 ResultSet catRs = catStmt.executeQuery()) {
                while (catRs.next()) {
                    categoryList.add(catRs.getString("name"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error fetching products or categories.");
        }

        request.setAttribute("productsList", products);
        request.setAttribute("categoryList", categoryList);
        request.getRequestDispatcher("Admin.jsp").forward(request, response);
    }

    // Add new product
    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String priceStr = request.getParameter("price");
        String categoryName = request.getParameter("category");

        if (name == null || priceStr == null || categoryName == null || name.isEmpty() || priceStr.isEmpty() || categoryName.isEmpty()) {
            response.sendRedirect("admin");
            return;
        }

        double price;
        try {
            price = Double.parseDouble(priceStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("admin");
            return;
        }

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            // Get category ID
            String categorySql = "SELECT id FROM categories WHERE name = ?";
            try (PreparedStatement categoryStmt = conn.prepareStatement(categorySql)) {
                categoryStmt.setString(1, categoryName);
                try (ResultSet rs = categoryStmt.executeQuery()) {
                    if (rs.next()) {
                        int categoryId = rs.getInt("id");

                        String insertSql = "INSERT INTO products (name, category_id, price) VALUES (?, ?, ?)";
                        try (PreparedStatement stmt = conn.prepareStatement(insertSql)) {
                            stmt.setString(1, name);
                            stmt.setInt(2, categoryId);
                            stmt.setDouble(3, price);
                            stmt.executeUpdate();
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("admin");
    }

    // Update existing product
    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idStr = request.getParameter("id");
        String name = request.getParameter("name");
        String priceStr = request.getParameter("price");
        String categoryName = request.getParameter("category");

        if (idStr == null || name == null || priceStr == null || categoryName == null ||
            idStr.isEmpty() || name.isEmpty() || priceStr.isEmpty() || categoryName.isEmpty()) {
            response.sendRedirect("admin");
            return;
        }

        int id;
        double price;
        try {
            id = Integer.parseInt(idStr);
            price = Double.parseDouble(priceStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("admin");
            return;
        }

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String categorySql = "SELECT id FROM categories WHERE name = ?";
            try (PreparedStatement categoryStmt = conn.prepareStatement(categorySql)) {
                categoryStmt.setString(1, categoryName);
                try (ResultSet rs = categoryStmt.executeQuery()) {
                    if (rs.next()) {
                        int categoryId = rs.getInt("id");

                        String updateSql = "UPDATE products SET name=?, category_id=?, price=? WHERE id=?";
                        try (PreparedStatement stmt = conn.prepareStatement(updateSql)) {
                            stmt.setString(1, name);
                            stmt.setInt(2, categoryId);
                            stmt.setDouble(3, price);
                            stmt.setInt(4, id);
                            stmt.executeUpdate();
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("admin");
    }

    // Delete product by ID
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            response.sendRedirect("admin");
            return;
        }

        try {
            int id = Integer.parseInt(idStr);
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String deleteSql = "DELETE FROM products WHERE id=?";
                try (PreparedStatement stmt = conn.prepareStatement(deleteSql)) {
                    stmt.setInt(1, id);
                    stmt.executeUpdate();
                }
            }
        } catch (NumberFormatException | SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("admin");
    }

    // Get product details for editing
    private void getProductById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            response.sendRedirect("admin");
            return;
        }

        int id;
        List<String> categoryList = new ArrayList<>();

        try {
            id = Integer.parseInt(idStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("admin");
            return;
        }

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "SELECT p.id, p.name, p.price, c.name AS categoryName " +
                         "FROM products p JOIN categories c ON p.category_id = c.id WHERE p.id=?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, id);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        request.setAttribute("id", rs.getInt("id"));
                        request.setAttribute("name", rs.getString("name"));
                        request.setAttribute("price", rs.getDouble("price"));
                        request.setAttribute("category", rs.getString("categoryName"));
                    } else {
                        // Product not found, redirect to list
                        response.sendRedirect("admin");
                        return;
                    }
                }
            }

            // Get all categories for dropdown
            String catSql = "SELECT name FROM categories";
            try (PreparedStatement catStmt = conn.prepareStatement(catSql);
                 ResultSet catRs = catStmt.executeQuery()) {
                while (catRs.next()) {
                    categoryList.add(catRs.getString("name"));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("categoryList", categoryList);
        request.getRequestDispatcher("EditProduct.jsp").forward(request, response);
    }
}
