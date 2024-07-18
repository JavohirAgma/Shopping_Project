<%@ page import="org.example.shoppingproject.model.Product" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
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
        .container {
            max-width: 900px; /* Updated width to accommodate both form and list */
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        input[type="text"], textarea, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .submit {
            background-color: #4CAF50;
            color: white;
            padding: 15px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .submit:hover {
            background-color: #45a049;
        }
        .product-list {
            margin-top: 20px;
        }
        .product-list table {
            width: 100%;
            border-collapse: collapse;
        }
        .product-list th, .product-list td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .product-list th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<% Integer id = (Integer) request.getSession().getAttribute("userId");
    Object shopId = request.getAttribute("shopId"); %>
<% List<Product> products = (List<Product>) request.getAttribute("products"); %>


<header>
    <div class="logo">ShopLogo</div>
<%--    <div class="search-container">--%>
<%--        <input type="text" class="search-input" placeholder="Search products">--%>
<%--        <button class="search-button">--%>
<%--            <i class="bi bi-search">--%>
<%--                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">--%>
<%--                   <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>--%>
<%--                </svg>--%>
<%--            </i>--%>
<%--        </button>--%>
<%--    </div>--%>
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

<div class="container">
    <h1>Create Product</h1>
    <form action="/createProduct" method="post" enctype="multipart/form-data">
        <label for="productName">Product Name:</label>
        <input type="text" id="productName" name="productName" required>

        <label for="price">Product price:</label>
        <input type="text" id="price" name="price" required>

        <input type="hidden" id="shopId" name="shopId" value="<%=shopId%>" required>
        <input type="hidden" id="products" name="products" value="<%=products%>" required>

        <label for="productDescription">Product Description:</label>
        <textarea id="productDescription" name="productDescription" rows="4" required></textarea>
        <input type="file"  name="file" id="file">

        <label for="count">Product Count:</label>
        <input type="number" id="count" name="count" required>


        <label for="productCategory">Category:</label>
        <select id="productCategory" name="productCategory" required>
            <option value="">Select a category</option>
            <option value="ELECTRONICS">Electronics</option>
            <option value="MAISHIY_TEXNIKA">MAISHIY_TEXNIKA</option>
            <option value="KIYIM">KIYIM</option>
            <option value="AKKSESUARLAR">AKKSESUARLAR</option>
            <option value="GOZALLALLIK_PARVARISH">GOZALLALLIK_PARVARISH</option>
            <option value="OZIQ_OVQAT">OZIQ_OVQAT</option>
        </select>

        <button class="submit" type="submit">Create Product</button>
    </form>

    <!-- Product List Section -->
    <div class="product-list">
        <h2>Product List</h2>
        <table>
            <thead>
            <tr>
                <th>Product Name</th>
                <th>Description</th>
                <th>Category</th>
                <th>Count</th>
            </tr>
            </thead>
            <tbody>
            <% if (products != null && !products.isEmpty()){ %>
            <% for (Product product : products) { %>
            <tr>
                <td><%= product.getName() %></td>
                <td><%= product.getDescription() %></td>
                <td><%= product.getCategory() %></td>
                <td><%= product.getCount() %></td>
            </tr>
            <% } %>
            <% } else { %>
            <tr>
                <td colspan="3">No products available.</td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
