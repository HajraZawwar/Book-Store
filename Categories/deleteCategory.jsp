<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier();
 if(!v.is_Admin(session)){ 
    response.sendRedirect("/Book%20Store%20Project/"); return; } %>

<%
String cname=request.getParameter("cname");
String res=new CategoryDAO().RemoveCategory(cname);
out.println(res);
response.sendRedirect("/Book%20Store%20Project/Admin/admin.jsp?view_type=categories");
%>
