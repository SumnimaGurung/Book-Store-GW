package com.bookstore.Dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/bookstore";
    private String jdbcUsername = "root";
    private String jdbcPassword = "your_password";

    private static final String INSERT_PRODUCT_SQL = "INSERT INTO products (name, price, description) VALUES (?, ?, ?);";
    private static final String SELECT_PRODUCT_BY_ID = "SELECT * FROM products WHERE id = ?";
    private static final String SELECT_ALL_PRODUCTS = "SELECT * FROM products";
    private static final String DELETE_PRODUCT_SQL = "DELETE FROM products WHERE id = ?";
    private static final String UPDATE_PRODUCT_SQL = "UPDATE products SET name = ?, price = ?, description = ? WHERE id = ?";

    protected Connection getConnection() throws SQLException {
        Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        return connection;
    }

    public void insertProduct(Product product) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_SQL)) {
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setString(3, product.getDescription());
            preparedStatement.executeUpdate();
        }
    }

    public Product selectProduct(int id) throws SQLException {
        Product product = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                String description = rs.getString("description");
                product = new Product(id, name, price, description);
            }
        }
        return product;
    }

    public List<Product> selectAllProducts() throws SQLException {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                String description = rs.getString("description");
                products.add(new Product(id, name, price, description));
            }
        }
        return products;
    }

    public boolean deleteProduct(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_PRODUCT_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateProduct(Product product) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_PRODUCT_SQL)) {
            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            statement.setString(3, product.getDescription());
            statement.setInt(4, product.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}
