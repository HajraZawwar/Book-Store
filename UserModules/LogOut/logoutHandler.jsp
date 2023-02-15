<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier();
 if(!v.is_Customer(session)){ 
    response.sendRedirect("/Book%20Store%20Project/"); return; } %>

 <% session.invalidate(); 
 response.sendRedirect("/Book%20Store%20Project/");
 %>   
