<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BookHaven - Online Book Store</title>
    <style>
        /* Header Styles */
        header {
            background-color: #2c3e50;
            color: white;
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .logo {
            font-size: 1.8rem;
            font-weight: bold;
        }
        .logo span {
            color: #e74c3c;
        }
        .search-bar {
            width: 40%;
        }
        .search-bar input {
            width: 70%;
            padding: 0.5rem;
            border: none;
            border-radius: 4px 0 0 4px;
        }
        .search-bar button {
            padding: 0.5rem 1rem;
            background-color: #e74c3c;
            color: white;
            border: none;
            border-radius: 0 4px 4px 0;
            cursor: pointer;
        }
        .auth-links a {
            color: white;
            margin-left: 1rem;
            text-decoration: none;
        }
        .auth-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">Book<span>Haven</span></div>
        
        <div class="search-bar">
            <input type="text" placeholder="Search books...">
            <button>Search</button>
        </div>
        
        <div class="auth-links">
            <a href="login.jsp">Login</a>
            <a href="Register.jsp">Register</a>
        </div>
        
        <div class="footer-links">
            <a href="index.jsp">Home</a>
            <a href="product.jsp">product</a>
            <a href="aboutus.jsp">about</a>
            <a href="contact.jsp">Contact</a>
        </div>
    </header>
</body>
</html>