<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - BookHaven</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f4f4;
        }
        .container { display: flex; }
        .sidebar {
            width: 220px;
            background: #2c3e50;
            color: white;
            min-height: 100vh;
            padding: 20px 10px;
        }
        .sidebar h3 { text-align: center; margin-bottom: 30px; }
        .sidebar a {
            display: block;
            padding: 10px 20px;
            color: white;
            text-decoration: none;
            margin-bottom: 10px;
            border-radius: 5px;
            transition: background 0.3s;
        }
        .sidebar a:hover { background: #34495e; }
        .main-content { flex-grow: 1; padding: 30px; }
        .dashboard-header { text-align: left; margin-bottom: 30px; }
        .dashboard-cards {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .card {
            flex: 1 1 48%;
            background: white;
            border-left: 6px solid #3498db;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            transition: transform 0.2s ease;
        }
        .card:hover { transform: translateY(-5px); }
        .card.green { border-left-color: #27ae60; }
        .card.red { border-left-color: #e74c3c; }
        .card.yellow { border-left-color: #f1c40f; }
        .card.blue { border-left-color: #2980b9; }
        .card.grey { border-left-color: #7f8c8d; }
        .card h4 { margin: 0 0 10px; color: #2c3e50; }
        .card p {
            font-size: 22px;
            font-weight: bold;
            color: #555;
        }
        @media (max-width: 768px) {
            .card { flex: 1 1 100%; }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="sidebar">
        <h3>Admin Panel</h3>
        <a href="login.jsp">Login</a>
        <a href="Admin.jsp">Dashboard</a>
        <a href="product.jsp">Categories</a>
        <a href="Cart.jsp">Orders</a>
        <a href="transactions.jsp">Transaction</a>
        <a href="User.jsp">User Management</a>
        <a href="LogoutServlet">Logout</a>
    </div>

    <div class="main-content">
        <div class="dashboard-header">
            <h1>Dashboard</h1>
        </div>

        <div class="dashboard-cards">
            <div class="card red">
                <h4>Categories</h4>
                <p><%= request.getAttribute("categoriesCount") %></p>
            </div>

            <div class="card yellow">
                <h4>Orders</h4>
                <p><%= request.getAttribute("ordersCount") %></p>
            </div>

            <div class="card blue">
                <h4>Transaction</h4>
                <p><%= request.getAttribute("transactionsCount") %></p>
            </div>

            <div class="card grey">
                <h4>User Management</h4>
                <p><%= request.getAttribute("usersCount") %></p>
            </div>
        </div>
    </div>
</div>

</body>
</html>
