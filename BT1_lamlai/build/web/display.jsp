<%-- 
    Document   : display
    Created on : Dec 10, 2024, 11:19:24 AM
    Author     : ADMIN
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="data.CanBo, data.ConnectDB"%>

<%
    ArrayList<CanBo> listCB = (ArrayList<CanBo>) request.getAttribute("list_cb");
    String MaCB = (String) request.getAttribute("MaCB");
    try {
        if (listCB == null) {
            listCB = new ArrayList<>();
        }

        Object MaCBArr = request.getAttribute("list_cb");
        if (MaCBArr != null) {
            MaCB = MaCBArr.toString();
        }

        ConnectDB con = new ConnectDB();
        ResultSet rs = con.getData("select * from canbo");

        while (rs.next()) {
            String macb = rs.getString("MaCB");
            String hoten = rs.getString("hoTen");
            String gioitinh = rs.getString("GioiTinh");
            double luong = rs.getDouble("luong");

            CanBo cb = new CanBo(macb, hoten, gioitinh, luong);
            listCB.add(cb);

        }
    } catch (Exception e) {
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DisPlay Page</title>
    </head>
    <body>
        <form action="XLTimKiem" method="GET"> 
            <label>Tìm kiếm:</label>
            <input value="<%=(MaCB != null) ? MaCB : ""%>" placeholder="Moi ban nhap ma can bo..." name="macb" required />
            <button type="submit">Tìm Kiếm</button>
        </form>
        <table>
            <thead>
                <tr>
                    <th>Ma can bo</th>
                    <th> Ho va ten</th>
                    <th>Gioi tinh</th>
                    <th>Luong</th>
                    <th>So thue</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (listCB.isEmpty()) {
                %>
                <tr>
                    <td>Khong tim thay can bo!!!</td>
                </tr>
                <%
                } else {
                    for (CanBo cb : listCB) {
                %> 
                <tr>
                    <td><%=cb.getMacb()%></td>
                    <td><%=cb.getHoTen()%></td>
                    <td><%=cb.getGioiTinh()%></td>
                    <td><%=cb.getLuong()%></td>
                    <td><%=cb.Thue()%></td>
                </tr>
                <%
                        }
                    }
                %>

            </tbody>
        </table>
    </body>
</html>
