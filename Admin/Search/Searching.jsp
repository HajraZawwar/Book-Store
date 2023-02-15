<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier();
 if(!v.is_Admin(session)){ 
    response.sendRedirect("/Book%20Store%20Project/"); return; } %>

    <%
    String info=request.getParameter("info");
    BookDOA bkdao = new BookDOA();
    ArrayList<Book> bklist = bkdao.BookSearch(info);
       
    %>    
       

        <section >
            <div class="banner">
                <form action="/Book%20Store%20Project/Admin/admin.jsp">
                    <input class="booksearch" name="info"  type="text" placeholder="Search Book">
                    <button type="button" >Search</button>
                </form>
                
            </div>
            
           <% if(bklist==null || bklist.size()<1){
            %>    
            <h2 class="text-center"> No result Found </h2>
    
            <% return; } %>
    
            <div class="banner">
                <h2>Search results</h2>
            </div>
            <div class="banner row  mb-3">
           <% 
                    

                    for(Book bk: bklist){
                     %>
               
                    <jsp:include page="/BooksDesign/booksmodule.jsp">
                            <jsp:param name="BookName" value="<%= bk.getBookname() %>"/>
                            <jsp:param name="author" value="<%= bk.getAuthor() %>"/>
                            <jsp:param name="description" value="<%= bk.getDescription() %>"/>
                            <jsp:param name="category" value="<%= bk.getCategory() %>"/>
                            <jsp:param name="price" value="<%= bk.getPrice() %>"/>
                            <jsp:param name="bkid" value="<%= bk.getBookid() %>"/>
                    </jsp:include>    
           <% } %>
        
                
           </div>
        
        </section>  
        
