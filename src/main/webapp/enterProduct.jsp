<%@ page import="org.example.shoppingproject.service.ProductService" %>
<%@ page import="org.example.shoppingproject.model.Product" %>
<%@ page import="org.example.shoppingproject.service.ImageService" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Card</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        .wrapper{
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
            margin: 0;
        }
        .wrapper img{
            max-width: 100%;
            height: auto;
            border-bottom: 1px solid #ddd;
            padding-bottom: 15px;
            margin-bottom: 15px;
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

        .product-card {
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 600px;
            padding: 10px;
            text-align: center;
        }

        .product-image {
            width: 100%;
            height: auto;
            border-radius: 10px;
        }

        .product-name {
            font-size: 20px;
            margin: 10px 0;
        }

        .product-desc {
            font-size: 20px;
            color: #555;
            margin: 10px 0;
        }

        .product-price {
            font-size: 20px;
            color: #333;
            margin: 10px 0;
        }
        .product-count {
            font-size: 20px;
            color: #333;
            margin: 10px 0;
        }

        .add-to-cart {
            background-color: #ff6600;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .add-to-cart:hover {
            background-color: #e65c00;
        }
    </style>
</head>
<%
    Integer id = (Integer) request.getSession().getAttribute("userId");
    ProductService productService = new ProductService();
    Integer productId = (Integer)request.getAttribute("productId");
    Product product = productService.getProductById(productId);
    ImageService imageService= new ImageService();
    String writer = imageService.getWriter(product);
%>
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
<div class="wrapper">
<div class="product-card">
    <form action="/addSavat" method="get">
        <img src="data:image/jpeg;base64,<%=writer%>" alt="Product Image" class="product-image">
        <h2 class="product-name">Name: <%=product.getName()%></h2>
        <p class="product-desc">Description: <%=product.getDescription()%></p>
        <p class="product-price">Price: <%=product.getPrice()+"-sum"%></p>
        <p class="product-count">Count: <%=product.getCount()+" ta"%></p>


        <input type="hidden" id="id" name="id" value="<%=product.getId()%>" >
        <input type="hidden" id="name" name="name" value="<%=product.getName()%>" >
        <input type="hidden" id="desc" name="desc" value="<%=product.getDescription()%>" >
        <input type="hidden" id="price" name="price" value="<%=product.getPrice()%>" >
        <input type="hidden" id="count" name="count" value="<%=product.getCount()%>" >
        <input type="hidden" id="storeId" name="storeId" value="<%=product.getStoreId()%>" >

        <button class="add-to-cart">Add savat</button>
    </form>
</div>
</div>
</body>
</html>
