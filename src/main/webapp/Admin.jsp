<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>
s
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - BookHaven</title>
    <style>
        body {
            margin: 0; font-family: Arial, sans-serif; background: #f4f4f4;
        }
        .container { display: flex; }
        .sidebar {
            width: 220px; background: #2c3e50; color: white;
            min-height: 100vh; padding: 20px 10px;
        }
        .sidebar h3 { text-align: center; margin-bottom: 30px; }
        .sidebar a {
            display: block; padding: 10px 20px; color: white;
            text-decoration: none; margin-bottom: 10px;
            border-radius: 5px; transition: background 0.3s;
        }
        .sidebar a:hover { background: #34495e; }
        .main-content {
            flex-grow: 1; padding: 30px;
        }
        .card {
            background: white; padding: 20px;
            border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }
        table {
            width: 100%; border-collapse: collapse; margin-top: 30px;
        }
        th, td {
            padding: 12px; border-bottom: 1px solid #ccc;
            text-align: left;
        }
        th { background-color: #3498db; color: white; }
        a.btn {
            padding: 6px 12px; background-color: #3498db; color: white;
            border-radius: 4px; text-decoration: none; margin-right: 5px;
        }
        a.btn:hover { background-color: #2980b9; }
        form {
            margin-top: 30px; background: #fff; padding: 20px;
            border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }
        form input, form select {
            padding: 8px; width: 300px; margin-right: 10px;
            margin-bottom: 10px; border: 1px solid #ccc; border-radius: 4px;
        }
        form button {
            padding: 8px 16px; background-color: #27ae60;
            color: white; border: none; border-radius: 4px;
        }
        form button:hover { background-color: #219150; }
    </style>
</head>
<body>
<div class="container">
    <!-- Sidebar (yours) -->
    <div class="sidebar">
        <h3>Admin Panel</h3>
        <a href="login.jsp">Login</a>
        <a href="Admin.jsp">Admin Products</a>
        <a href="Cart.jsp">Orders</a>
        <a href="User.jsp">User Management</a>
        <a href="index.jsp">Logout</a>
    </div>

    <!-- Main content -->
    <div class="main-content">
        <h2>Manage Products</h2>

        <!-- Product Table -->
        <div class="card">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Actions</th>
                    </tr>
                     <tr>
                        <th>1</th>
                        <th>The Great Gatsby</th>
                        <th>Science Fiction</th>
                        <th>$10</th>
                        <th> <button>Remove</button>  <button>Edit</button></th>
                    </tr>
                </thead>
                <tbody>
                <%
                    List<Map<String, Object>> productsList = (List<Map<String, Object>>) request.getAttribute("productsList");
                    if (productsList != null && !productsList.isEmpty()) {
                        for (Map<String, Object> product : productsList) {
                %>
                    <tr>
                        <td><%= product.get("id") %></td>
                        <td><%= product.get("name") %></td>
                        <td><%= product.get("category") %></td>
                        <td><%= product.get("price") %></td>
                        <td>
                            <a class="btn" href="admin?action=editProduct&id=<%= product.get("id") %>">Edit</a>
                            <a class="btn" href="admin?action=deleteProduct&id=<%= product.get("id") %>" onclick="return confirm('Delete this product?')">Delete</a>
                        </td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr><td colspan="5">No products found.</td></tr>
                <% } %>
                </tbody>
            </table>
        </div>

        <!-- Add Product Form -->
        <form action="admin" method="post">
		    <input type="hidden" name="action" value="addProduct">
		    <input type="text" name="name" placeholder="Product Name" required>
		    <input type="number" name="price" step="0.01" placeholder="Price" required>
		
		   <select name="category" required>
			    <option value="">-- Select Category --</option>
			    <option value="Science Fiction">Science Fiction</option>
			    <option value="Romance">Romance</option>
			    <%
			        List<String> categoryList = (List<String>) request.getAttribute("categoryList");
			        if (categoryList != null) {
			            for (String category : categoryList) {
			                // To avoid duplicate categories if Science Fiction or Romance already in categoryList
			                if (!category.equals("Science Fiction") && !category.equals("Romance")) {
			    %>
			        <option value="<%= category %>"><%= category %></option>
			    <%
			                }
			            }
			        }
			    %>
			</select>


    <button type="submit">Add Product</button>
</form>

    </div>
</div>
</body>
</html>
