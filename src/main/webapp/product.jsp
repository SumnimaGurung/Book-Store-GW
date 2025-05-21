<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>BookHaven - Our Collection</title>
    <style>
        /* Product Grid Styles */
        .product-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 25px;
            padding: 20px 5%;
        }
        .book-card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            overflow: hidden;
            transition: transform 0.3s;
            display: flex;
            flex-direction: column;
        }
        .book-card:hover {
            transform: translateY(-5px);
        }
        .book-cover {
            width: 100%;
            height: 300px;
            object-fit: cover;
            border-bottom: 1px solid #eee;
        }
        .book-details {
            padding: 15px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .book-title {
            font-weight: bold;
            margin: 5px 0;
            color: #2c3e50;
            font-size: 1.1rem;
        }
        .book-author {
            font-style: italic;
            margin-bottom: 10px;
            color: #555;
        }
        .book-price {
            color: #e74c3c;
            font-weight: bold;
            font-size: 1.2rem;
            margin: 10px 0;
        }
        .add-to-cart {
            width: 100%;
            padding: 8px;
            background: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        .add-to-cart:hover {
            background: #2980b9;
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>

    <h1 style="text-align: center; margin: 30px 0; color: #2c3e50;">Browse Our Books</h1>

    <div class="product-container">

        <!-- Single book card example -->
        <div class="book-card">
            <img src="images/The Silent Patient.jpeg" alt="Book cover: The Silent Patient" class="book-cover" />
            <div class="book-details">
                <div class="book-title">The Silent Patient</div>
                <div class="book-author">Alex Michaelides</div>
                <div class="book-price">$10.99</div>
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="add" />
                    <input type="hidden" name="title" value="The Silent Patient" />
                    <input type="hidden" name="author" value="Alex Michaelides" />
                    <input type="hidden" name="price" value="10.99" />
                    <button type="submit" class="add-to-cart">Add to Cart</button>
                </form>
            </div>
        </div>

        <!-- Repeat for each book -->
        <div class="book-card">
            <img src="images/The Great Gatsby.jpeg" alt="Book cover: The Great Gatsby" class="book-cover" />
            <div class="book-details">
                <div class="book-title">The Great Gatsby</div>
                <div class="book-author">Scott Fitzgerald</div>
                <div class="book-price">$11.00</div>
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="add" />
                    <input type="hidden" name="title" value="The Great Gatsby" />
                    <input type="hidden" name="author" value="Scott Fitzgerald" />
                    <input type="hidden" name="price" value="11.00" />
                    <button type="submit" class="add-to-cart">Add to Cart</button>
                </form>
            </div>
        </div>

        <div class="book-card">
            <img src="images/The Girl with the Dragon Tattoo.jpg" alt="Book cover: The Girl with the Dragon Tattoo" class="book-cover" />
            <div class="book-details">
                <div class="book-title">The Girl with the Dragon Tattoo</div>
                <div class="book-author">Stieg Larsson, Reg Keeland</div>
                <div class="book-price">$14.90</div>
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="add" />
                    <input type="hidden" name="title" value="The Girl with the Dragon Tattoo" />
                    <input type="hidden" name="author" value="Stieg Larsson, Reg Keeland" />
                    <input type="hidden" name="price" value="14.90" />
                    <button type="submit" class="add-to-cart">Add to Cart</button>
                </form>
            </div>
        </div>

        <div class="book-card">
            <img src="images/The Da Vinci Code.jpeg" alt="Book cover: The Da Vinci Code" class="book-cover" />
            <div class="book-details">
                <div class="book-title">The Da Vinci Code</div>
                <div class="book-author">Dan Brown</div>
                <div class="book-price">$15.15</div>
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="add" />
                    <input type="hidden" name="title" value="The Da Vinci Code" />
                    <input type="hidden" name="author" value="Dan Brown" />
                    <input type="hidden" name="price" value="15.15" />
                    <button type="submit" class="add-to-cart">Add to Cart</button>
                </form>
            </div>
        </div>

        <div class="book-card">
            <img src="images/thealchemist.jpg" alt="Book cover: The Alchemist" class="book-cover" />
            <div class="book-details">
                <div class="book-title">The Alchemist</div>
                <div class="book-author">Paulo Coelho</div>
                <div class="book-price">$9.60</div>
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="add" />
                    <input type="hidden" name="title" value="The Alchemist" />
                    <input type="hidden" name="author" value="Paulo Coelho" />
                    <input type="hidden" name="price" value="9.60" />
                    <button type="submit" class="add-to-cart">Add to Cart</button>
                </form>
            </div>
        </div>

        <div class="book-card">
            <img src="images/Pride and Prejudice.jpeg" alt="Book cover: Pride and Prejudice" class="book-cover" />
            <div class="book-details">
                <div class="book-title">Pride and Prejudice</div>
                <div class="book-author">Jane Austen</div>
                <div class="book-price">$16.70</div>
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="add" />
                    <input type="hidden" name="title" value="Pride and Prejudice" />
                    <input type="hidden" name="author" value="Jane Austen" />
                    <input type="hidden" name="price" value="16.70" />
                    <button type="submit" class="add-to-cart">Add to Cart</button>
                </form>
            </div>
        </div>

        <div class="book-card">
            <img src="images/Gone Girl.jpeg" alt="Book cover: Gone Girl" class="book-cover" />
            <div class="book-details">
                <div class="book-title">Gone Girl</div>
                <div class="book-author">Gillian Flynn</div>
                <div class="book-price">$8.40</div>
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="add" />
                    <input type="hidden" name="title" value="Gone Girl" />
                    <input type="hidden" name="author" value="Gillian Flynn" />
                    <input type="hidden" name="price" value="8.40" />
                    <button type="submit" class="add-to-cart">Add to Cart</button>
                </form>
            </div>
        </div>

        <div class="book-card">
            <img src="images/Big Little Lies.jpg" alt="Book cover: Big Little Lies" class="book-cover" />
            <div class="book-details">
                <div class="book-title">Big Little Lies</div>
                <div class="book-author">Liane Moriarty</div>
                <div class="book-price">$14.99</div>
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="add" />
                    <input type="hidden" name="title" value="Big Little Lies" />
                    <input type="hidden" name="author" value="Liane Moriarty" />
                    <input type="hidden" name="price" value="14.99" />
                    <button type="submit" class="add-to-cart">Add to Cart</button>
                </form>
            </div>
        </div>

    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
