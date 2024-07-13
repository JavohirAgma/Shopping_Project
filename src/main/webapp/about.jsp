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

    </style>
</head>
<%Integer id = (Integer) request.getSession().getAttribute("userId");%>
<body>
<header>
    <div class="logo">ShopLogo</div>
    <nav>
        <ul>
            <li><a href="/main">Home</a></li>
            <li><a href="/shop">Shop</a></li>
            <li><a href="/about">About</a></li>
            <%if(id==null){%>
            <li><a href="/login">LogIn</a></li>
            <%}else{%>
            <li><a href="/logOut">LogOut</a></li>
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
