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

        .featured {
            background: url('featured.jpg') no-repeat center center/cover;
            color: #fff;
            text-align: center;
            padding: 100px 20px;
        }

        .featured h1 {
            font-size: 3em;
            margin: 0;
        }

        .featured p {
            font-size: 1.2em;
            margin: 10px 0;
        }

        .featured .btn {
            background-color: #f00;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            font-size: 1em;
            border-radius: 5px;
            margin-top: 20px;
            display: inline-block;
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
    </style>
</head>
<body>
<header>
    <div class="logo">ShopLogo</div>
    <nav>
        <ul>
            <li><a href="#home">Home</a></li>
            <li><a href="#shop">Shop</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
            <li><a href="#sign">Sign</a></li>
        </ul>
    </nav>
</header>

<section class="featured">
    <h1>Welcome to Our Shop</h1>
    <p>Discover our exclusive collection</p>
    <a href="#shop" class="btn">Shop Now</a>
</section>

<section class="products">
    <h2>Featured Products</h2>
    <div class="product-grid">
        <div class="product-item">
            <img src="product1.jpg" alt="Product 1">
            <h3>Product 1</h3>
            <p>$19.99</p>
        </div>
    </div>
</section>

<footer>
    <p>&copy; 2024 ShopLogo. All rights reserved.</p>
</footer>
</body>
</html>