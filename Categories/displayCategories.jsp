<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier();
 if(!v.is_Admin(session)){ 
    response.sendRedirect("/Book%20Store%20Project/"); return; } %>

<%  ArrayList<Category>li=new CategoryDAO().getcategories(); %>
<div class="category-container">
    <form action="/Book%20Store%20Project/Categories/addCategory.jsp" method="post">
        <div>
            <input class="wideinput" type="text" name="cname" placeholder="Enter New Category">

            <input type="submit" value="Add Category">
        </div>
        <h3 style="color:red"><%
            String error=request.getParameter("message");

            if(error!=null){
                out.println(error);
            }
            %></h3>
    </form>

    <div class="container">
        <h2>Available Categories</h2>
        <div class="category-holder flex-type">
            <% for(Category ct:li){ %>
            <div class="category-item">
                <h3><%= ct.getCname() %></h3>
               
                <a href="/Book%20Store%20Project/Categories/deleteCategory.jsp?cname=<%=ct.getCname()%>"><img
                            
                    src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAv0lEQVR4nO2VXQrCMBAGxwtalZY86NkVLP6hN6hQCaQgJdXdsFHEDOQt+02TbBooFP6JBrgBB2ChqFsCJ+AK1FrpLBT2YXSAE9S5MHeo8xlqLk8BEvlY6sc5RbyKBE3JY9IuZCRRRwLvwGbUC7E561SpRJ5N+m4rpUdhvvJsK5XKs0qZONNYw31E2ueUu280V/Piykjuubl0wFxeGfwyfYaa1uCR2KeIjwbPos9QU4Uv3iq3zM/dhdp5irhQ+E0ekyummbane5EAAAAASUVORK5CYII=">
                </a>
            </div>
            <% } %>
           
        </div>
    </div>
</div>

