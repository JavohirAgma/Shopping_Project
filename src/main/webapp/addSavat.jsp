<%@ page import="org.example.shoppingproject.model.Product" %>
<%@ page import="org.example.shoppingproject.service.ImageService" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add to Cart with Count</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f4;
        }

        .product {
            text-align: center;
            background: #fff;
            padding: 20px;
            width: 600px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .quantity-control {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 20px 0;
        }

        .quantity-control button {
            background: #007bff;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            outline: none;
            width: 30px;
            height: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 18px;
            border-radius: 5px;
        }

        .quantity-control input {
            width: 50px;
            text-align: center;
            border: 1px solid #ddd;
            padding: 5px;
            font-size: 16px;
            margin: 0 10px;
            border-radius: 5px;
        }

        .add-to-cart {
            background: #28a745;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
        }

        .add-to-cart:hover,
        .quantity-control button:hover {
            opacity: 0.9;
        }
        img{
            max-width: 100%;
            height: auto;
            border-bottom: 1px solid #ddd;
            padding-bottom: 15px;
            margin-bottom: 15px;
        }

    </style>
</head>
<body>
<%Product product = (Product) request.getAttribute("product");
    ImageService imageService = new ImageService();
    String writer = imageService.getWriter(product);
%>
<div class="product">
    <form action="/addSavat" method="post">
        <h2>Product Name</h2>
        <img src="data:image/jpeg;base64,<%=writer%>" alt="Product Image" class="product-image">
        <h2 class="product-name">Name: <%=product.getName()%></h2>
        <p class="product-desc">Description: <%=product.getDescription()%></p>
        <p class="product-price">Price: <%=product.getPrice()+"-sum"%></p>
        <p class="product-count">Count: <%=product.getCount()+" ta"%></p>
        <input name="count" type="number" id="productCount" value="1" min="1" max="<%=product.getCount()%>">
        <input type="hidden" id="id" name="id" value="<%=product.getId()%>" >
        <input type="hidden" id="price" name="price" value="<%=product.getPrice()%>" >
        <input type="hidden" id="storeId" name="storeId" value="<%=product.getStoreId()%>" >
        <button type="submit" class="add-to-cart">Add to Cart</button>
    </form>
</div>

</body>
</html>
