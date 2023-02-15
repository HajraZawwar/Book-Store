<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier();
 if(!v.is_Admin(session)){ 
    response.sendRedirect("/Book%20Store%20Project/"); return; } %>

<%String id= request.getParameter("orderid");

if(id==null){
    out.println("No item id");
    return;
}
%>

<div class="details-container">
    <h2 class="banner">Order details</h2>
    <%
    Order od=new OrdersDAO().getAnOrder(id);
    
    %>

    <jsp:include page="/OrderModules/displayOrder.jsp">
        <jsp:param name="order_id" value="<%=od.getOrderid() %>"/>
        <jsp:param name="quantity" value="<%= od.getQuantity() %>"/>
        <jsp:param name="price" value="<%= od.getTotalprice()  %>"/>
        <jsp:param name="status" value="<%= od.getStatus()  %>"/>
        <jsp:param name="email" value="<%= od.getUseremail()  %>"/>
    </jsp:include>
</div>
