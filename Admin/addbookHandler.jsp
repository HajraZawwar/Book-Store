<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier();
 if(!v.is_Admin(session)){ 
    response.sendRedirect("/Book%20Store%20Project/"); return; } %>

<jsp:useBean id="obj1" class="Pack.Book"/>
<jsp:setProperty name="obj1" property="*" />


<% 
String error;
if(new BookDOA().verifyData(obj1)){
   String result= new BookDOA().AddBook(obj1);
   if(result.equals("success")){
    request.setAttribute("error","Sucessfully added data");
   
   }else if(result.equals("already")){
    request.setAttribute("error","Data already exists");
   }
}else{
    request.setAttribute("error","Wrong Submission");
} 
%>

<jsp:forward page="admin.jsp?view_type=addbook"/>


