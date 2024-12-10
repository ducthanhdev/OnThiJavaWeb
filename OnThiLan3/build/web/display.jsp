<%-- 
    Document   : display
    Created on : Dec 10, 2024, 6:25:00 PM
    Author     : ADMIN
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="data.ConnectDB, data.Product"%>
<%@page import="java.sql.*"%>

<%
    ArrayList<Product> listProduct = (ArrayList<Product>) request.getAttribute("list");
    String IDQuery = request.getAttribute("ID") != null ? request.getAttribute("ID").toString() : "";
    double sum = request.getAttribute("sum") != null ? Double.parseDouble(request.getAttribute("sum").toString()) : 0;

    if (listProduct == null) {
        listProduct = new ArrayList<>();
        try {
            ConnectDB con = new ConnectDB();
            ResultSet rs = con.getData("select * from product");
            while (rs.next()) {
                int ID = rs.getInt("ID");
                String ten = rs.getString("ten");
                int soluong = rs.getInt("soluong");
                double dongia = rs.getDouble("dongia");
                Product pr = new Product(ID, ten, soluong, dongia);
                listProduct.add(pr);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <form action="XLTimKiem" method="GET">
            <label>Tìm kiếm:</label>
            <input value="<%= IDQuery%>" name="ID" placeholder="Nhập sản phẩm cần tìm kiếm..." />
            <button type="submit">Tìm Kiếm</button>
        </form>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên sản phẩm</th>
                    <th>Số lượng</th>
                    <th>Đơn giá</th>
                </tr>
            </thead>
            <tbody>
                <%                    if (listProduct.isEmpty()) {
                %>
                <tr>
                    <td>Không tìm thấy sản phẩm nào</td>
                </tr>
                <%
                } else {
                    for (Product pr : listProduct) {
                %>
                <tr>
                    <td><%=pr.getID()%></td>
                    <td><%=pr.getTen()%></td>
                    <td><%=pr.getSoluong()%></td>
                    <td><%=pr.getDongia()%></td>

                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>

            <form action="XLTinhTong" method="GET">
                 <button>Tổng Tiền sản phẩm</button>
            <%
                if(sum != 0) {
            %>
            <h2><%= sum%></h2>
            <%
                }
            %>

            </form>

    </body>
</html>
