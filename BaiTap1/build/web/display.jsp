<%@page import="org.w3c.dom.ls.LSInput"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Connect.ConnectDB, Connect.CanBo" %>


<%@ page import="java.util.*" %>


<%
    String macbQuery = request.getAttribute("macb") != null ? request.getAttribute("macb").toString() : "";
    Boolean isDeleted = null;
    Object isDeleteAttr = request.getAttribute("isDeleted");
    if (isDeleteAttr != null) {
        isDeleted = (boolean) isDeleteAttr;
    }

    ArrayList<CanBo> listCanBo = new ArrayList<>();
    try {
        ConnectDB con = new ConnectDB();
        ResultSet rs = con.getData("select * from canbo");

        while (rs.next()) {
            String MaCB = rs.getString("MaCB");
            String hoTen = rs.getString("hoTen");
            String GioiTinh = rs.getString("GioiTinh");
            double luong = rs.getDouble("luong");

            CanBo cb = new CanBo(MaCB, hoTen, GioiTinh, luong);
            listCanBo.add(cb);

        }
    } catch (Exception e) {
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Display</title>
    </head>
    <body>

        <form action="Delete" method="GET">
            <label>UserName:</label>
            <input value="<%=macbQuery%>" name="macb" placeholder="Mời bạn nhập Ma can bo" required/>
            <button>Xoa</button>
        </form>
        <%
            if (isDeleted != null && isDeleted == false) {
        %>
        <h1>khong the xoa do ban ghi nay khong co: <%=macbQuery%></h1>
        <%
        } else if (isDeleted != null && isDeleted == true) {
        %>
        <h1>Xoa thanh cong: <%=macbQuery%></h1>
        <%
            }
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>Mã CB</th>
                    <th>Họ tên</th>
                    <th>Giới tính</th>
                    <th>Lương</th>
                    <th>Thuế</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (listCanBo.isEmpty()) {

                %>
                <tr>
                    <td>DANH SACH CAN BO TRONG</td>
                </tr>
                <% 
                    } else {
                    for (CanBo cb : listCanBo) {
                %>

                <tr>
                    <td><%=cb.getMaCB()%></td>
                    <td><%=cb.getHoTen()%></td>
                    <td><%=cb.getGioiTinh()%></td>
                    <td><%=cb.getLuong()%></td>
                    <td><%=cb.handleThue()%></td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
    </body>
</html>

