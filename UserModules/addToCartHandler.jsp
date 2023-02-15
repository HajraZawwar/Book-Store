<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier(); if(!v.is_Customer(session)){ out.println("Not allowed on this page please login"); return; } %>

    <%
    String email=(String)session.getAttribute("email");
    String id=request.getParameter("bookid");
    
    BookDOA bkd=new BookDOA();
    Book bk= bkd.getBook(id);
    if(bk==null) out.println("can't Process... details are missing");
    else{
    String quantity = request.getParameter("quantity");
    if(quantity==null) quantity="1";
    int quant;
    try{
       quant= Integer.parseInt(quantity);
    }catch(Exception e){
        out.println("Wrong value of quantitiy Enter postive number..");
        return;
    }
    if(quant<1){
        out.println("Zero or less value is not acceptable");
        return;
    }
    String message = new CartDAO().CartEntry(email, bk, Integer.parseInt(quantity));

    if(message.equals("success")){
        response.sendRedirect("/Book%20Store%20Project/UserModules/userhomepage.jsp?viewtype=cart");
    }
    }
    %>
