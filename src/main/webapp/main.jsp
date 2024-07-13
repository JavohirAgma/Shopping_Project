<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Project</title>
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
            padding: 15px 20px;
        }

        header .logo {
            font-size: 1.5em;
        }

        header nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
        }

        header nav ul li {
            margin-left: 20px;
        }

        header nav ul li a {
            color: #fff;
            text-decoration: none;
            font-size: 1em;
        }

        .products {
            padding: 50px 20px;
            text-align: center;
        }

        .products h2 {
            font-size: 2.5em;
            margin-bottom: 20px;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
        }

        .product-item {
            background-color: #f9f9f9;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            text-align: center;
        }

        .product-item img {
            max-width: 100%;
            height: auto;
            border-bottom: 1px solid #ddd;
            padding-bottom: 15px;
            margin-bottom: 15px;
        }

        .product-item h3 {
            font-size: 1.2em;
            margin: 0 0 10px;
        }

        .product-item p {
            font-size: 1em;
            color: #333;
            margin: 0;
        }

        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 20px 0;
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
<%Integer id = (Integer) request.getSession().getAttribute("userId");%>
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
            <%if(id==null){%>
            <li><a href="/login">LogIn</a></li>
            <%}else{%>
            <li><a href="/profile">Profile</a></li>
            <%}%>
        </ul>
    </nav>
</header>

<section class="products">
    <h2>Featured Products</h2>
    <div class="product-grid">
        <div class="product-item">
            <img src="product1.jpg" alt="Product 1">
            <h3>Product 1</h3>
            <p>$19.99</p>
        </div>
        <div class="product-item">
            <img src="product2.jpg" alt="Product 2">
            <h3>Product 2</h3>
            <p>$29.99</p>
        </div>
        <div class="product-item">
            <img src="product3.jpg" alt="Product 3">
            <h3>Product 3</h3>
            <p>$39.99</p>
        </div>
        <div class="product-item">
            <img src="product4.jpg" alt="Product 4">
            <h3>Product 4</h3>
            <p>$49.99</p>
        </div>
    </div>
</section>

<footer>
    <p>&copy; 2024 ShopLogo. All rights reserved.</p>
</footer>
</body>
</html>