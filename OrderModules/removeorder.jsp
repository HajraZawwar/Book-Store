<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier();
 if(!v.is_Admin(session)){ 
    response.sendRedirect("/Book%20Store%20Project/"); return; } %>

<%
String id=request.getParameter("orderid");
if(id==null){
    response.sendRedirect("/Book%20Store%20Project/Admin/admin.jsp?view_type=orders");
    return;
}
String stat=new OrdersDAO().remove_order(id);

response.sendRedirect("/Book%20Store%20Project/Admin/admin.jsp?view_type=orders");
%>
