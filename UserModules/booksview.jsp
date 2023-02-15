<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier();
 if(!v.is_Customer(session)){ 
    response.sendRedirect("/Book%20Store%20Project/"); return; } %>

<style>
    a{
        color:white;
    }
    a:hover{
        color:white;
        text-decoration: none;
    }
</style>
  
<%    ArrayList<Category>li=new CategoryDAO().getcategories();
    BookDOA bookdoa=new BookDOA();
    ArrayList<Book>bklist=new ArrayList<>(); %>

        <h2 class=" text-center">Available Categories</h2>
        <div class="box-container3">
            
        <% for(Category ct:li){ %>
           <a  href="/Book%20Store%20Project/UserModules/userhomepage.jsp?viewtype=category&category=<%= ct.getCname()%>"> <div class="box yellow"><%= ct.getCname() %></div></a>
         <% } %>   
        </div>

        <h2 class="text-center"> All Products: </h2>

  <%  
        BookDOA bkdoa=new BookDOA();
        bklist=bkdoa.fetch_books();
            if(bklist==null){
                return;
            }
        if(bklist.size()>0){
%>

<div class="category-container">

    <div class="bookcards-container">

        <% for(Book bk:bklist){ %>
        <jsp:include page="bookscards.jsp">
            <jsp:param name="bookid" value="<%= bk.getBookid() %>"/>
            <jsp:param name="bookname" value="<%= bk.getBookname() %>"/>
            <jsp:param name="bookprice" value="<%= bk.getPrice() %>"/>
            <jsp:param name="bookauthor" value="<%= bk.getAuthor() %>"/>
            <jsp:param name="bookcategory" value="<%= bk.getCategory() %>"/>
        </jsp:include> 

        <% } %>

    </div>
</div>

<% } %>
