package Pack;

import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class DataBaseHandler {
    public Connection makeConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3307/bookstore";
            Connection con = DriverManager.getConnection(url, "root", "umair");

            return con;
        } catch (Exception exp) {
            return null;
        }
    }
}
