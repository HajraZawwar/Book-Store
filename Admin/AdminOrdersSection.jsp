<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier();
 if(!v.is_Admin(session)){ 
    response.sendRedirect("/Book%20Store%20Project/"); return; } %>


        <% OrdersDAO order_dao=new OrdersDAO(); ArrayList<Order>li=order_dao.get_orders();

            if(li==null||li.size()==0){
            out.println("No odres yet..");
            return;
            }
            String status=null;
            String oid=null;
            String bg_col=null;
            String status_message=null;
            %>

            <h2>Orders: </h2>

            <table class="table align-middle mb-0 bg-white">
                <thead class="bg-light">
                    <tr>
                        <th>Order Id.</th>
                        <th>User Email</th>
                        <th>Status</th>
                        <th>Quantity</th>
                        <th>Total Price</th>
                        <th>Show Books</th>
                        <th>Change Status</th>
                        <th>Apply Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(Order od:li){
                         oid=od.getOrderid(); 
                         status=od.getStatus();
                          Utilities util=new Utilities();
                          status_message= new Utilities().get_statusMessage(status); 
                        bg_col=util.Get_Color(status); %>
                        <tr>
                            <td>
                                <div class="d-flex align-items-center">
                               <a style="color: blue;"
                                    href="/Book%20Store%20Project/Admin/admin.jsp?view_type=orderdetails&orderid=<%=oid%>">
                                    <%= oid %>
                                </a>
                            </div>
                            </td>
                            <td>
                                <p class="fw-normal mb-1">
                                    <%= od.getUseremail()  %>
                                </p>
                            </td>
                            <td>
                                <span class="badge badge-<%= bg_col %> rounded-pill d-inline">
                                    <%= od.getStatus() %>
                                </span>
                            </td>
                            <td>
                                <%= od.getQuantity() %> items
                            </td>
                            
                            <td>
                                <%= od.getTotalprice() %> Pkr
                            </td>

                            <td>
                                <a href="/Book%20Store%20Project/Admin/admin.jsp?view_type=orderdetails&orderid=<%=oid%>"
                                    " type="button" class="btn btn-link btn-sm btn-rounded">
                                    Show Books
                                </a>
                            </td>
                            <td>
                                <a class="link-danger" href="/Book%20Store%20Project/OrderModules/changeStatus.jsp?status=<%= status_message%>&orderid=<%=oid%>">
                                    <%= status_message %>
                                </a>
                            </td>
                            <td>
                               
                                <a href="/Book%20Store%20Project/OrderModules/removeorder.jsp?orderid=<%= oid%>" type="button" class="btn btn-link btn-sm btn-rounded">
                                    Cancel
                                </a>
                            </td>
                        </tr>

                        <% } %>

                </tbody>
            </table>
