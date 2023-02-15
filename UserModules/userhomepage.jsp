<%@ page import="Pack.*" %>
    <%@ page import="java.util.*" %>
        <% Verifier v=new Verifier(); if(!v.is_Customer(session)){
            response.sendRedirect("/Book%20Store%20Project/");
            return; } %>

            <html>

            <head>
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>User Home</title>
                <link rel="stylesheet" href="../../Book Store Project/Frontend Modules/CSS files/userhome.css">
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
                    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
                    crossorigin="anonymous">
                    <link rel="stylesheet" href="../../Book Store Project/Frontend Modules/CSS files/productPage.css">

                    <link rel="stylesheet" href="../../Book Store Project/Frontend Modules/CSS files/BoxesStyle.css">
            </head>

            <body>
                <div class="homepage">
                    <jsp:include page="navigationbar.jsp" />
                    <%
                     String view_type=request.getParameter("viewtype");
                     String info=request.getParameter("info");

                      %>
                        <section class="display-section">
                            <% if(info!=null){  %>
                                <jsp:include page="Search/Searching.jsp" />  
                                
                             <%return;  } %>   
                     <% if(view_type==null || view_type.equals("home")){ %>
                         <jsp:include page="booksview.jsp" />
                     <% }else if(view_type.equals("cart")){ %>
                        <jsp:include page="cartview.jsp" />
                     <% }else if(view_type.equals("orders")){ %>
                        <jsp:include page="ordersview.jsp" />
                     <% } else if(view_type.equals("productpage")){ %>
                        <jsp:include page="productpage.jsp" />
                    <% } else if(view_type.equals("wishlist")){ %>
                            <jsp:include page="WishList/WishListView.jsp" />
                    <% } else if(view_type.equals("category")){ %>
                         <jsp:include page="Categories/showcategory.jsp" />  
                     <% } else{ %> 
                        <jsp:include page="booksview.jsp" />
                        <% } %>
                        </section>
                </div>

            </body>

            </html>
