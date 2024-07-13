<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        header {
            background-color: #333;
            color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 4px 10px;
        }

        .logo {
            font-size: 1.5em;
        }

        nav ul {
            list-style-type: none;
            padding: 0;
        }

        nav ul li {
            display: inline;
            margin-left: 20px;
        }

        nav ul li a {
            color: #fff;
            text-decoration: none;
        }

        nav ul li a:hover {
            text-decoration: underline;
        }

        .login-container {
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
            text-align: center;
        }
        .login-container{
            margin-top: 160px;
        }

        .login-container h2 {
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

       .login-container input[type=text], input[type=password] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

      .login-container  button[type=submit] {
            background-color: #f00;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

       .login-container button[type=submit]:hover {
            background-color: #f00c;
        }

        .links {
            margin-top: 15px;
        }

        .links a {
            color: #333;
            text-decoration: none;
        }

        .links a:hover {
            text-decoration: underline;
        }
        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 20px 60px;
            margin-top: 185px;
        }

        .search-container {
            display: flex;
            align-items: center;
            width: 200px;
            border: 1px solid #ccc;
            border-radius: 1px;
            overflow: hidden;
            background-color: #fff;
        }

        .search-input {
            flex: 1;
            padding: 5px;
            border: none;
            outline: none;
            font-size: 10px;
        }

        .search-button {
            background-color: #f0f0f0;
            border: none;
            padding: 1px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
        }

    </style>
</head>
<body>
<header>
    <div class="logo">ShopLogo</div>
    <div class="search-container">
        <input type="text" class="search-input" placeholder="Search products">
        <button class="search-button">
            <i class="bi bi-search"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
            </svg></i>
        </button>
    </div>
    <nav>
        <ul>
            <li><a href="/main">Home</a></li>
            <li><a href="/shop">Shop</a></li>
            <li><a href="/about">About</a></li>
            <li><a href="/login">LogIn</a></li>
        </ul>
    </nav>
</header>

<%String today = (String) request.getAttribute("today");%>

<div class="login-container">
    <h2>Login <%=today%></h2>
    <form action="/login" method="POST">
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit">Login</button>
    </form>
    <div class="links">
        <a href="/signup">Don't have an account? Sign Up</a>
    </div>
</div>
<footer>
    <p>&copy; 2024 ShopLogo. All rights reserved.</p>
</footer>


</body>
</html>

