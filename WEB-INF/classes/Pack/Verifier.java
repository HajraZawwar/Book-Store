package Pack;

import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Verifier {
    public boolean is_Admin(HttpSession sess) {
        if (sess == null || sess.getAttribute("type") == null)
            return false;

        if ((String) sess.getAttribute("type") != "admin")
            return false;
        return true;
    }

    public boolean is_Customer(HttpSession sess) {
        if (sess == null || sess.getAttribute("type") == null)
            return false;

        if ((String) sess.getAttribute("type") != "customer")
            return false;
        return true;
    }
}
