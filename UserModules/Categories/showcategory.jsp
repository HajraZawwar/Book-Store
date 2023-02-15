<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier();
 if(!v.is_Customer(session)){ 
    response.sendRedirect("/Book%20Store%20Project/"); return; } %>

        <%
        String category=request.getParameter("category");
        BookDOA bkdoa=new BookDOA();
      ArrayList<Book>bklist=bkdoa.getBooksByCategory(false, category);
      
        %>

        <h2 class="text-center"> <%= category %> </h2>

        <div class="category-container">

            <div class="bookcards-container">
        
                <% for(Book bk:bklist){ %>
                <jsp:include page="../bookscards.jsp">
                    <jsp:param name="bookid" value="<%= bk.getBookid() %>"/>
                    <jsp:param name="bookname" value="<%= bk.getBookname() %>"/>
                    <jsp:param name="bookprice" value="<%= bk.getPrice() %>"/>
                    <jsp:param name="bookauthor" value="<%= bk.getAuthor() %>"/>
                    <jsp:param name="bookcategory" value="<%= bk.getCategory() %>"/>
                </jsp:include> 
        
                <% } %>
        
            </div>
        </div>
