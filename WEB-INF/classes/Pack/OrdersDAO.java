package Pack;

import java.io.IOException;
import java.sql.*;
import java.util.*;

public class OrdersDAO {

    public boolean placeOrder(String email) {
        try {
            Connection con = new DataBaseHandler().makeConnection();

            // first of all get the cart items of user...
            ArrayList<Cart> li = new CartDAO().search_carts(email);
            if (li.size() == 0) {
                return false;
            }
            int quantity = 0, price = 0, current_price;
            // calculate the total price and quantity of items in a order...
            for (Cart ct : li) {
                current_price = (Integer.parseInt(ct.getPrice()));
                quantity += (Integer.parseInt(ct.getQuantity()));

                price += (current_price * quantity);
            }

            PreparedStatement st = con
                    .prepareStatement("insert into orders (OrderID,email,Price,Status,quantity) values(?,?,?,?,?)");
            String order_id = UUID.randomUUID().toString();
            st.setString(1, order_id);
            st.setString(2, email);
            st.setInt(3, price);
            st.setString(4, "pending");
            st.setInt(5, quantity);

            int rec = st.executeUpdate();
            if (rec < 1)
                return false;

            // Now add these items and their individual quantites inside ordered items table
            // so that we can
            // keep track that how many books were ordered...
            st = con.prepareStatement("insert into ordereditems (itemID,OrderID,Quantity) values(?,?,?)");

            for (Cart ct : li) {
                st.setString(1, ct.getItems());
                st.setString(2, order_id);
                st.setInt(3, Integer.parseInt(ct.getQuantity()));

                rec = st.executeUpdate();
                if (rec < 1)
                    return false;
            }

            CartDAO ctdao = new CartDAO();
            ctdao.removeCarts(email);

        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
        return true;
    }

    public ArrayList<Order> get_orders() {
        ArrayList<Order> li = new ArrayList<>();
        int i = 0;
        try {
            Connection con = new DataBaseHandler().makeConnection();
            PreparedStatement st = con.prepareStatement("select * from orders");

            ResultSet data = st.executeQuery();
            String id, email, price, status;
            int quantity;
            while (data.next()) {
                id = data.getString("OrderID");
                email = data.getString("email");
                price = data.getString("price");
                status = data.getString("Status");
                quantity = data.getInt("quantity");
                i++;
                li.add(new Order(id, email, price, status, quantity));
            }

        } catch (Exception e) {

            li.add(new Order(e.toString(), "umair@gmail.com", "90", "pending", 90));
            return li;
        }

        return li;
    }

    public String remove_order(String id) {
        String res;
        try {
            Connection con = new DataBaseHandler().makeConnection();
            PreparedStatement st = con.prepareStatement("delete from orders where OrderID=?");

            st.setString(1, id);
            int rec = st.executeUpdate();

            if (rec > 0)
                res = "success";
            else
                res = "failure";
        } catch (Exception exp) {
            return exp.toString();
        }

        return res;
    }

    public Order getAnOrder(String id) {
        Order result_order = new Order();
        try {
            Connection con = new DataBaseHandler().makeConnection();
            PreparedStatement st = con.prepareStatement("select * from orders where OrderID=?");

            st.setString(1, id);

            ResultSet data = st.executeQuery();
            String oid, email, price, status;
            int quantity;

            if (data.next()) {
                id = data.getString("OrderID");
                email = data.getString("email");
                price = data.getString("price");
                status = data.getString("Status");
                quantity = data.getInt("quantity");
                result_order = new Order(id, email, price, status, quantity);
            }

        } catch (Exception e) {
            return null;
        }

        return result_order;
    }

    public String changeStatus(String new_status, String oid) {

        if (new_status.equals("received")) {
            remove_order(oid);
            return "removed";
        }
        String res;
        String current_status;
        try {
            Connection con = new DataBaseHandler().makeConnection();
            PreparedStatement st = con.prepareStatement("select * from orders where OrderID=?");

            st.setString(1, oid);
            ResultSet data = st.executeQuery();
            if (data.next()) {
                current_status = data.getString("status");
            } else {
                return "failed bcz not found";
            }

            if (new Utilities().Status_Method_Allowed(current_status, new_status)) {
                st = con.prepareStatement("update orders set Status=? where OrderID=? ");
                st.setString(1, new_status);
                st.setString(2, oid);

                st.executeUpdate();
                res = "success";
            } else {
                return "fail bcz method is not allowed";
            }

        } catch (Exception iox) {
            return "failed";
        }

        return res;
    }

    // __________________ GET THE BOOKS INSIDE AN ORDER _________
    public ArrayList<Book> GetOrderedBooks(String oid) {
        ArrayList<Book> li = new ArrayList<>();
        try {
            Connection con = new DataBaseHandler().makeConnection();
            PreparedStatement st = con.prepareStatement("select * from ordereditems where OrderID=?");
            st.setString(1, oid);

            ResultSet data = st.executeQuery();
            Book temp = new Book();
            BookDOA bkdoa = new BookDOA();
            String id;
            int quantity;

            while (data.next()) {

                id = data.getString("itemID");
                temp = bkdoa.getBook(id);
                quantity = data.getInt("Quantity");
               
                if (temp != null) {
                    temp.setCategory(""+quantity );
                    li.add(temp);
                }

            }
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }

        return li;
    }

    // ________________ GET THE ORDERS PLACED BY A USER ____________
    public ArrayList<Order> get_user_orders(String email) {
        ArrayList<Order> li = new ArrayList<>();
        try {

            Connection con = new DataBaseHandler().makeConnection();
            PreparedStatement st = con.prepareStatement("select * from orders where email=?");
            st.setString(1, email);
            ResultSet data = st.executeQuery();
            Order od = null;
            String id, email2, price, status;
            int quantity;
            while (data.next()) {
                id = data.getString("OrderID");
                email2 = data.getString("email");
                price = data.getString("price");
                status = data.getString("Status");
                quantity = data.getInt("quantity");

                od = new Order(id, email2, price, status, quantity);
                li.add(od);
            }
        } catch (Exception e) {
            return null;
        }

        return li;
    }

    public static void main(String[] args) {
        ArrayList<Book>li=new OrdersDAO().GetOrderedBooks("aea96440-b56b-43f1-9c55-793b96eb2322");

        for(Book bk:li){
            System.out.println(bk.getCategory());
        }
    }

}
