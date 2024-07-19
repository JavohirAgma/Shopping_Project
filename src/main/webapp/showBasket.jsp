<%@ page import="org.example.shoppingproject.service.ProductService" %>
<%@ page import="org.example.shoppingproject.service.SavatService" %>
<%@ page import="org.example.shoppingproject.model.Basket" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.shoppingproject.service.ShopService" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Show Basket</title>
    <style>
        /* styles.css */

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
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
            width: 80%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        thead tr {
            background-color: #f8f8f8;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f0f0f0;
            color: #333;
        }

        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tbody tr:hover {
            background-color: #f1f1f1;
        }

    </style>
</head>
<body>
<%
    SavatService savatService = new SavatService();
    ProductService productService = new ProductService();
    ShopService shopService = new ShopService();
    Integer userId = (Integer)request.getSession().getAttribute("userId");
    List<Basket> all = savatService.findAll(userId);
    Integer allSum = 0;
%>
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
            <%if(userId==null){%>
            <li><a href="/login">LogIn</a></li>
            <%}else{%>
            <li><a href="/profile">Profile</a></li>
            <%}%>
        </ul>
    </nav>
</header>
<div class="container">
    <h1>Basket</h1>
    <table>
        <thead>
        <tr>
            <th>Product Name</th>
            <th>Store Name</th>
            <th>Count</th>
            <th>Sum Product</th>
            <th>All summ</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <%for (Basket basket : all) {
            Integer a = basket.getCountOfProduct()*basket.getProductSum();
            allSum+=a;
        %>
        <tr>
            <td><%=productService.findNameById(basket.getProductId())%></td>
            <td><%=shopService.findName(basket.getStoreId())%></td>
            <td><%=basket.getCountOfProduct()%></td>
            <td><%=basket.getProductSum()+" sum"%></td>
            <td><%=a+" sum"%></td>
            <td><a href="/delteBasketItem?productId=<%=basket.getProductId()%>&productCount=<%=basket.getCountOfProduct()%>">Delete</a></td>
        </tr>
            <%}%>
        </tbody>
        <h1>Total Sum: <%=allSum%></h1>
        <%if (!all.isEmpty()){%>
        <form action="/showBasket" method="post">
            <button>Payment!!!</button>
        </form>
        <%}%>
    </table>
</div>
</body>
</html>
