package Pack;

import java.sql.*;
import java.util.*;

public class CartDAO {
    public String CartEntry(String email, Book b, int quantity) {
        try {
            Connection con = new DataBaseHandler().makeConnection();
            PreparedStatement st = con.prepareStatement("select * from carts where email=? and Items=?");
            st.setString(1, email);
            st.setString(2, b.getBookid());
            ResultSet data = st.executeQuery();
            Cart current_cart;
            if (data.next()) {

                st = con.prepareStatement("update carts set quantity=quantity+? where email=? and Items=?");
                st.setInt(1, quantity);
                st.setString(2, email);
                st.setString(3, b.getBookid());
                int rec = st.executeUpdate();
                if (rec > 0)
                    return "success";
                // current_cart = getCart(data);
                // return append_values(email, b, quantity, data);

            } else {
                return make_cart(email, b, quantity);
            }
        } catch (Exception e) {
            return e.toString();
        }

        return "fail";
    }

    // ____________________GET THE CART IF DATA ALREADY EXISTS _________
    public Cart getCart(ResultSet data) throws Exception {
        String id = data.getString("CartID");
        String email = data.getString("Email");
        String items = data.getString("Items");
        String quantity = data.getString("quantity");
        String price = data.getString("Price");

        Cart current_cart = new Cart(id, email, items, price, quantity);
        return current_cart;
    }

    // ______________________ MAKE A NEW CART FOR THE USER _________________>
    public String make_cart(String email, Book b, int quantity) {
        try {
            Connection con = new DataBaseHandler().makeConnection();
            PreparedStatement st = con
                    .prepareStatement("insert into carts (CartID,Email,Items,Price,quantity) values(?,?,?,?,?)");

            String unique_id = UUID.randomUUID().toString();
            st.setString(1, unique_id);
            st.setString(2, email);
            st.setString(3, b.getBookid());
            st.setInt(4, Integer.parseInt(b.getPrice()));
            st.setInt(5, quantity);

            int res = st.executeUpdate();
            if (res > 0)
                return "success";
            return "fail";
        } catch (Exception e) {
            return e.toString();
        }

    }

    // _________________________ CHECK IF A BOOK EXISTS IN YOUR CART OR NOT ... IF
    // IT EXISTS THEN JUST INCREMENT
    // _________________________ THE PRICE AND QUANTITY
    // _______________________________________________
    public boolean book_exists(Book bk, ResultSet data) {
        try {
            String[] args = data.getString("Items").split(",");
            for (String s : args) {
                if (s.equals(bk.getBookid()))
                    return true;
            }
        } catch (Exception e) {
            return false;
        }
        return false;
    }

    // _____________________ SEARCH CART AND RETURN VALUES AND THEN DISPLAY ON VIEW
    // Page

    public ArrayList<Cart> search_carts(String email) {
        ArrayList<Cart> li = new ArrayList<>();
        try {
            Connection con = new DataBaseHandler().makeConnection();
            PreparedStatement st = con.prepareStatement("select * from carts where email=?");
            st.setString(1, email);
            ResultSet data = st.executeQuery();

            while (data.next()) {
                li.add(getCart(data));
            }
        } catch (Exception e) {
            return null;
        }
        return li;
    }

    // _________________ REMOVE ITEMS FROM CART_________
    public boolean remove_item(String cart_id) {
        try {
            Connection con = new DataBaseHandler().makeConnection();
            PreparedStatement st = con.prepareStatement("delete from carts where CartID=?");
            st.setString(1, cart_id);
            int record = st.executeUpdate();

            if (record > 0)
                return true;
        } catch (Exception e) {
            return false;
        }
        return false;
    }

    /*
     * ________________ REMOVE ALL CARTS OF A USER _____ SPECIALLY WHEN USER HAS
     * PLACED ORDER THEN WE WILL USE THIS
     */

    public String removeCarts(String email) {
        try {
            Connection con = new DataBaseHandler().makeConnection();
            PreparedStatement st = con.prepareStatement("delete from carts where Email=?");
            st.setString(1, email);

            int rec = st.executeUpdate();

            if (rec > 0)
                return "true";
            else
                return "false";
        } catch (Exception e) {
            return e.toString();
            
        }
    }

    public static void main(String[] args) {
        System.out.println(new CartDAO().remove_item("476e544c-7cbb-4324-9993-125d2c32f491"));

    }
}
