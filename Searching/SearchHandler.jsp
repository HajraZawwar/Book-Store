    <%@ page import="Pack.*" %>
    <%@ page import="java.util.*" %>
    
    <%
    String info=request.getParameter("info");
    BookDOA bkdao = new BookDOA();
    ArrayList<Book> li = bkdao.BookSearch(info);
    
        for(Book bk:li){
            out.println(bk.getBookname());
        }
    %>
