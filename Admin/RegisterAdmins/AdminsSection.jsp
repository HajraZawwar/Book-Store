<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier();
 if(!v.is_Admin(session)){ 
    response.sendRedirect("/Book%20Store%20Project/"); return; } %>

<h1  class="text-center">Register Admin</h1>
    <% String message=(String)session.getAttribute("message");
    if(message!=null){ %>
    <h5 style="color: red;" class="text-center"><%= message %></h5>

    <% } session.removeAttribute("message"); %>

<form action="RegisterAdmins/RegisterHandler.jsp" method="post">
    <div class="form-item">
        <label for="name">Enter Name</label>
        <input type="text" name="name">
    </div>
    <div class="form-item">
        <label for="email">Enter Email</label>
        <input type="text" name="email">
    </div>
    <div class="form-item">
        <label for="password">Enter password</label>
        <input type="password" name="password">
    </div>
    <div class="form-item">
        <input class="submission" type="submit" value="Register Admin">
    </div>
</form>

