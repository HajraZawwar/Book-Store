import javax.servlet.*;
import javax.servlet.http.*;

import Pack.*;

import java.sql.*;
import java.io.*;

public class SignUp extends HttpServlet {
    Utilities util;

    public String append_error(String error) throws IOException {
        // getting base path from Helper class function... this path will be same for
        // almsot all html files....
        String result1 = new Helpers().fetch_file(Helpers.get_basePath() + "/SignUp/before_error.html");
        String err = "<h5 id=\"error\" class=\"text-middle error-message\">" + error + "</h5>";
        String result2 = new Helpers().fetch_file(Helpers.get_basePath() + "/SignUp/after_error.html");

        return (result1 + err + result2);

    }

    // it will fetch th html file data and render it....
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.getRequestDispatcher("SignUp.jsp").forward(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter pr = res.getWriter();
        try {
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            
            util=new Utilities();
            String message=util.Verify_Details(name, email, password);
            if(!(message.equals("success"))){
                req.setAttribute("error", "Wrong details");
                req.getRequestDispatcher("SignUp.jsp").forward(req, res);
            }

            Class.forName("com.mysql.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3307/bookstore";
            Connection con = DriverManager.getConnection(url, "root", "umair");

            Statement st = con.createStatement();

            // first of all check if there is any other user with same email exists...
            String query = "select * from customer where Email='" + email + "'";
            ResultSet data = st.executeQuery(query);

            if (data.next()) {
                pr.println(append_error("email already exists"));
                return;
            }

            // otherwise just add the current user record into the database....
            query = "insert into customer (Name,Email,password) values ('" + name + "','" + email + "','"
                    + password
                    + "')";
            int records = st.executeUpdate(query);

            
            // now redirect to the logIn page....
            res.sendRedirect("http://localhost:9494/Book%20Store%20Project/");

            pr.close();
            st.close();
            con.close();


        } catch (Exception iox) {
            pr.println(iox);
        }

    }

}
