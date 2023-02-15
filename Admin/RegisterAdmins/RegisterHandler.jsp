<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier();
 if(!v.is_Admin(session)){ 
    response.sendRedirect("/Book%20Store%20Project/"); return; } %>

<jsp:useBean id="obj" class="Pack.Admin"/>
<jsp:setProperty name="obj" property="*" />

<% 
AdminDAO adao=new AdminDAO();
String result=adao.RegisterAdmin(obj);
session.setAttribute("message",result);
response.sendRedirect("/Book%20Store%20Project/Admin/admin.jsp?view_type=admins");
 %>

 
