import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class home extends HttpServlet {
    public void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
        req.getRequestDispatcher("welcome.jsp").forward(req, res);
    }
}
