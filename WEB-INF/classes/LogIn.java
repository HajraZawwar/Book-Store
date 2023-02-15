import javax.servlet.*;
import javax.servlet.http.*;

import Pack.Utilities;

import java.io.*;
import java.sql.*;

public class LogIn extends HttpServlet {
    private Utilities util;

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        req.getRequestDispatcher("logIn.jsp").forward(req, res);

    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        PrintWriter pr = res.getWriter();

        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection con = DriverManager.getConnection(Helpers.get_jdbcpath(), "root", "umair");

            Statement st = con.createStatement();

            util=new Utilities();
            String message=util.verify_login(email, password);
            if(!(message.equals("success"))){
                req.setAttribute("error", "Details are wrong");
                req.getRequestDispatcher("logIn.jsp").forward(req, res);
                return;
            }

            req.removeAttribute("error");

            // first of all check is current user is admin or not...
            String query = "select * from admin where Email='" + email + "' and password='" + password + "'";
            ResultSet data = st.executeQuery(query);

            if (data.next()) {
                // make a session for admin user....
                HttpSession sess = req.getSession(true);
                if (sess.getAttribute("type") == null || ((String) sess.getAttribute("type")).equals("customer")
                        || !((String) sess.getAttribute("email")).equals(email)) {
                    sess.setAttribute("type", "admin");
                    sess.setAttribute("email", email);
                }
                
                res.sendRedirect("/Book%20Store%20Project/home");
                return;
            }

            // now check for the customer....
            query = "select * from customer where email='" + email + "' and password='" + password + "'";

            data = st.executeQuery(query);

            if (data.next()) {
                HttpSession sess = req.getSession(true);
                Object current_type = sess.getAttribute("type");

                if (current_type == null || ((String) current_type).equals("admin")
                        || !((String) sess.getAttribute("email")).equals(email)) {
                    sess.setAttribute("type", "customer");
                    sess.setAttribute("email", email);
                }

                res.sendRedirect("welcome.jsp");
                return;

            } else {
                RequestDispatcher disp=req.getRequestDispatcher("logIn.jsp");
                req.setAttribute("error", "Wrong Credentials");
                disp.forward(req, res);
            }

            pr.close();
            st.close();
            con.close();

        } catch (Exception iox) {
            pr.println(iox);
        }
    }

}
