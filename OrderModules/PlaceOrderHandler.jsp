<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier(); if(!v.is_Customer(session)){
    response.sendRedirect("/Book%20Store%20Project/");
      return; } %>

<% String user_email=request.getParameter("email");%>

        <% 
        OrdersDAO order_dao= new OrdersDAO(); 
        boolean hp=order_dao.placeOrder(user_email);

        response.sendRedirect("/Book%20Store%20Project/UserModules/userhomepage.jsp?viewtype=cart");
        
        %>

 
