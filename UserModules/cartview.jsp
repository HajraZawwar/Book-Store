<%@ page import="Pack.*" %>
<%@ page import="java.util.*" %>
<% Verifier v=new Verifier(); if(!v.is_Customer(session)){ out.println("Not allowed on this page please login"); return; } %>

    <%
    String email=(String)session.getAttribute("email");
    Book bk=new Book();
    BookDOA bkdoa=new BookDOA();
     
    ArrayList<Cart>li=new CartDAO().search_carts(email);
    if(li.size() < 1){
        out.println("Nothing in cart");
        return;
    }

    Utilities util=new Utilities();
    String sum_string=util.Find_Sum(li);
    String[]args=sum_string.split(",");
    int price=Integer.parseInt(args[0]);
    int items=Integer.parseInt(args[1]);
    
    %>
    <section class="pt-5 pb-5">
        <div class="container">
          <div class="row w-100">
              <div class="col-lg-12 col-md-12 col-12">
                  <h3 class="display-5 mb-2 text-center">Shopping Cart</h3>
                  <p class="mb-5 text-center">
                      <i class="text-info font-weight-bold"><%= items %></i> items in your cart</p>
                  <table id="shoppingCart" class="table table-condensed table-responsive">
                      <thead>
                          <tr>
                              <th style="width:60%">Product</th>
                              <th style="width:12%">Price</th>
                              <th style="width:10%">Quantity</th>
                              <th style="width:16%"></th>
                          </tr>
                      </thead>
                      <tbody>

                        <%
                        for(Cart ct:li){
                           
                            bk=bkdoa.getBook(ct.getItems());
                            if(bk!=null){
                        %>    
                        
                          <tr>
                              <td data-th="Product">
                                  <div class="row">
                                      <div class="col-md-3 text-left">
                                          <img src="https://via.placeholder.com/250x250/5fa9f8/ffffff" alt="" class="img-fluid d-none d-md-block rounded mb-2 shadow ">
                                      </div>
                                      <div class="col-md-9 text-left mt-sm-2">
                                          <h4><%= bk.getBookname() %></h4>
                                          <p class="font-weight-light"><%= bk.getAuthor() %></p>
                                      </div>
                                  </div>
                              </td>
                              <td data-th="Price"><%= bk.getPrice() %></td>
                              <td data-th="Quantity">
                                  <input type="number" class="form-control form-control-lg text-center" value="<%= ct.getQuantity() %>">
                              </td>
                              <td class="actions" data-th="">
                                  <div class="text-right">
                                      <a href="/Book%20Store%20Project/UserModules/RemoveCartHandler.jsp?cartid=<%= ct.getCartid() %>" class="btn btn-white border-secondary bg-white btn-md mb-2">
                                          Remove
                                      </a>
                                      
                                  </div>
                              </td>
                          </tr>

                          <%} } %>
                          
                      </tbody>
                  </table>
                  <div class="float-right text-right">
                      <h4>Subtotal:</h4>
                      <h1><%= price %>  </h1>
                  </div>
              </div>
          </div>
          <div class="row mt-4 d-flex align-items-center">
              <div class="col-sm-6 order-md-2 text-right">
                  <a href="/Book%20Store%20Project/OrderModules/PlaceOrderHandler.jsp?email=<%=email %>" class="btn btn-primary mb-4 btn-lg pl-5 pr-5">
                    Checkout
                </a>
              </div>
              <div class="col-sm-6 mb-3 mb-m-1 order-md-1 text-md-left">
                  <a href="/Book%20Store%20Project/UserModules/userhomepage.jsp?viewtype=home">
                      <i class="fas fa-arrow-left mr-2"></i> Continue Shopping</a>
              </div>
          </div>
      </div>
      </section>

