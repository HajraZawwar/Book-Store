<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier();
 if(!v.is_Admin(session)){ 
    response.sendRedirect("/Book%20Store%20Project/"); return; } %>

<%  
String new_status=request.getParameter("status");
String orderid=request.getParameter("orderid");
String result = new OrdersDAO().changeStatus(new_status, orderid);


if(result.equals("success") || result.equals("removed") ){
    response.sendRedirect("/Book%20Store%20Project/Admin/admin.jsp?view_type=orders");
}else{
    out.println("It doesn't exist");
}
%>
