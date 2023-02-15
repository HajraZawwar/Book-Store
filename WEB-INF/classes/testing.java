import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;

public class testing extends HttpServlet {

    // it will fetch th html file data and render it....
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String name=req.getParameter("view");

        res.getWriter().println(name);

    }

}
