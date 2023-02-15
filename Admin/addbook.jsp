<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier();
 if(!v.is_Admin(session)){ 
    response.sendRedirect("/Book%20Store%20Project/"); return; } %>

<h1 class="text-center">Add Books</h1>

<h3 class="text-center" style="color:red">
    <% if(request.getAttribute("error")!=null){
       out.println(request.getAttribute("error"));
       }
       else {
      out.println("");
      }  %>

      <% ArrayList<Category>li=new CategoryDAO().getcategories(); %>

    </h3>
   <div class="form-contain">
      <form class="book-form" action="addbookHandler.jsp" method="post">
          <div class="form-item">
              <label for="bookid">Enter BookID:</label>
              <input type="text" name="bookid" >
          </div>
          <div class="form-item">
              <label for="bookname">Enter Book Title:</label>
              <input type="text" name="bookname" >
          </div>
          <div class="form-item">
              <label for="author">Enter Autor Name:</label>
              <input type="text" name="author">
          </div>
          <div class="form-item">
              <label for="price">Enter Price:</label>
              <input type="text" name="price" >
          </div>

          <div class="form-item">
              <label for="description">Enter description:</label>
              <textarea name="description" id="descprition" cols="30" rows="10"></textarea>
          </div>
          <div class="form-item">
              <label for="category">Select Category: </label>
              <select name="category" id="" >
                  <option value=""> </option>
                  <% for(Category ct:li){ %>
                  <option value="<%=ct.getCname()%>"><%=ct.getCname()%></option>

                  <% } %>
              </select>
          </div>

          <div class="form-item">
              <input class="submission" type="submit" value="Add Book">
          </div>
      </form>
    </div>
