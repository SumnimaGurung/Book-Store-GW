<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BookHaven - Your Online Bookstore</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .hero {
            text-align: center;
            padding: 40px;
            background-color: #f4f4f4;
        }

        .hero h1 {
            font-size: 36px;
            margin-bottom: 10px;
        }

        .hero p {
            font-size: 18px;
            color: #555;
        }

        .hero .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 24px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }

        .hero .btn:hover {
            background-color: #0056b3;
        }

        .featured {
            padding: 40px 20px;
            background-color: #fff;
        }

        .section-title {
            text-align: center;
            font-size: 28px;
            margin-bottom: 30px;
        }

        .book-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .book-card {
            width: 200px;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 15px;
            background-color: #fdfdfd;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .book-cover {
            width: 150px;
            height: 220px;
            object-fit: cover;
            margin-bottom: 10px;
        }

        .book-title {
            font-weight: bold;
            font-size: 16px;
            margin-bottom: 5px;
        }

        .book-author {
            font-size: 14px;
            color: #555;
            margin-bottom: 5px;
        }

        .book-price {
            font-size: 14px;
            color: #333;
            margin-bottom: 10px;
        }

        .add-to-cart {
            padding: 8px 12px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        .add-to-cart:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>

    <!-- Hero Section -->
    <section class="hero">
        <h1>Welcome to BookHaven</h1>
        <p>Discover your next favorite book from our extensive collection of bestsellers and hidden gems</p>
        <a href="product.jsp" class="btn">Browse Books</a>
    </section>

    <!-- Featured Books -->
    <section class="featured">
        <h2 class="section-title">Featured Books</h2>
        <div class="book-grid">

            <!-- Book 1 -->
            <div class="book-card">
                <img src="images/The Great Gatsby.jpeg" alt="The Great Gatsby" class="book-cover">
                <div class="book-title">The Great Gatsby</div>
                <div class="book-author">Scott Fitzgerald</div>
                <div class="book-price">$11.00</div>
                <button class="add-to-cart">Add to Cart</button>
            </div>

            <!-- Book 2 -->
            <div class="book-card">
                <img src="images/The Girl with the Dragon Tattoo.jpg" alt="The Girl with the Dragon Tattoo" class="book-cover">
                <div class="book-title">The Girl with the Dragon Tattoo</div>
                <div class="book-author">Stieg Larsson, Reg Keeland</div>
                <div class="book-price">$14.90</div>
                <button class="add-to-cart">Add to Cart</button>
            </div>

            <!-- Book 3 -->
            <div class="book-card">
                <img src="images/The Da Vinci Code.jpeg" alt="The Da Vinci Code" class="book-cover">
                <div class="book-title">The Da Vinci Code</div>
                <div class="book-author">Dan Brown</div>
                <div class="book-price">$15.15</div>
                <button class="add-to-cart">Add to Cart</button>
            </div>

            <!-- Book 4 -->
            <div class="book-card">
                <img src="images/thealchemist.jpg" alt="The Alchemist" class="book-cover">
                <div class="book-title">The Alchemist</div>
                <div class="book-author">Paulo Coelho</div>
                <div class="book-price">$9.60</div>
                <button class="add-to-cart">Add to Cart</button>
            </div>

            <!-- Book 5 -->
            <div class="book-card">
                <img src="images/Pride and Prejudice.jpeg" alt="Pride and Prejudice" class="book-cover">
                <div class="book-title">Pride and Prejudice</div>
                <div class="book-author">Jane Austen</div>
                <div class="book-price">$16.70</div>
                <button class="add-to-cart">Add to Cart</button>
            </div>

        </div>
    </section>

    <%@ include file="footer.jsp" %>
</body>
</html>
