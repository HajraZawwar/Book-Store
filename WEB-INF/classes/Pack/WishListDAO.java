package Pack;

import java.sql.*;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

public class WishListDAO {
    DataBaseHandler db_handler;

    public WishListDAO() {
        db_handler = new DataBaseHandler();
    }

    public boolean AddToWishList(String id, String email) {
        Book res = new BookDOA().getBook(id);
        if (res != null) {
            try {
                Connection con = db_handler.makeConnection();

                PreparedStatement st = con.prepareStatement("select * from wishlist where ItemID=? and UserEmail=?");
                st.setString(1, id);
                st.setString(2, email);
                ResultSet data = st.executeQuery();
                if (data.next()) {
                    return false;
                }
                st = con.prepareStatement("insert into wishlist (ItemID,UserEmail) values(?,?)");

                st.setString(1, id);
                st.setString(2, email);
                int rec = st.executeUpdate();
                con.close();
                if (rec < 1)
                    return false;
            } catch (Exception e) {
                return false;
            }
        } else {
            return false;
        }

        return true;
    }

    public boolean remove_from_wishlist(String id, String email) {
        try {
            Connection con = db_handler.makeConnection();
            PreparedStatement st = con.prepareStatement("delete from wishlist where ItemID=? and UserEmail=?");
            st.setString(1, id);
            st.setString(2, email);
            int rec = st.executeUpdate();
            con.close();
            if (rec < 1)
                return false;
            
        } catch (Exception e) {
            return false;
        }

        return true;
    }

    public ArrayList<Book> GetWishList(String email) {
        ArrayList<Book> li = new ArrayList<>();
        try {
            Connection con = db_handler.makeConnection();
            PreparedStatement st = con.prepareStatement("select * from wishlist where UserEmail=?");
            st.setString(1, email);
            ResultSet data = st.executeQuery();
            Book bk;
            BookDOA bkdao = new BookDOA();
            String bkid;
            while (data.next()) {
                bkid = data.getString("itemID");
                bk = bkdao.getBook(bkid);
                li.add(bk);
            }
            con.close();
        } catch (Exception e) {
            return null;
        }

        return li;
    }

    public static void main(String[] args) {
        WishListDAO wdao = new WishListDAO();
        System.out.println(wdao.AddToWishList("10909", "umairhassan3@gmail.com"));

    }
}
