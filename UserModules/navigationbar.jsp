
    <%@ page import="Pack.*" %>
    <% Verifier v=new Verifier(); if(!v.is_Customer(session)){ out.println("Not allowed on this page please login"); return; } %>
    
    <% 
    String user_email=(String)session.getAttribute("email");
    Customer current=new CustomerDAO().get_customer_byEmail(user_email);
     %>
    <div class="navbar">
        <div class="nav-items">
            <img src="" alt="">
        </div>
        <div class="nav-items">
            <div class="whitelink links"><a href="/Book%20Store%20Project/UserModules/userhomepage.jsp?viewtype=home"> Home</a> </div>
            <div class="links"><a href="/Book%20Store%20Project/UserModules/userhomepage.jsp?viewtype=home"> Categories</a> </div>
            <div class="links"><a href="/Book%20Store%20Project/UserModules/userhomepage.jsp?viewtype=orders"> Orders</a> </div>
            <div class="links"><a href="/Book%20Store%20Project/UserModules/userhomepage.jsp?viewtype=cart"> Cart</a> </div>
            <div class="cart-links">
                <div class="links"><a href="/Book%20Store%20Project/UserModules/userhomepage.jsp?viewtype=wishlist"> <img class="icons" src="../UserModules/Resources/icons8-favorite-96.png" alt=""> </a> </div>
            </div>
        </div>

                <!-- Here make the search button -->
        <div class="nav-items profile-section">
            <form id="search-form" action="/Book%20Store%20Project/UserModules/userhomepage.jsp">
                <div class="form-item search-container">
                    <input  name="info" class="search-input" type="text" placeholder="Search Something">
                   
                    <a href="#" id="submit-link">
                        <img class="icons" src="../../Book Store Project/UserModules/Resources/icons8-found-others-96.png" alt="">
                    </a>
                </div>
              
            </form>
          
            <img class="profile" src="https://media.gettyimages.com/id/1311857754/photo/studio-portrait-of-19-year-old-man-on-yellow-background.jpg?s=170667a&w=gi&k=20&c=TP5S3XacrHG51ldIrMtm7DrBMoehwdZJDgzYwfhsyKE=" alt="">
            <h6><%= current.getName() %></h4>
                <a href="/Book%20Store%20Project/UserModules/LogOut/logoutHandler.jsp" type="button" class="logout btn btn-primary">LogOut</a>

             
        </div>
    </div>

    <script src="../../Book Store Project/Frontend Modules/Java Script/form_submission.js"></script>

  

