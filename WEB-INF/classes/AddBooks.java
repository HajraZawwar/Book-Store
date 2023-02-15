import javax.servlet.*;
import javax.servlet.http.*;



import java.io.*;
import java.sql.*;

public class AddBooks extends HttpServlet {

    // get requst which displays add book page ... just dispatch the request to the
    // jsp page
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.getRequestDispatcher("/addbook.jsp").forward(req, res);
    }

    public boolean Verifier(String id, String name, String auth, String price, String desc, String cat) {
        if (id.length() < 7 || name.length() < 7 || auth.length() < 5 || desc.length() < 30)
            return false;

        if (id.length() > 49 || name.length() > 49 || auth.length() > 49 || desc.length() > 299)
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

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        PrintWriter pr = res.getWriter();
        HttpSession sess = req.getSession(false);
        if (sess == null) {

            res.sendRedirect("/Book%20Store%20Project/logInPage");
            return;
        }

        if (!((String) sess.getAttribute("type")).equals("admin")) {
            pr.println("Unauthorized access to the page");
            pr.close();
            return;
        }

        String bookid = req.getParameter("bookid");
        String bookName = req.getParameter("bookname");
        String author = req.getParameter("author");
        String price = req.getParameter("price");
        String description = req.getParameter("description");
        String category = req.getParameter("category");

        if (!Verifier(bookid, bookName, author, price, description, category)) {
            req.setAttribute("error", "Wrong Submission");
            req.getRequestDispatcher("/addbook.jsp").forward(req, res);
            
        } else {
            
            try {

                Class.forName("com.mysql.jdbc.Driver");
                String url = Helpers.get_jdbcpath();
                Connection con = DriverManager.getConnection(url, "root", "umair");

                Statement st = con.createStatement();
                String query = "select * from books where BookID='" + bookid + "'";
                ResultSet data = st.executeQuery(query);

                if (data.next()) {
                    req.setAttribute("error", "This book already exists");
                    req.getRequestDispatcher("/addbook.jsp").forward(req, res);
                    return;
                }

                query = "insert into books (BookID,Title,Author,Price,Description,Category) values('" + bookid
                        + "','" + bookName + "','" + author + "',"
                        + Integer.parseInt(price) + ",'" + description + "','" + category + "')";

                int records = st.executeUpdate(query);

                req.setAttribute("error", "Book is inserted into databases");
                req.getRequestDispatcher("/addbook.jsp").forward(req, res);
                st.close();
                con.close();
            } catch (Exception e) {
                pr.println(e);
            }
           
          

            pr.close();
        }
    }
}
