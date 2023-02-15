<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier();
 if(!v.is_Customer(session)){ 
    response.sendRedirect("/Book%20Store%20Project/"); return; } %>

    <%
    String email=(String)session.getAttribute("email");
    String itemid=request.getParameter("bookid");
    if(itemid==null || itemid.equals("")){
      out.println("Method is not allowed");
      return;
    }
    WishListDAO wdao=new WishListDAO();
    wdao.AddToWishList(itemid,email);
    out.println("added");

    response.sendRedirect("/Book%20Store%20Project/UserModules/userhomepage.jsp?viewtype=wishlist");

   
    %>

