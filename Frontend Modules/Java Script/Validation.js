const Length_validation = (name) => {
    if (name.length < 5 || name.length > 19) return false;

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
    if (name != null) {
        if (!Length_validation(name)) {
            error.innerText = "name: shouledn't be empty and must be between 5-20 characters";
            return false;
        }
    }

    if (!Email_validation(email)) {
        error.innerText = "email is wrong";
        return false;
    }
    if (pass2 != null) {

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
    } else {

        // just one password exists...
        if (!Length_validation(pass1)) {
            error.innerText = "too short password";
            return false;
        }
    }

    return true;

}
