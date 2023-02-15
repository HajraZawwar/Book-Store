<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log In page</title>
    <link rel="stylesheet" href="../Book Store Project/Frontend Modules/CSS files/Login_style.css">
</head>

<body>
    <div class="outer-div">
        <div class="form-holder heading">
            <h1 class="text-middle">Log In</h1>

            <jsp:include page="error.jsp"/>

            <form action="logInPage" method="post" id="loginform">

                <div class="form-item">
                    <label for="email">Enter Email:</label>
                    <input id="email-box" type="text" name="email">
                </div>
                <div class="form-item">
                    <label for="password">Enter Password</label>
                    <input id="pass1-box" id="passowrd1" type="text" name="password">
                </div>

                <div class="form-item">
                    <input id="loginButton" class="submission" type="submit" value="Log In">
                </div>

                <h3> <a class="pagelink" href="SignUp.jsp">SignUp </a> if you are not registered </h3>

                
            </form>
        </div>
    </div>

    <script src="../../../Book Store Project/Frontend Modules/Java Script/logInValidation.js"></script>

</body>

</html>
