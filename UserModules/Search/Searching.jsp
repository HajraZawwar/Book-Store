<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier();
 if(!v.is_Customer(session)){ 
    response.sendRedirect("/Book%20Store%20Project/"); return; } %>

    <%
    String info=request.getParameter("info");
    BookDOA bkdao = new BookDOA();
    ArrayList<Book> bklist = bkdao.BookSearch(info);
        if(bklist==null || bklist.size()<1){
    %>    
        <h2 class="text-center"> No result Found </h2>

        <% return; } %>

        <h2 class="text-center"> Search Results </h2>
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
