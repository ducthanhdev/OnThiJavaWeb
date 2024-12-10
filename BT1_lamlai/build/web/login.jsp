<%-- 
    Document   : login
    Created on : Dec 10, 2024, 11:02:05 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="data.ConnectDB, data.CanBo"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Page Login</title>
    </head>
    <body>
        <form action="LoginServlet" method="POST"> 
            <h2>DANG NHAP</h2>
            <label>username:</label>
            <input placeholder="Moi ban nhap username..." name="username" required /><br/>
            <label>password:</label>
            <input placeholder="Moi ban nhap password..." name="password" required /><br/>
            <button type="subnmit">Login</button>            
            <button type="reset">Reset</button>

        </form>
    </body>
</html>
