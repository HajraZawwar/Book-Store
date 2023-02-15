package Pack;

import java.sql.*;

public class AdminDAO {

    DataBaseHandler db_handler;
    Utilities util;

    public AdminDAO() {
        db_handler = new DataBaseHandler();
        util = new Utilities();
    }

    public String RegisterAdmin(Admin ad) {
        try {
            Connection con = db_handler.makeConnection();
            PreparedStatement st = con.prepareStatement("insert into Admin (Name,Email,password) values(?,?,?)");
            String name = ad.getName(), email = ad.getEmail(), password = ad.getPassword();

            if(name==null || email==null || password==null) return "Fields are empty";
            
            st.setString(1, name);
            st.setString(2, email);
            st.setString(3, password);
            String result = util.Verify_Details(name, email, password);
            if (!(result.equals("success")))
                return result;

            st.executeUpdate();
        } catch (SQLException e) {
            return "Email is already in use please try another one";
        } catch (Exception e) {
            return "Facing problem in database connectivity";
        }

        return "Added Successfuly";
    }

    public static void main(String[] args) {
      
    }
}
