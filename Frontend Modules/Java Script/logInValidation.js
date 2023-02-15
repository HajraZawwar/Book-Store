const Length_validation = (name) => {
    if (name.length < 5 || name.length > 24) return false;

    return true;
}


const Email_validation = (email) => {
    if (email.length > 24) return false;
    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

    if (!email.match(mailformat)) return false;

    return true;
}


document.getElementById("loginButton").addEventListener("click", (e) => {
    e.preventDefault();

    let email = document.getElementById("email-box").value;
    let pass1 = document.getElementById("pass1-box").value;
    let error = document.getElementById("error");

    error.innerText = "";

    if (!Email_validation(email)) {
        error.innerText = "email is wrong";
        return;
    }

    // just one password exists...
    if (!Length_validation(pass1)) {
        error.innerText = "too short password";
        return;
    }

    document.getElementById("loginform").submit();


})
