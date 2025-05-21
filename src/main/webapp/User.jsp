<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f4f4;
        }

        .container {
            display: flex;
        }

        .sidebar {
            width: 220px;
            background: #2c3e50;
            color: white;
            min-height: 100vh;
            padding: 20px 10px;
        }

        .sidebar h3 {
            text-align: center;
            margin-bottom: 30px;
        }

        .sidebar a {
            display: block;
            padding: 10px 20px;
            color: white;
            text-decoration: none;
            margin-bottom: 10px;
            border-radius: 5px;
            transition: background 0.3s;
        }

        .sidebar a:hover {
            background: #34495e;
        }

        .main-content {
            flex-grow: 1;
            padding: 30px;
        }

		        .user-list {
		    display: flex;
		    flex-direction: column;
		    gap: 20px;
		}
		
		.user-card {
		    display: flex;
		    align-items: center;
		    background: #fff;
		    border-radius: 8px;
		    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
		    padding: 20px;
		}
		
		.avatar {
		    width: 70px;
		    height: 70px;
		    border-radius: 50%;
		    margin-right: 20px;
		}
		
		.user-info {
		    flex: 1;
		}
		
		.user-info h4 {
		    margin: 0 0 5px;
		    font-size: 18px;
		    color: #333;
		}
		
		.user-info p {
		    margin: 0 0 10px;
		    color: #666;
		}
		
		.user-actions {
		    display: flex;
		    gap: 10px;
		}
		
		.view-btn,
		.update-btn {
		    background-color: #00bcd4;
		    color: white;
		    border: none;
		    padding: 8px 16px;
		    border-radius: 6px;
		    cursor: pointer;
		    transition: background 0.3s;
		}
		
		.view-btn:hover,
		.update-btn:hover {
		    background-color: #0097a7;
		}
		
		        @media (max-width: 768px) {
		            .card {
		                flex: 1 1 100%;
		            }
		        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>

    <div class="container">
        <div class="sidebar">
            <a href="Admin.jsp">User list</a>
            <a href="product.jsp">Create User</a>
            <a href="orders.jsp">Profile</a>
            <a href="transactions.jsp">Setting</a>
            <a href="UserManagement.jsp">Logout</a>
        </div>


</body>
</html>