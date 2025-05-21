<%@ page import="java.util.List" %>
<%@ page import="com.bookstore.Model.Book" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Cart - BookHaven</title>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }

        .container {
            min-height: 100%;
            padding: 20px 5%;
            box-sizing: border-box;
        }

        h1 {
            color: #2c3e50;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        .total {
            font-weight: bold;
            font-size: 1.2rem;
            text-align: right;
            margin-top: 20px;
        }

        .empty {
            text-align: center;
            font-size: 1.1rem;
            color: #999;
        }
    </style>
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container">
    <h1>Your Shopping Cart</h1>

    <%
        List<Book> cart = (List<Book>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
    %>
        <p class="empty">Your cart is currently empty.</p>
    <%
        } else {
            double total = 0;
    %>
        <table>
            <tr>
                <th>Title</th>
                <th>Author</th>
                <th>Price (USD)</th>
            </tr>
    <%
            for (Book book : cart) {
                total += book.getPrice();
    %>
            <tr>
                <td><%= book.getTitle() %></td>
                <td><%= book.getAuthor() %></td>
                <td>$<%= String.format("%.2f", book.getPrice()) %></td>
            </tr>
    <%
            }
    %>
        </table>
        <p class="total">Total: $<%= String.format("%.2f", total) %></p>
    <%
        }
    %>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
