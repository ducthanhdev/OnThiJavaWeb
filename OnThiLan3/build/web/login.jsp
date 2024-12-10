<%-- 
    Document   : login
    Created on : Dec 10, 2024, 3:16:43 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String username = request.getAttribute("username") != null ? request.getAttribute("username").toString() : "";
    String password = request.getAttribute("password") != null ? request.getAttribute("password").toString() : "";
    String msg = request.getAttribute("msg") != null ? request.getAttribute("msg").toString() : "";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
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
                padding: 40px 50px;
                border-radius: 10px;
                box-shadow: 1px 1px 1px #ccc;
            }

            h2 {
                font-size: 30px;
                text-align: center;
            }

            label {
                font-size: 20px;
                font-weight: 600;
                display: block;
                margin-bottom: 6px;
            }

            input {
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                width: 100%;
                margin-bottom: 6px;
            }

            button {
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            button[type="submit"] {
                background-color: #5c87ff;
                color: #fff;
            }

            button[type="reset"] {
                background-color: #ff8686;
                color: #fff;
            }

            button:hover {
                opacity: 0.9;
            }

        </style>
    </head>
    <body>
        <form action="dang-nhap" method="POST">
            <h2>Đăng Nhập</h2>
            <label>email:</label>
            <input value="<%=username%>" name="username" placeholder="Mời bạn nhập username..." required/> <br/>

            <label>password:</label>
            <input <%=password%> name="password" placeholder="Mời bạn nhập password..." required/> <br/>


            <button type="submit">Login</button>
            <button type="reset">Reset</button>
        </form>
        <%            if (!msg.isEmpty()) {
        %> 
        <p style="color: red;"><%= msg%></p> 
        <%
            }
        %>
    </body>
</html>
