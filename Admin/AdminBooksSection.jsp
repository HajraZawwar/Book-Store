<%@ page import="Pack.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier();
 if(!v.is_Admin(session)){ 
    response.sendRedirect("/Book%20Store%20Project/"); return; } %>

<% String val="Fine";  %>

<section >
    <div class="banner">
        <form action="/Book%20Store%20Project/Admin/admin.jsp">
            <input class="booksearch" name="info"  type="text" placeholder="Search Book">
            <button type="button" >Search</button>
        </form>
        
    </div>

    <div class="banner">
        <h2>Available Products</h2>
    </div>
    <div class="banner row  mb-3">
   <% 
            String bkid, title,author,description,category,price;
            ArrayList<Book>li=new BookDOA().fetch_books();
            for(int i=0;i<li.size();i++){
                bkid=li.get(i).getBookid();
                title=li.get(i).getBookname();
                author=li.get(i).getAuthor();
                description=li.get(i).getDescription();
                category=li.get(i).getCategory();
                price=li.get(i).getPrice();
                
                %>
       
            <jsp:include page="/BooksDesign/booksmodule.jsp">
                    <jsp:param name="BookName" value="<%=title%>"/>
                    <jsp:param name="author" value="<%=author%>"/>
                    <jsp:param name="description" value="<%=description%>"/>
                    <jsp:param name="category" value="<%=category%>"/>
                    <jsp:param name="price" value="<%=price%>"/>
                    <jsp:param name="bkid" value="<%=bkid%>"/>
            </jsp:include>    
   <% } %>

        
   </div>

</section>  
