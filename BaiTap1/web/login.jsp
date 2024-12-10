<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Page Login</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f8ff;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            form {
                background-color: #fff;
                padding: 20px 30px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: 400px;
            }

            form label {
                display: block;
                margin-bottom: 10px;
                font-weight: bold;
            }
            form input {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            form button {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }

            form button[type="submit"] {
                background-color: #4caf50;
                color: white;
            }

            form button[type="reset"] {
                background-color: #f44336;
                color: white;
            }

            form button:hover {
                opacity: 0.9;
            }

        </style>
    </head>
    <body>
        <form action="LoginServlet_masv" method="POST">
            <label>UserName:</label>
            <input value="<%=(session.getAttribute("username") != null) ? session.getAttribute("username") : ""%>" name="username" placeholder="Mời bạn nhập username...." required/><br>
            <label>Password:</label>
            <input value="<%=(session.getAttribute("password") != null) ? session.getAttribute("password") : ""%>" name="password" placeholder="Mời bạn nhập password...." required/><br>
            <button type="submit">Login</button>
            <button type="reset">Reset</button>
        </form>\
        <h1><%=(session.getAttribute("msg") != null) ? session.getAttribute("msg") : ""%></h1>

    </body>
</html>
