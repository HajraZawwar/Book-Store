import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class RemoveBooks extends HttpServlet {

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

        if (bookid.length() < 5 || bookid.length() > 49) {
            req.setAttribute("error", "Wrong Submission");
            req.getRequestDispatcher("/removebook.jsp").forward(req, res);

        } else {
            try {

                Class.forName("com.mysql.jdbc.Driver");
                String url = Helpers.get_jdbcpath();
                Connection con = DriverManager.getConnection(url, "root", "umair");

                Statement st = con.createStatement();
                String query = "select * from books where BookID='" + bookid + "'";
                ResultSet data = st.executeQuery(query);

                if (!data.next()) {
                    req.setAttribute("error", "This book does not exist");
                    req.getRequestDispatcher("/removebook.jsp").forward(req, res);
                    return;
                }

                query = "delete from books where BookID='"+bookid+"'";

                int records = st.executeUpdate(query);

                req.setAttribute("error", "Book is deleted from database");
                req.getRequestDispatcher("/removebook.jsp").forward(req, res);
                st.close();
                con.close();
            } catch (Exception e) {
                pr.println(e);
            }

            pr.close();
        }
    }
}
