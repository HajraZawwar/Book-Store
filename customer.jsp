<%@ page import="java.sql.*" %>

<html>
<head>
<title> Welcome Page </title>
 </head>
<body>
<h1>
<% if(session==null){ %>
<% response.sendRedirect("logIn.jsp"); %>
<% } %>

<% if (!((String) session.getAttribute("type")).equals("customer")) {
            out.println("Unauthorized Access .... Only Amdin can access this page");
            return;
        }
%>

<%
            String email=(String)session.getAttribute("email");
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3307/bookstore";
            Connection con = DriverManager.getConnection(url, "root", "umair");

            Statement st = con.createStatement();

            // first of all check is current user is admin or not...
            String query = "select * from customer where Email='" + email + "'";
            
            ResultSet data = st.executeQuery(query);

            if(data.next()){
                String name=data.getString(1);

                out.println("Welcome "+name+" as an customer on this page with email "+email);
            }else{
                out.println("tu mera putar chuti kr");
            }

            st.close(); st.close();

%>

</h1>
</body>
</html>
