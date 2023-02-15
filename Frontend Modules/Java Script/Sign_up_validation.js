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

const Validation = (name, email, pass1, pass2, error) => {
    
    error.innerText = "";
    if (!Length_validation(name)) {
        error.innerText = "name: shouledn't be empty and must be between 5-20 characters";
        return false;
    }


    if (!Email_validation(email)) {
        error.innerText = "email is wrong";
        return false;
    }

    // means we are signing up and both of the passwords exists....
    if (!Length_validation(pass1) || !Length_validation(pass2)) {
        error.innerText = "Password is wrong";
        return false;
    }

    // now check if the password matches or not....
    if (pass1 !== pass2) {
        error.innerText = "both of the password must be same";
        return false;
    }

    return true;

}

document.getElementById("signupButton").addEventListener('click', (e) => {
    e.preventDefault();

    let email = document.getElementById("email-box").value;
    let pass1 = document.getElementById("pass1-box").value;

    let error = document.getElementById("error");
    let name = document.getElementById("name-box").value;
    let pass2 = document.getElementById("pass2-box").value;

    if (Validation(name, email, pass1, pass2, error)) {
        document.getElementById("signform").submit();
    }
})

