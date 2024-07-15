<%@ page import="org.example.shoppingproject.service.ShopService" %>
<%@ page import="org.example.shoppingproject.model.Store" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>To-Do Item Creation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 20px;
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            margin-right: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="date"], textarea {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        button {
            background-color: #28a745;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }
        .todo-list-container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        .todo-item {
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
        }
        .todo-item:last-child {
            border-bottom: none;
        }
    </style>
</head>
<body>
<%ShopService shopService = new ShopService();
    HttpSession session1 = request.getSession();
    Object userId = session1.getAttribute("userId");
%>
<%List<Store> stores = shopService.getStoresWithUserId((Integer) userId);%>
<div class="container">
    <h2>Create To-Do Item for</h2>
    <form action="/createShop" method="post"  id="todoForm" enctype="multipart/form-data">
        <input type="text" name="name" id="name" placeholder="Shop Name" required>
        <button id="add-btn" type="submit">Add Shop</button>
    </form>
</div>

<div class="todo-list-container">
    <h2>To-Do List</h2>
    <div id="todoList">
        <%if (!stores.isEmpty()){%>
        <%for (Store store : stores) {%>
        <div class="todo-item">
            <strong>Name:</strong> <%=store.getName()%><br>
            <strong><a href="/enterShop?shopId=<%store.getId();%>"></a></strong>
        </div>
        <%}}%>
    </div>
</div>

</body>
</html>
