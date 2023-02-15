<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier();
 if(!v.is_Admin(session)){ 
    response.sendRedirect("/Book%20Store%20Project/"); return; } %>

<jsp:useBean id="obj" class="Pack.Category"/>
<jsp:setProperty name="obj" property="*" />
<%
String result;
String cname=obj.getCname();
if( obj!=null && cname!=null && cname.length()>3){
result=new CategoryDAO().add_category(obj);
}else{
    result="Category name should be alpahbet, at least 4 characters";
}
response.sendRedirect("/Book%20Store%20Project/Admin/admin.jsp?view_type=categories&message="+result);
%>
