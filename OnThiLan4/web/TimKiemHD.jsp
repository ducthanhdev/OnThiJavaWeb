<%-- 
    Document   : TimKiemHD
    Created on : Dec 11, 2024, 9:30:55 AM
    Author     : ADMIN
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connect.ConnectDB, Connect.HoaDon"%>
<%@page import="java.sql.*"%>



<%
    ArrayList<HoaDon> listHD = new ArrayList<>();

    try {
        ConnectDB con = new ConnectDB();
        ResultSet rs = con.getData("select * from hoadon");
        while (rs.next()) {
            int MaHD = rs.getInt("ID");
            String MaKH = rs.getString("MaKH");
            Date NgayHD = rs.getDate("NgayHD");
            double SoKW = rs.getDouble("SoKW");

            HoaDon hd = new HoaDon(MaHD, MaKH, NgayHD, SoKW);
            listHD.add(hd);
        }
    } catch (Exception e) {
        System.out.println("Error" + e.toString());
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TimKiemHD</title>
    </head>
    <body>
        <table>
            <thead>
                <tr>
                    <th>Mã hóa đơn</th>
                    <th>Mã khách hàng</th>
                    <th>Ngày ghi hóa đơn</th>                                                                                                                                             
                    <th>Số KW</th>
                    <th>Thành tiền</th>
                </tr>
            </thead>
            <tbody>
                <%                    if (listHD.isEmpty()) {
                %>
                <tr>
                    <td colspan="4">Không tìm thấy hóa đơn nào!</td>
                </tr>
                <%
                } else {
                    for (HoaDon hd : listHD) {
                %>
                <tr>
                    <td><%=hd.getMaHD()%></td>
                    <td><%=hd.getMaKH()%></td>
                    <td><%=hd.getNgayHD()%></td>
                    <td><%=hd.getSoKW()%></td>
                    <td><%=hd.handleThanhTien()%></td>

                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
