<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier();
 if(!v.is_Admin(session)){ 
    response.sendRedirect("/Book%20Store%20Project/"); return; } %>

<h1 style="color:red">
    <% if(request.getAttribute("error")!=null){
       out.println(request.getAttribute("error"));
       }
       else {
      out.println("");
      }  %>
</h1>

<% 
      String id=request.getParameter("bookid");
      
      Book obj=new BookDOA().getBook(id);
      String bkid =obj.getBookid();
      String bkname =obj.getBookname();
      String author=obj.getAuthor();
      String price=obj.getPrice();
      String description=obj.getDescription();
      String category=obj.getCategory();
%>
<h1 class="text-center">Add Books</h1>
<div class="form-contain">
<form class="book-form" action="updateBookHandler.jsp" method="post">
    <div class="form-item">
        <label for="bookid">Enter BookID:</label>
        <input type="text" name="bookid" value="<%= bkid %>">
    </div>
    <div class="form-item">
        <label for="bookname">Enter Book Title:</label>
        <input type="text" name="bookname" value="<%= bkname %>">
    </div>
    <div class="form-item">
        <label for="author">Enter Autor Name:</label>
        <input type="text" name="author" value="<%= author %>">
    </div>
    <div class="form-item">
        <label for="price">Enter Price:</label>
        <input type="text" name="price" value="<%= price %>">
    </div>

    <div class="form-item">
        <label for="description">Enter description:</label>
        <textarea name="description" id="descprition" cols="30" rows="10" ><%=description%></textarea>
    </div>
    <div class="form-item">
        <label for="category">Select Category: </label>
        <select name="category" id="" <%= category %>>
            <option  selected> <%=category%> </option>
            <option value="fiction">Fiction</option>
            <option value="non fiction">Non-fiction</option>
        </select>
    </div>

    <div class="form-item">
        <input class="submission" type="submit" value="Update Book">
    </div>
</form>
</div>
