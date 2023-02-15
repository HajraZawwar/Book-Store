<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier(); if(!v.is_Customer(session)){response.sendRedirect("/Book%20Store%20Project/");
            return; } %>
    <%
    String email=(String)session.getAttribute("email");

    WishListDAO wdao=new WishListDAO();
    ArrayList<Book>bklist=wdao.GetWishList(email);
        
        if(bklist==null){
                response.sendRedirect("/Book%20Store%20Project/UserModules/userhomepage.jsp");
                return;
        }

        if(bklist.size()<1){
                out.println("Your list is empty");
                return;
        }
    %>

    <div class="bookcards-container">

        <% 
        request.setAttribute("list","list");
        for(Book bk:bklist){ %>
        <jsp:include page="../bookscards.jsp">
            <jsp:param name="bookid" value="<%= bk.getBookid() %>"/>
            <jsp:param name="bookname" value="<%= bk.getBookname() %>"/>
            <jsp:param name="bookprice" value="<%= bk.getPrice() %>"/>
            <jsp:param name="bookauthor" value="<%= bk.getAuthor() %>"/>
            <jsp:param name="bookcategory" value="<%= bk.getCategory() %>"/>
        </jsp:include> 

        <% }
        request.removeAttribute("list");
         %>

    </div>

