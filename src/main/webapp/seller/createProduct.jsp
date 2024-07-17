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
        button {
            background-color: #4CAF50;
            color: white;
            padding: 15px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
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
<% Object shopId = request.getAttribute("shopId"); %>
<% List<Product> products = (List<Product>) request.getAttribute("products"); %>
<div class="container">
    <h1>Create Product</h1>
    <form action="/createProduct" method="post" enctype="multipart/form-data">
        <label for="productName">Product Name:</label>
        <input type="text" id="productName" name="productName" required>

        <input type="hidden" id="shopId" name="shopId" value="<%=shopId%>" required>
        <input type="hidden" id="products" name="products" value="<%=products%>" required>

        <label for="productDescription">Product Description:</label>
        <textarea id="productDescription" name="productDescription" rows="4" required></textarea>

        <input type="file"  name="file" id="file">


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

        <button type="submit">Create Product</button>
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
            </tr>
            </thead>
            <tbody>
            <%-- Assuming you have a list of products in a request attribute --%>
            <% if (products != null && !products.isEmpty()) { %>
            <% for (Product product : products) { %>
            <tr>
                <td><%= product.getName() %></td>
                <td><%= product.getDescription() %></td>
                <td><%= product.getCategory() %></td>
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
