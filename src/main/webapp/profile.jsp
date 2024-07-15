<%@ page import="lombok.val" %>
<%@ page import="org.example.shoppingproject.service.UserService" %>
<%@ page import="org.example.shoppingproject.model.User" %>
<%@ page import="org.example.shoppingproject.enums.UserRole" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
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

        .content {
            margin-left: 200px;
            padding: 20px;
            width: calc(100% - 200px);
        }

        .profile-container {
            max-width: 600px;
            margin: 50px auto;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .profile-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .profile-header h1 {
            margin: 0;
            font-size: 2em;
        }

        .profile-header p {
            color: #666;
            font-size: 1em;
            margin: 5px 0 0;
        }

        .profile-details {
            list-style-type: none;
            padding: 0;
        }

        .profile-details li {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #eee;
        }

        .profile-details li:last-child {
            border-bottom: none;
        }

        .profile-details span {
            font-weight: bold;
            color: #333;
        }

        status {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 5px;
            color: white;
            background-color: green;
            font-size: 0.9em;
        }

        .become-seller-btn {
            display: block;
            width: 100%;
            padding: 10px;
            text-align: center;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
            font-size: 1em;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }

        .become-seller-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<%HttpSession session1 = request.getSession();
    Integer id =(Integer) session1.getAttribute("userId");
    UserService userService= new UserService();
    User user = userService.get(id);
    List<UserRole> role = user.getRole();
    int size = role.size();
%>
<div class="sidebar">
    <ul>
        <li><a href="/main.jsp">Home</a></li>
        <li><a href="#">Categories</a></li>
        <li><a href="/settings">Settings</a></li>
        <li><a href="/logOut">LogOut</a></li>
        <%if (size>=2){%>
        <li><a href="/createShop">create shop</a></li>
        <%}%>
    </ul>
</div>

<div class="content">
    <div class="profile-container">
        <div class="profile-header">
            <h1> <%=user.getName()%></h1>
            <p>Username: <%=user.getUserName()%></p>
        </div>
        <ul class="profile-details">
            <li>
                <span>Email:</span> <%=user.getEmail()%>
            </li>
            <li>
                <span>Phone Number:</span> <%=user.getPhone()%>
            </li>
            <li>
                <span>Status: </span>
                 <%for (int i=0;i<role.size();i++) {%>
                <% if (i+1==role.size()){%>
                <%=role.get(i).toString()%>
                <%} else{%>
                <%=role.get(i).toString()+", "%>
                <%}%>
                <%}%>
            </li>
        </ul>
        <%if (size==1){%>
        <form action="/becomeSeller" method="post">
            <button class="become-seller-btn" type="submit">Become a Seller</button>
        </form>
        <%}%>
    </div>
</div>
</body>
</html>
