<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup Page</title>
    <style>
        /* Reset default margin and padding */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Global styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* Ensures the footer sticks to the bottom */
        }

        /* Header styles */
        header {
            background-color: #333;
            color: white;
            padding: 10px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            margin-left: 20px;
            font-size: 1.5rem;
        }

        nav ul {
            list-style-type: none;
            margin-right: 20px;
        }

        nav ul li {
            display: inline;
            margin-left: 10px;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            padding: 5px 10px;
        }

        nav ul li a:hover {
            border-radius: 4px;
        }

        /* Signup form container */
        .content {
            flex: 1; /* Takes remaining space, pushing footer to the bottom */
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .signup-container {
            width: 300px;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .signup-container h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        .form-group input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #f00;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #f00b;
        }

        /* Footer styles */
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px 0;
            margin-top: auto; /* Pushes the footer to the bottom */
        }

        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 20px 60px;
            margin-top: 50px;
        }
        .search-container {
            display: flex;
            align-items: center;
            width: 200px;
            border: 1px solid #ccc;
            border-radius: 1px;
            overflow: hidden;
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

<div class="content">
    <div class="signup-container">
        <h2>Signup</h2>
        <form action="/signup" method="POST">
            <div class="form-group">
                <label for="name">Firstname:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="phone_number">Phone number:</label>
                <input type="text" id="phone_number" name="phone_number" required>
            </div>
            <button type="submit">Signup</button>
        </form>
    </div>
</div>

<footer>
    <div class="footer-content">
        <p>&copy; 2024 Your Company. All rights reserved.</p>
    </div>
</footer>
</body>
</html>
