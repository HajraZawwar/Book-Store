<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier(); if(!v.is_Customer(session)){ out.println("Not allowed on this page please login"); return; } %>

        <% 
        String bookid=request.getParameter("bookid");
        if(bookid==null || bookid.length()<2){
            response.sendRedirect("/Book%20Store%20Project/UserModules/userhomepage.jsp");
            return;
        }

        BookDOA bkdoa=new BookDOA();
        Book bk=bkdoa.getBook(bookid);

        if(bk==null){
            response.sendRedirect("/Book%20Store%20Project/UserModules/userhomepage.jsp");
            return;
        }
        %>

<section class="main-product-page">

<div class="product-page">
    <div class="image-container2">

    </div>
    <div class="info-container2">
        <div class="info-item">
            <h1 class="prodct-header"> <span><%= bk.getBookname()%></span> <span><%= bk.getPrice()%></span></h1>
            <h3>Author Name</h3>
        </div>

        <div class="info-item">
            <h2>Description: </h2>
            <p><%= bk.getDescription() %>
            </p>
        </div>

        <div class="info-item">
            <form action="addToCartHandler.jsp">
                <div class="form-item">
                    <label for="quantity">Enter Quantity: </label>
                    <input type="number" value="1" name="quantity">

                    <input type="text" value="<%= bookid %>" id="hidden_fields" name="bookid">
                </div>
                <div class="form-item">
                    <input type="submit" value="Order now">
                </div>

            </form>
        </div>

        <script>
            // here write down the java script......

        </script>
    </div>
</div>

<!-- now here show the relevant products if they exist.... -->

<%

ArrayList<Book>li=bkdoa.GetSimilarProducts("war");
    if(li.size()<1){
        return;
    }
%>
<div class="relevant-product">
<div class="heading">
    <h2>Similar Products: </h2>
</div>

<div class="bookcards-container">

    <% for(Book bki:li){ %>
        <jsp:include page="bookscards.jsp">
            <jsp:param name="bookid" value="<%= bki.getBookid() %>"/>
            <jsp:param name="bookname" value="<%= bki.getBookname() %>"/>
            <jsp:param name="bookprice" value="<%= bki.getPrice() %>"/>
            <jsp:param name="bookauthor" value="<%= bki.getAuthor() %>"/>
            <jsp:param name="bookcategory" value="<%= bki.getCategory() %>"/>
        </jsp:include> 

        <% } %>

</div>
</div>
</section>

<script src="../../Book Store Project/Frontend Modules/Java Script/hiddenfields.js"></script>
