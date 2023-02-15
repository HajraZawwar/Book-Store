<!DOCTYPE html>
<html lang="en">

<head>

    <link rel="stylesheet" href="../Book Store Project/Frontend Modules/CSS files/Login_style.css">
</head>

<body>
   
            <h5 id="error" class="text-middle error-message">
            <% String error_message=(String)request.getAttribute("error");
                if(error_message!=null){
                out.println(error_message);
                }else{
                    out.println("");
                }  %>
            </h5>
</body>

</html>
