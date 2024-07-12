<%--
  Created by IntelliJ IDEA.
  User: xushnudxurramov
  Date: 07/07/24
  Time: 21:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<form action="/" method="post" >
    <div class="congratulations">
        <h1>Congratulations!</h1>
        <p>Your todo has been saved successfully</p>
        <p>Keep up the great work!</p>
        <button type="submit">Back</button>
    </div>
</form>
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-color: #f0f0f0;
    }

    .congratulations {
        text-align: center;
        background-color: #ffffff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    }

    h1 {
        color: #007bff;
        font-size: 3em;
        margin-bottom: 10px;
    }

    p {
        font-size: 1.5em;
        color: #333;
        margin-top: 0;
        line-height: 1.6;
    }

    button {
        background-color: #007bff;
        color: white;
        padding: 10px 20px;
        font-size: 1.2em;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    button:hover {
        background-color: #0056b3;
    }
</style>


</body>
</html>
