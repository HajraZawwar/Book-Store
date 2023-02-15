<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier();
 if(!v.is_Customer(session)){ 
    response.sendRedirect("/Book%20Store%20Project/"); return; } %>

    <%
    String email=(String)session.getAttribute("email");
    String itemid=request.getParameter("bookid");
    if(itemid==null || itemid.equals("")){
      out.println("Provide the items properly");
      return;
    }
    WishListDAO wdao=new WishListDAO();

    wdao.remove_from_wishlist(itemid, email);

    response.sendRedirect("/Book%20Store%20Project/UserModules/userhomepage.jsp?viewtype=wishlist");

   
    %>
