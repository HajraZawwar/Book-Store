<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier();
 if(!v.is_Admin(session)){ 
    response.sendRedirect("/Book%20Store%20Project/"); return; } %>

<%
    String current=request.getParameter("status");
    String oid=request.getParameter("order_id");

    ArrayList<Book>li=new OrdersDAO().GetOrderedBooks(oid);
    String order_id=request.getParameter("order_id");
    String user_email=request.getParameter("email");
    String price=request.getParameter("price");
    String quantity=request.getParameter("quantity");
    String status= request.getParameter("status");

    if(order_id==null || user_email==null || price==null || quantity==null || status==null){
        response.sendRedirect("/Book%20Store%20Project/Admin/admin.jsp?view_type=orders");
        return;
    }
 %>

   
   <h4> <span> Order Id: </span> <span class="order-info"> <%= order_id %> </span> </h4>
   <h4> <span> User Email: </span> <span class="order-info"> <%= user_email  %> </span> </h4>
   <h4> <span> Total Price: </span> <span class="order-info"> <%= price %> Pkr </span> </h4>
   <h4> <span> Total Quantity: </span> <span class="order-info"> <%= quantity%> </span> </h4>
   <h4> <span> Current Status: </span> <span class="order-info"> <%= status %> </span> </h4>
   
    <h3>Book Details</h3>
    <table class="table align-middle mb-0 bg-white">
        <thead class="bg-light">
            <tr>
                <th>Book Id</th>
                <th>Book Name</th>
                <th>Author Name</th>
                <th>Price</th>
                <th>Ordered Copies</th>
            </tr>
        </thead>
        <tbody>
            <%
            if(li==null){return; }
             for(Book bk:li){ %>
                <tr>
                    <td>
                        <div class="d-flex align-items-center">
                       <p >
                            <%= bk.getBookid() %>
                        </p>
                    </div>
                    </td>
                    <td>
                        <p class="fw-normal mb-1">
                            <%= bk.getBookname()  %>
                        </p>
                    </td>
                    <td>
                        <span class="fw-normal mb-1">
                            <%= bk.getAuthor() %>
                        </span>
                    </td>
                    <td>
                        <%= bk.getPrice() %> pkr
                    </td>
                    <td>
                        <%= bk.getCategory() %>
                    </td>
                   
                </tr>

                <% } %>

        </tbody>
    </table>
