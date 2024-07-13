<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Congratulations Page</title>
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
            background-color: #f0f0f0;
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

        /* Content styles */
        .content {
            flex: 1; /* Takes remaining space, pushing footer to the bottom */
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .Not_congratulations {
            text-align: center;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 100%;
        }

        h4 {
            color: #333;
            font-size: 2em;
            margin-bottom: 10px;
        }

        p {
            font-size: 1.5em;
            color: #333;
            margin-top: 0;
            line-height: 1.6;
        }

        button {
            background-color: #f00;
            color: white;
            padding: 10px 20px;
            font-size: 1.2em;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #f00b;
        }

        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            margin-top: auto; /* Pushes the footer to the bottom */
            width: 100%;
        }

        footer p {
            margin: 0;
            color:#fff;
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
    <div class="Not_congratulations">
        <h4>Unfortunatily!</h4>
        <p>Email or phone Number Already exists</p>
        <form action="/signup" method="get">
            <button type="submit">Back</button>
        </form>
    </div>
</div>

<footer>
    <p>&copy; 2024 ShopLogo. All rights reserved.</p>
</footer>
</body>
</html>
