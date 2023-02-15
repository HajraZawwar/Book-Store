package Pack;

import java.sql.*;
import java.util.ArrayList;

public class BookDOA {

    private DataBaseHandler db_handler;

    public BookDOA() {
        db_handler = new DataBaseHandler();
    }

    // _______________________________________________________________>
    // __________ A SIMPLE FUNCTION THAT TAKES RESULT SET AND MAKES A BOOK OBJECT___
    public Book append_values(ResultSet data) throws Exception {
        String bkn, bki, a, p, d, c;

        bki = data.getString("BookID");
        bkn = data.getString("Title");
        a = data.getString("Author");
        p = data.getString("Price");
        d = data.getString("Description");
        c = data.getString("Category");

        return new Book(bki, bkn, a, p, d, c);
    }

    // __________ HERE GET THE BOOK FROM DATABASE USING ID OF A BOOK _________
    public Book getBook(String id) {

        try {
            Connection con = new DataBaseHandler().makeConnection();
            PreparedStatement st = con.prepareStatement("select * from books where BookID=?");
            st.setString(1, id);
            ResultSet data = st.executeQuery();
            Book bk;
            if (data.next()) {
               bk=append_values(data);
               con.close();
                return bk;
            }
            
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
        
        return null;
    }

    public ArrayList<Book> fetch_books() {
        ArrayList<Book> res = new ArrayList<>();
        try {
            Connection con = new DataBaseHandler().makeConnection();
            Statement st = con.createStatement();
            String query = "select * from books";
            ResultSet data = st.executeQuery(query);
            Book bk;
            while (data.next()) {
                bk = append_values(data);
                res.add(bk);
            }
            con.close();

        } catch (Exception iox) {
            return null;
        }

        return res;
    }

    public String remove_book(String id) {
        String res;
        int record;
        try {

            Connection con = new DataBaseHandler().makeConnection();
            PreparedStatement st = con.prepareStatement("delete from books where BookID=?");
            st.setString(1, id);

            record = st.executeUpdate();

            if (record > 0)
                res = "success";
            else
                res = "" + record;
            
             con.close();   

        } catch (Exception e) {
            return e.toString();
        }
        return res;
    }

    public String AddBook(Book b) {
        String res = "";
        int rec;
        try {
            Connection con = new DataBaseHandler().makeConnection();
            PreparedStatement st = con.prepareStatement("select * from books where BookID=?");
            st.setString(1, b.getBookid());
            ResultSet data = st.executeQuery();
            if (data.next())
                return "already";

            st = con.prepareStatement(
                    "insert into books (BookID,Title,Author,Price,Description,Category) values(?,?,?,?,?,?)");

            st.setString(1, b.getBookid());
            st.setString(2, b.getBookname());
            st.setString(3, b.getAuthor());
            st.setString(4, b.getPrice());
            st.setString(5, b.getDescription());
            st.setString(6, b.getCategory());

            rec = st.executeUpdate();

            if (rec < 1)
                res = "failure";
            else {
                res = "success";

                // Now at the end also update the value of books in Categories.....
                st = con.prepareStatement("update categories set numberofbooks=numberofbooks+1 where CategoryName=?");
                st.setString(1, b.getCategory());
                st.executeUpdate();
            }
            con.close();

        } catch (Exception e) {
            return e.toString();
        }

        return res;
    }

    // WE'LL USE THIS VERIFIER IN CASE OF BOOK ADDITION ----------------------
    public boolean verifyData(Book b) {
        return Verifier(b.getBookid(), b.getBookname(), b.getAuthor(), b.getPrice(), b.getDescription(),
                b.getCategory());
    }

    public boolean Verifier(String id, String name, String auth, String price, String desc, String cat) {

        if (id == null || name == null || auth == null || price == null || desc == null || cat == null)
            return false;

        if (id.length() < 7 || name.length() < 7 || auth.length() < 5 || desc.length() < 30)
            return false;

        if (id.length() > 99 || name.length() > 99 || auth.length() > 99 || desc.length() > 500)
            return false;
        try {
            int p = Integer.parseInt(price);

        } catch (NumberFormatException exp) {
            return false;
        }

        if (cat.equals(""))
            return false;

        return true;
    }

    // NOW UPDATE AND EXISTING BOOK------------------------->
    public String updateBook(Book bk) {
        String res = "";
        try {
            Connection con = new DataBaseHandler().makeConnection();
            PreparedStatement st = con.prepareStatement(
                    "update books set Title=?,Author=?,Price=?,description=?,Category=? where BookID=?");

            st.setString(6, bk.getBookid());
            st.setString(1, bk.getBookname());
            st.setString(2, bk.getAuthor());
            st.setString(3, bk.getPrice());
            st.setString(4, bk.getDescription());
            st.setString(5, bk.getCategory());

            int record = st.executeUpdate();

            res = "success";

        } catch (Exception exp) {
            res = exp.toString();
        }

        return res;
    }

    // ----------------------------------------------------------------->
    // ______________ DISPLAY LIMITED OR COMPLETE BOOKS BY CATEGORY______
    public ArrayList<Book> getBooksByCategory(boolean limited, String category) {
        ArrayList<Book> li = new ArrayList<>();
        Book book;
        try {
            Connection con = new DataBaseHandler().makeConnection();
            PreparedStatement st;

            if (!limited) {
                st = con.prepareStatement("select * from books where Category=?");

            } else {
                st = con.prepareStatement("select * from books where Category=? limit 4");
            }

            st.setString(1, category);

            ResultSet data = st.executeQuery();

            while (data.next()) {
                book = append_values(data);
                li.add(book);
            }
        } catch (Exception e) {
            return null;
        }

        return li;
    }

    // ________________ GET THE SIMILAR PRODUCTS OF THIS BOOK _____________
    public ArrayList<Book> GetSimilarProducts(String category) {
        ArrayList<Book> li = new ArrayList<>();
        try {
            Connection con = db_handler.makeConnection();
            PreparedStatement st = con.prepareStatement("select * from books where Category=? limit 3");
            st.setString(1, category);

            ResultSet data = st.executeQuery();
            Book bk = null;

            while (data.next()) {
                bk = append_values(data);
                li.add(bk);
            }

            // if matched products are less than 4 then search for all values....
            if (li.size() < 6) {
                st = con.prepareStatement("select * from books where Category<>?");
                st.setString(1, category);
                data = st.executeQuery();

                while (data.next() && li.size() < 6) {
                    bk = append_values(data);
                    li.add(bk);
                }
            }

            con.close();
        } catch (Exception exp) {
            return null;
        }

        return li;
    }

    // ___________________________ A General Search for books _____________
    public ArrayList<Book> BookSearch(String searched_info) {
        ArrayList<Book> li = new ArrayList<>();

        try {
            Connection con = db_handler.makeConnection();
            String query = "select * from books where BookID Like '%" + searched_info + "%' OR Title Like '%"
                    + searched_info + "%' OR Author Like '%" + searched_info + "%' OR Category Like '%" + searched_info
                    + "%'";
            Statement st = con.createStatement();

            ResultSet data = st.executeQuery(query);

            Book bk;
            while (data.next()) {
                bk = append_values(data);
                li.add(bk);
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
        return li;
    }

    public boolean RemoveByCategory(String category) {
        try {
            Connection con = db_handler.makeConnection();
            PreparedStatement st = con.prepareStatement("delete from books where Category=?");
            st.setString(1, category);
            st.executeUpdate();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
        return true;
    }

    public static void main(String[] args) {

    }

}
