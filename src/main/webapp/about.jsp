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



        .products h2 {
            font-size: 2.5em;
            margin-bottom: 20px;
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

        .about {
            background-color: #f9f9f9;
            padding: 50px 20px;
            text-align: center;
        }

        .about h2 {
            font-size: 2.5em;
            margin-bottom: 20px;
        }

        .about p {
            font-size: 1.2em;
            line-height: 1.6;
            color: #333;
            margin-bottom: 20px;
        }

        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 20px 0;
        }
        footer {
            margin-top:280px;
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
            <li><a href="/profile">LogOut</a></li>
            <%}%>
        </ul>
    </nav>
</header>



<section class="about">
    <h2>About Us</h2>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla convallis libero et purus tincidunt condimentum. Quisque gravida felis at turpis fermentum, sed facilisis velit hendrerit. Nullam eget nulla in leo dignissim ultricies. Phasellus feugiat arcu at felis hendrerit, nec volutpat ligula condimentum. Suspendisse rutrum mauris sit amet pulvinar pellentesque. Fusce scelerisque ipsum id dapibus vehicula. In hac habitasse platea dictumst.</p>
    <p>Vestibulum tincidunt magna a sem vulputate, vitae rutrum tortor sagittis. Nullam eget lacus sit amet quam pharetra ultrices. Proin tincidunt consectetur risus, ac elementum justo faucibus nec. Fusce nec purus mauris. Duis et tellus eget ligula varius iaculis. Integer nec lectus dolor. Mauris quis sollicitudin nisi.</p>
</section>

<footer>
    <p>&copy; 2024 ShopLogo. All rights reserved.</p>
</footer>
</body>
</html>
