package Pack;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.sql.*;

public class Utilities {

    // Get the items String from the database..Then parse it to convert into
    // relevant items ids
    // so that we can get books from database and show it on orders page..
    public String[] parseBookID(String items) {
        String[] st = items.split(",");

        return st;
    }

    public ArrayList<Book> appendBooks(String[] ids) {
        ArrayList<Book> li = new ArrayList<>();
        Book bk = new Book();
        BookDOA bkdoa = new BookDOA();

        for (String s : ids) {
            bk = bkdoa.getBook(s);
            if (bk != null) {
                li.add(bk);
            }
        }

        return li;
    }

    public String get_statusMessage(String current) {
        if (current.equals("pending")) {
            return "confirmed";
        }
        if (current.equals("confirmed")) {
            return "dispatched";
        }
        if (current.equals("dispatched")) {
            return "received";
        }
        return "No more";
    }

    private int get_ordering(String order) {
        if (order.equals("pending"))
            return 1;

        if (order.equals("confirmed"))
            return 2;

        if (order.equals("dispatched"))
            return 3;
        if (order.equals("received"))
            return 4;

        return -1;
    }

    public boolean Status_Method_Allowed(String current, String new_status) {
        if (get_ordering(new_status) < get_ordering(current))
            return false;

        return true;
    }

    // ___________________ FIND SUM TO CALCULATE TOTAL PRICE OF ORDER AND TOTAL
    // ITEMS IN CART______
    public String Find_Sum(ArrayList<Cart> li) {
        int price = 0, item = 0;
        for (Cart c : li) {
            item++;
            price += (Integer.parseInt(c.getPrice()) * Integer.parseInt(c.getQuantity()));
        }

        return (price + "," + item);
    }

    // ____ GET COLOR FOR BUTTON __________________________
    public String Get_Color(String status) {
        String bg_col = "danger";

        if (status.equals("confirmed")) {
            bg_col = "success";
        } else if (status.equals("dispatched")) {
            bg_col = "primary";
        }
        return bg_col;

    }

    public String Verify_Details(String name, String email, String password) {
        System.out.println(password.length());
        if (name.length() < 5 || name.length() > 46)
            return "name must contain at least 5 and at most 45 characters";
        return verify_login(email, password);

    }

    public String verify_login(String email, String password) {
        String regex = "^[\\w!#$%&amp;'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&amp;'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$";

        Pattern pattern = Pattern.compile(regex);

        Matcher matcher = pattern.matcher(email);

        if (!matcher.matches())
            return "Email pasttern is wrong";

        if (password.length() < 5 || password.length() > 46)
            return "password pattern is wrong..More than 5 characetrs are must";

        return "success";
    }

    public static void main(String[] args) {
       
    }

}
