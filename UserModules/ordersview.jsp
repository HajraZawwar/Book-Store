<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier();
 if(!v.is_Customer(session)){ 
    response.sendRedirect("/Book%20Store%20Project/"); return; } %>

            <%
            String email=(String)session.getAttribute("email");
            OrdersDAO order_dao=new OrdersDAO();
            ArrayList<Order>li=order_dao.get_user_orders(email);

                if(li==null||li.size()==0){
                    out.println("No data exists here");
                    return;
                }
                String status=null;
                String oid=null;
                String bg_col=null;
            %>

<h2>Orders: </h2>

<table class="table align-middle mb-0 bg-white">
    <thead class="bg-light">
      <tr>
        <th>Order No.</th>
        <th>Total Price</th>
        <th>Status</th>
        <th>Quantity</th>
      </tr>
    </thead>
    <tbody>
        <%
        for(Order od:li){
            oid=od.getOrderid();
            status= od.getStatus();

            Utilities util=new Utilities();
            bg_col=util.Get_Color(status);
         %>
      <tr>
        <td>
          <div class="d-flex align-items-center">
           <h6><%= oid %></h6>
            </div>
          </div>
        </td>
        <td>
          <p class="fw-normal mb-1"><%= od.getTotalprice() %></p>
        </td>
        <td>
          <span class="badge badge-<%= bg_col %> rounded-pill d-inline"><%=  od.getStatus()  %></span>
        </td>
        <td><%=  od.getQuantity() %> items</td>
        
       </tr>
       
       <% } %>
      
    </tbody>
  </table>
