<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>403 Forbidden</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
            text-align: center;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
        }

        .error-code {
            font-size: 120px;
            font-weight: bold;
            color: #e74c3c;
        }

        .error-message {
            font-size: 24px;
            margin: 10px 0;
            color: #555;
        }

        .error-description p {
            margin: 0 0 10px;
        }

        .actions {
            margin-top: 20px;
        }

        .home-link, .contact-link {
            text-decoration: none;
            color: #3498db;
            font-weight: bold;
            margin: 0 10px;
        }

        .home-link:hover, .contact-link:hover {
            text-decoration: underline;
        }


    </style>
</head>
<body>
<div class="container">
    <div class="error-code">403</div>
    <div class="error-message">Forbidden</div>
    <div class="error-description">
        <p>Sorry, you don't have permission to access this page.</p>
        <p>You might not have the right credentials or the resource may be restricted.</p>
    </div>
    <div class="actions">
        <a href="/" class="home-link">Return to Homepage</a>
        <a href="mailto:support@example.com" class="contact-link">Contact Support</a>
    </div>
</div>
</body>
</html>
