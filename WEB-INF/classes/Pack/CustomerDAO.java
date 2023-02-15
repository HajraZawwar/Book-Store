package Pack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CustomerDAO {
    public Customer get_customer_byEmail(String email) {
        Customer required_customer = null;
        try {
            Connection con = new DataBaseHandler().makeConnection();
            PreparedStatement st = con.prepareStatement("select * from customer where Email=?");

            st.setString(1, email);

            ResultSet data = st.executeQuery();
            String name, email2, password;
            if (data.next()) {
                name = data.getString("name");
                email2 = data.getString("email");
                password = data.getString("password");

                required_customer = new Customer(name, email2, password);
            }

        } catch (Exception e) {
            return null;
        }

        return required_customer;
    }

    public static void main(String[] args) {
        Customer req=new CustomerDAO().get_customer_byEmail("umairhassan3@gmail.com");

        if(req!=null){
            System.out.println(req.getName());
        }else{
            System.out.println("no user");
        }
    }
}
