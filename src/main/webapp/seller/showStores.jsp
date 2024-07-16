<%@ page import="org.example.shoppingproject.service.ShopService" %>
<%@ page import="org.example.shoppingproject.model.Store" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 20px;
            margin: 0;
        }
        container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            width: 350px;
            margin-right: 20px;
        }
        .container h2 {
            margin-top: 0;
            color: #333;
        }
        form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }
        input[type="text"] {
            width: calc(100% - 16px);
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        button {
            background-color: #007bff;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }
        button:hover {
            background-color: #0056b3;
        }
        .todo-list-container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            width: 350px;
        }
        .todo-list-container h2 {
            margin-top: 0;
            color: #333;
        }
        .todo-item {
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
            color: #333;
        }
        .todo-item:last-child {
            border-bottom: none;
        }
        .todo-item a {
            color: #007bff;
            text-decoration: none;
        }
        .todo-item a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<%
    ShopService shopService = new ShopService();
    HttpSession session1 = request.getSession();
    Integer userId = (Integer) session1.getAttribute("userId");
    List<Store> stores = shopService.getStoresWithUserId(userId);
%>
<div class="todo-list-container">
    <h2>Shop List</h2>
    <div id="todoList">
        <% if (stores != null && !stores.isEmpty()) {%>
        <% for (Store store : stores) { %>
        <div class="todo-item">
            <strong>Name:<a href="/createProduct?shopId=<%=store.getId()%>"> <%=store.getName()%></a></strong>
        </div>
        <% } %>
        <% } else { %>
        <p>No shops found.</p>
        <% } %>
    </div>
</div>
</body>
</html>
