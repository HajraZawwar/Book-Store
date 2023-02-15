<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier();
 if(!v.is_Admin(session)){ 
    response.sendRedirect("/Book%20Store%20Project/"); return; } %>

    <%
    String[]pics={"https://cdn.waterstones.com/bookjackets/large/9781/5266/9781526652065.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRVyim1sOEJlsyqi8XtGIBKpW5He5iOzTKPg&usqp=CAU"};
     %>
            <div class="col-md-12 col-xl-12">
              <div class="card shadow-0 border rounded-3">
                <div class="card-body">
                  <div class="row">
                    <div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">
                      <div class="bg-image hover-zoom ripple rounded ripple-surface">
                        <img style="    height: 315px;" src=<%= pics[0]%>
                          class="w-100" />
                        <a href="#!">
                          <div class="hover-overlay">
                            <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                          </div>
                        </a>
                      </div>
                    </div>
                    <div class="col-md-6 col-lg-6 col-xl-6">

                      <h5 class="category"><%= request.getParameter("category") %></h5>
                      <h5><%= request.getParameter("BookName") %></h5>
                      <div class="d-flex flex-row">
                        <div class="text-danger mb-1 me-2">
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                        </div>
                        <span><%= request.getParameter("author") %></span>
                      </div>
                      
                      <p class=" mb-4 mb-md-0">
                        <%= request.getParameter("description") %>
                      </p>
                    </div>
                    <div class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
                      <div class="d-flex flex-row align-items-center mb-1">
                        <h4 class="mb-1">$<%= request.getParameter("price") %></h4>
                      </div>
                      
                      <% String bkid=request.getParameter("bkid"); %>
                      <div class="d-flex flex-column mt-2">
                        
                        <a href="/Book%20Store%20Project/Admin/removebook.jsp?bookid=<%=bkid%>" class="btn btn-primary btn-sm mt-2" type="button">
                          Remove Book
                        </a>
                        <a href="/Book%20Store%20Project/Admin/admin.jsp?view_type=updatebook&bookid=<%=bkid%>" class="btn btn-outline-primary btn-sm mt-2" type="button">
                          Update Book
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <%!
              public int get_price(){
              return 10;
              }
             %>


    

      

