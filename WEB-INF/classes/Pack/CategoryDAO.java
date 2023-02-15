package Pack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CategoryDAO {
    public String add_category(Category cat) {
        String cname = cat.getCname();
        String result;

        try {
            Connection con = new DataBaseHandler().makeConnection();
            PreparedStatement st = con.prepareStatement("select * from categories where CategoryName=?");
            st.setString(1, cname);
            ResultSet data = st.executeQuery();

            if (data.next()) {
                result = "already exists";
                return result;
            }

            st = con.prepareStatement("insert into categories (CategoryName) values(?)");
            st.setString(1, cname);

            int res = st.executeUpdate();
            if (res > 0)
                result = "Category is added";
            else
                result = "fail";

        } catch (Exception e) {
            result = e.toString();
        }
        return result;
    }

    // ------------------------------------------------------------------->
    public ArrayList<Category> getcategories() {
        ArrayList<Category> li = new ArrayList<>();

        try {
            Connection con = new DataBaseHandler().makeConnection();
            PreparedStatement st = con.prepareStatement("select * from categories");
            ResultSet data = st.executeQuery();

            while (data.next()) {
                li.add(new Category(data.getString("CategoryName")));
            }
        } catch (Exception e) {
            return null;
        }
        return li;
    }

    // -------------------------------------------------------------------->
    public String RemoveCategory(String cname) {
        String result;
        BookDOA bkdoa=new BookDOA();
        if(!bkdoa.RemoveByCategory(cname)) return "Fail";
       
        try {
            Connection con = new DataBaseHandler().makeConnection();
            PreparedStatement st = con.prepareStatement("delete from categories where CategoryName=?");
            st.setString(1,cname);
            int d = st.executeUpdate();

            if (d > 0)
                result = "success";
            else
                result = "Your given category doesn't exist";
        } catch (Exception e) {
            result = "failed to remove";
        }

        return result;
    }

    public static void main(String[] args) {
        System.out.println(new CategoryDAO().RemoveCategory("poetry"));
    }

}
