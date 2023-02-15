<html>
<head>
<title> Welcome Page </title>
 </head>
<body>
<%
 if(session==null){
    response.sendRedirect("/Book%20Store%20Project/");
    return;
}
if(session.getAttribute("type")==null){
    response.sendRedirect("/Book%20Store%20Project/");
    return;
}
 %>

<%  if(((String)session.getAttribute("type")).equals("admin")){ %>
<jsp:forward page="Admin/admin.jsp?view_type=\"books\" " />
<% }  %>

<%  if(((String)session.getAttribute("type")).equals("customer")){
response.sendRedirect("/Book%20Store%20Project/UserModules/userhomepage.jsp");
}  %>

</body>
</html>
