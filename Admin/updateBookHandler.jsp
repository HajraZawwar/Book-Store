<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier();
 if(!v.is_Admin(session)){ 
    response.sendRedirect("/Book%20Store%20Project/"); return; } %>

<jsp:useBean id="obj1" class="Pack.Book"/>
<jsp:setProperty name="obj1" property="*" />

<%
String error;
out.println(obj1.getCategory());

   String result= new BookDOA().updateBook(obj1);
   if(result.equals("success")){
    request.setAttribute("error","Sucessfully Updated the data");
   }else{
    request.setAttribute("error",result); 
   }


%>
<jsp:forward page="admin.jsp?view_type=updatebook&bookid=<%=obj1.getBookid()%>"/>
