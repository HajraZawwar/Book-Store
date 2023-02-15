<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier(); if(!v.is_Customer(session)){ out.println("Not allowed on this page please login"); return; } %>

            <%
            String cartid=request.getParameter("cartid");
            if(cartid != null){
                CartDAO ctdao=new CartDAO();
                ctdao.remove_item(cartid);

                response.sendRedirect("/Book%20Store%20Project/UserModules/userhomepage.jsp?viewtype=cart");

            }

            %>
