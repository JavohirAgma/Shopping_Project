<%--
  Created by IntelliJ IDEA.
  User: Logitech
  Date: 19.07.2024
  Time: 12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
        }
        .sidebar {
            width: 200px;
            background-color: #333;
            color: white;
            height: 100vh;
            padding-top: 20px;
            position: fixed;
        }

        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }

        .sidebar ul li {
            padding: 15px;
            text-align: center;
        }

        .sidebar ul li a {
            color: white;
            text-decoration: none;
            display: block;
        }

        .sidebar ul li a:hover {
            background-color: #575757;
        }
    </style>
</head>
<body>

<div class="sidebar">
        <ul>
            <li><a href="/userBlock">User block</a></li>
            <li><a href="/productBlock">Product block</a></li>
            <li><a href="/storeBlock">Store block</a></li>
        </ul>
</div>
<h1>WELCOME ADMIN</h1>
</body>
</html>

