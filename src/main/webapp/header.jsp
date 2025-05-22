<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BookHaven - Online Book Store</title>

    <!-- Font Awesome for Cart Icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        /* Header Styles */
        header {
            background-color: #2c3e50;
            color: white;
            padding: 1rem 2rem;
        }

        .top-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            margin-bottom: 0.5rem;
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
            display: inline-flex;
            align-items: center;
        }

        .auth-links a i {
            margin-right: 5px;
        }

        .auth-links a:hover {
            text-decoration: underline;
        }

        .footer-links {
            text-align: center;
            margin-top: 0.5rem;
        }

        .footer-links a {
            color: white;
            margin: 0 1rem;
            text-decoration: none;
        }

        .footer-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header>
        <!-- First Line -->
        <div class="top-header">
            <div class="logo">Book<span>Haven</span></div>

            <div class="search-bar">
			    <form action="Search.jsp" method="get">
			        <input type="text" name="query" placeholder="Search books...">
			        <button type="submit">Search</button>
			    </form>
			</div>


            <div class="auth-links">
                <a href="Cart.jsp"><i class="fa fa-shopping-cart"></i>Cart</a>
                <a href="login.jsp">Login</a>
                <a href="Register.jsp">Register</a>
            </div>
        </div>

        <!-- Second Line -->
        <div class="footer-links">
            <a href="index.jsp">Home</a>
            <a href="product.jsp">Product</a>
            <a href="aboutus.jsp">About</a>
            <a href="contact.jsp">Contact</a>
        </div>
    </header>
</body>
</html>
