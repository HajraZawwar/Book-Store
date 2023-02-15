<% String bkid=request.getParameter("bookid");%>
<% String is_wishlist=(String)request.getAttribute("list"); %>
<a style="color:white" href="/Book%20Store%20Project/UserModules/userhomepage.jsp?viewtype=productpage&bookid=<%=bkid%>">


    <div class="book-card">
    <div class="image-container">
        <img class="img" src="https://i.pinimg.com/originals/63/6d/b4/636db4fe0767a65b4160f3d7cd10da04.png" alt="">
    </div>
    <div class="info-container pad-up">
        <div class="jointwo">
            <h1 class="book-name large"><%= request.getParameter("bookname")%></h1>
        </div>

        <div class="jointwo">
            <h2 class="book-author smaller"><%= request.getParameter("bookauthor")%></h2>
            <h4 style="color: #189c2e;"  class="smaller"><%= request.getParameter("bookprice")%></h4>
        </div>

        <h3 class="book-category smaller"><%= request.getParameter("bookcategory")%></h3>
        <div class="link-container2">
            <a class="addcart whitelink" href="/Book%20Store%20Project/UserModules/addToCartHandler.jsp?bookid=<%= request.getParameter("bookid")%>">Add to Cart</a>
        </div>
        <% if(is_wishlist==null){ %>
        <div class="link-container2 ct2">
            <a style="color: black;" class="addcart whitelink" href="/Book%20Store%20Project/UserModules/WishList/addToWishList.jsp?bookid=<%= request.getParameter("bookid")%>">Add to Wish List</a>
        </div>
       <% }else{ %>
        <div class="link-container2 ct2">
            <a style="color: black;" class="addcart whitelink" href="/Book%20Store%20Project/UserModules/WishList/RemoveFromWishList.jsp?bookid=<%= request.getParameter("bookid")%>">Remove from Wish List</a>
        </div>
      <% } %>

    </div>
</div>
</a>
