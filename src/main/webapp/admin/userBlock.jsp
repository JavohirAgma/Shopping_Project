<%@ page import="org.example.shoppingproject.service.UserService" %>
<%@ page import="org.example.shoppingproject.model.User" %><%--
  Created by IntelliJ IDEA.
  User: Logitech
  Date: 19.07.2024
  Time: 13:32
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
<%HttpSession session1 = request.getSession();
    Integer id =(Integer) session1.getAttribute("userId");
    UserService userService= new UserService();
%>
    <div class="container">
        <h1>User Information</h1>
        <table class="user-table">
            <thead>
            <tr>
                <th>User ID</th>
                <th>Username</th>
                <th>Email</th>
                <th>Status</th>
            </tr>
            </thead>
            <tbody>
            <%for (User user : userService.getAll(id)) {%>
            <tr>
                <td><%=user.getId()%></td>
                <td><%=user.getUserName()%></td>
                <td><%=user.getEmail()%></td>
                <%if (user.getIsActive()){%>
                <td><a href="/userBlock?userId=<%=user.getId()%>">Active</a></td>
                <%} else {%>
                <td><a href="/userBlock?userId=<%=user.getId()%>">Not Active</a></td>
                <%}%>
            </tr>
            <%}%>
            </tbody>
        </table>
    </div>
</body>
</html>

