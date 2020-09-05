const togglePassword = document.getElementById("password-checkbox"),
    messageChar = document.getElementById("message-length"),
    password = document.getElementById("password2"),
    messageDifferent = document.getElementById("message-different"),
    repeatedPassword = document.getElementById("repeated-password");

const passwordEqualityCheck = () => {
    if (repeatedPassword.value !== password.value)
        messageDifferent.innerText = "Пароли не совпадают! Введите одинаковые пароли";
    else
        messageDifferent.innerText = "";
}

const passwordLengthWarning = () => {
    let length = password.value.length;
    if (length < 5)
        messageChar.innerText = "Пароль должен содержать минимум 5 символов";
    else
        messageChar.innerText = "";
}

const showOrHidePassword = () => {
    if (password.getAttribute("type") === "password") {
        password.setAttribute("type", "text");
    } else {
        password.setAttribute("type", "password");
    }
};

password.addEventListener("keyup", passwordLengthWarning);
togglePassword.addEventListener("change", showOrHidePassword);
repeatedPassword.addEventListener("keyup", passwordEqualityCheck);