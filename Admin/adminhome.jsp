<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier();
 if(!v.is_Admin(session)){ 
    response.sendRedirect("/Book%20Store%20Project/"); return; } %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <link rel="stylesheet" href="../../Book Store Project//Frontend Modules/CSS files/main_style.css">
        <link rel="stylesheet" href="../../Book Store Project/mystyle.css">
      <link rel="stylesheet" href="../../Book Store Project/Frontend Modules/CSS files/AdminFroms.css">
        <style>
            .whitelink {
                    text-decoration: none;
                    color: white;
              }
        </style>
    </head>

    <body>

      
            <div class="Home">
                <div class="main-screen">

                    <div class="left">
                        <div class="admin-profile">
                            <img class="admin-image" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUysReAtoMx7lSV9j3Tdev0wC3vMsoHXur6s_0qFwK7IkWQ4q0Uh3m2BjneYqiKfIyHZc&usqp=CAU" alt="">
                            <h3 class="admin-name">
                                <%= (String)request.getAttribute("name")%>
                            </h3>
                        </div>
                        
                        <div class="nav-item">
                            <a class="special-links" href="/Book%20Store%20Project/Admin/admin.jsp?view_type=books">Books</a>
                        </div>
                        <div class="nav-item">
                            <a class="special-links" href="/Book%20Store%20Project/Admin/admin.jsp?view_type=orders">Orders</a>
                        </div>
                        <div class="nav-item">
                            <a class="special-links" href="/Book%20Store%20Project/Admin/admin.jsp?view_type=admins">Admins</a>
                        </div>
                        <div class="nav-item">
                            <a class="special-links" href="/Book%20Store%20Project/Admin/admin.jsp?view_type=categories">Categories</a>
                        </div>
                        <div class="nav-item">
                            <a class="special-links" href="/Book%20Store%20Project/Admin/admin.jsp?view_type=addbook">Add Books</a>
                        </div>
                        <div class="nav-item">
                            <a class="special-links" href="/Book%20Store%20Project/Admin/LogOut/logouthandler.jsp">LogOut</a>
                        </div>
                    </div>
                    <div class="right">
                        <% String info=request.getParameter("info");%>

                        <% if(info!=null){ %>
                        
                            <jsp:include page="Search/Searching.jsp"/>

                        <% return;} %>

                        <% if(((String)request.getAttribute("view_type")).equals("orders")){ %>
                            <jsp:include page="/Admin/AdminOrdersSection.jsp" />
                        <% }else if(((String)request.getAttribute("view_type")).equals("admins")){ %>
                        <jsp:include page="/Admin/RegisterAdmins/AdminsSection.jsp" />
                        <% }else if(((String)request.getAttribute("view_type")).equals("addbook")){ %>
                            <jsp:include page="/Admin/addbook.jsp" />
                        <% }else if(((String)request.getAttribute("view_type")).equals("updatebook")){ %>
                             <jsp:include page="/Admin/updatebook.jsp"/>
                        <% }else if(((String)request.getAttribute("view_type")).equals("orderdetails")){ %>
                            <jsp:include page="/OrderModules/displayOrderHandler.jsp"/>
                         <% }else if(((String)request.getAttribute("view_type")).equals("categories")){ %>
                            <jsp:include page="/Categories/displayCategories.jsp"/>    
                        <% }else{ %>
                        <jsp:include page="/Admin/AdminBooksSection.jsp" />
                        <% } %>

                    </div>
                </div>
            </div>

    </body>

    </html>
