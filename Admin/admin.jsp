<%@ page import="java.sql.*" %>
<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier();
 if(!v.is_Admin(session)){ 
    response.sendRedirect("/Book%20Store%20Project/"); return; } %>


<html>
<head>
<title> Welcome Page </title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="../../Book Store Project/mystyle.css">
<link rel="stylesheet" href="../../Book Store Project/Frontend Modules/CSS files/categoryStyle.css">


 </head>
<body>
<%
            String email=(String)session.getAttribute("email");
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3307/bookstore";
            Connection con = DriverManager.getConnection(url, "root", "umair");

            Statement st = con.createStatement();

            // first of all check is current user is admin or not...
            
            String query = "select * from admin where Email='" + email + "'";
            ResultSet data = st.executeQuery(query);

            if(data.next()){
                String name1=data.getString(1);

                String view_type=request.getParameter("view_type");
                request.setAttribute("name",name1);
                request.setAttribute("view_type",view_type);
             %>
               <jsp:include page="/Admin/adminhome.jsp">
                    <jsp:param name="view_type" value="books"/>
                 </jsp:include> 
           <% }else{
                out.println("tu mera putar chuti kr");
            }

            st.close(); st.close();

%>
</body>
</html>
