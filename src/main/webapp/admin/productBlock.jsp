<%@ page import="org.example.shoppingproject.service.ProductService" %>
<%@ page import="org.example.shoppingproject.service.UserService" %>
<%@ page import="org.example.shoppingproject.model.Product" %>
<%@ page import="org.example.shoppingproject.service.ShopService" %><%--
  Created by IntelliJ IDEA.
  User: Logitech
  Date: 19.07.2024
  Time: 13:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Block Page</title>
    <style>
        /* styles.css */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .user-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .user-table th, .user-table td {
            padding: 12px 15px;
            text-align: left;
        }

        .user-table th {
            background-color: #007BFF;
            color: #fff;
        }

        .user-table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .user-table tr:hover {
            background-color: #ddd;
        }

        .user-table td {
            border-bottom: 1px solid #ddd;
        }
    </style>
</head>
<body>
<%
    ProductService productService =new ProductService();
    UserService userService = new UserService();
    ShopService shopService = new ShopService();
%>
<div class="container">
    <h1>User Information</h1>
    <table class="user-table">
        <thead>
        <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Store Name</th>
            <th>Status</th>
        </tr>
        </thead>
        <tbody>
        <%for (Product product : productService.getAll()) {%>
        <tr>
            <td><%=product.getId()%></td>
            <td><%=product.getName()%></td>
            <td><%=shopService.getStore(product.getStoreId())%>></td>
            <%if (product.isOpen()){%>
            <td><a href="/productBlock?productId=<%=product.getStoreId()%>">Active</a></td>
            <%} else {%>
            <td><a href="/productBlock?productId=<%=product.getStoreId()%>">Not Active</a></td>
            <%}%>
        </tr>
        <%}%>
        </tbody>
    </table>
</div>
</body>
</html>
