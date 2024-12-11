package Connect;

import java.sql.*;

public class ConnectDB {

    private final Connection con;

    public ConnectDB() {
        this.con = connection();
    }

    private Connection connection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/qlhoadon", "root", "");
        } catch (Exception e) {
            return null;
        }
    }

    public ResultSet getData(String query) throws SQLException {
        Statement stm = this.con.createStatement();
        ResultSet rs = stm.executeQuery(query);
        return rs;
    }
    
    public boolean Delete(String MaCB) throws SQLException{
        PreparedStatement prstm = this.con.prepareCall("delete from canbo where MaCB = ?");
        prstm.setString(1, MaCB);
        return prstm.executeUpdate() > 0;
    }

}