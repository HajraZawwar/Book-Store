import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class CreateAdmin extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter pr = res.getWriter();

        // USER AUTHENTICATION.....
        HttpSession sess = req.getSession(false);
        if (sess == null) {
            res.sendRedirect("/Book%20Store%20Project/logInPage");
        }

        if (sess.getAttribute("type") == null) {
            pr.println("okie fine");
            return;
        }
        if (!((String) sess.getAttribute("type")).equals("admin")) {
            pr.println("Unauthorized Access .... Only Amdin can access this page");
            return;
        }

        String resp = new Helpers().fetch_file(Helpers.get_basePath() + "/CreateAdmin.html");

        pr.println(resp);

        pr.close();

    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter pr = res.getWriter();
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // USER AUTHENTICATION.....
        HttpSession sess = req.getSession(false);
        if (sess == null) {
            res.sendRedirect("/Book%20Store%20Project/logInPage");
        }

        if (!((String) sess.getAttribute("type")).equals("admin")) {
            pr.println("Unauthorized Access .... Only Amdin can access this page");
            return;
        }
        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(Helpers.get_jdbcpath(), "root", "umair");

            Statement st = con.createStatement();
            String query = "select * from admin where email='" + email + "'";

            ResultSet data = st.executeQuery(query);

            if (data.next()) {
                pr.println("such admin already exists so it can't be added again");
            } else {
                query = "insert into admin(Name,Email,Password) values('" + name + "','" + email + "','" + password
                        + "')";

                pr.println(query);

                int records = st.executeUpdate(query);

                pr.println(records + " records are inserted into database ");
            }

            con.close();
            st.close();
        } catch (Exception exp) {
            pr.println(exp);
        }

        pr.close();
    }
}
